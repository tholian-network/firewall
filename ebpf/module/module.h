#ifndef __MODULE_H
#define __MODULE_H

#include <linux/if_ether.h>
#include <linux/if_packet.h>
#include <linux/types.h>
#include <linux/ip.h>
#include <linux/ipv6.h>
#include <linux/icmp.h>
#include <linux/icmpv6.h>
#include <linux/udp.h>
#include <linux/tcp.h>
#include <linux/in.h>
#include <bpf/bpf_endian.h>

#ifndef __u128
#define __u128 __uint128_t
#endif

#ifndef VLAN_MAX_DEPTH
#define VLAN_MAX_DEPTH 4
#endif

#ifndef IPV6EXT_MAX_DEPTH
#define IPV6EXT_MAX_DEPTH 6
#endif

#ifndef DNS_MAX_NAME_BYTES
#define DNS_MAX_NAME_BYTES 128
#endif

#define FNV_OFFSET 14695981039346656037ULL
#define FNV_PRIME  1099511628211ULL

struct hdr_cursor {
	void *pos;
};

/*
 *	struct vlanhdr - vlan header
 *	@h_vlan_TCI: priority and VLAN ID
 *	@h_vlan_encapsulated_proto: packet type ID or len
 */

struct vlanhdr {
	__be16 h_vlan_TCI;
	__be16 h_vlan_encapsulated_proto;
};

struct dnshdr {
	__be16 transaction_id;
	__be16 flags;
	__be16 q_count;
	__be16 ans_count;
	__be16 auth_count;
	__be16 add_count;
};

enum {
	DNS_CLASS_INTERNET = 1,
	DNS_CLASS_SCIENCENET = 2, // deprecated
	DNS_CLASS_CHAOSNET = 3,   // deprecated
	DNS_CLASS_HESOIDNET = 4   // deprecated
};

#ifndef memcpy
#define memcpy(dest, src, n) __builtin_memcpy((dest), (src), (n))
#endif

static __always_inline int proto_is_vlan(__u16 h_proto) {
	return !!(h_proto == bpf_htons(ETH_P_8021Q) || h_proto == bpf_htons(ETH_P_8021AD));
}

static __always_inline int skip_ip6hdrext(struct hdr_cursor *nh, void *data_end, __u8 next_hdr_type) {

	for (int i = 0; i < IPV6EXT_MAX_DEPTH; ++i) {

		struct ipv6_opt_hdr *hdr = nh->pos;

		if (hdr + 1 > data_end) {
			return -1;
		}

		switch (next_hdr_type) {

			case IPPROTO_HOPOPTS:
			case IPPROTO_DSTOPTS:
			case IPPROTO_ROUTING:
			case IPPROTO_MH:
				nh->pos = (char *)hdr + (hdr->hdrlen + 1) * 8;
				next_hdr_type = hdr->nexthdr;
				break;
			case IPPROTO_AH:
				nh->pos = (char *)hdr + (hdr->hdrlen + 2) * 4;
				next_hdr_type = hdr->nexthdr;
				break;
			case IPPROTO_FRAGMENT:
				nh->pos = (char *)hdr + 8;
				next_hdr_type = hdr->nexthdr;
				break;
			default:
				return next_hdr_type;

		}

	}

	return -1;

}

static __always_inline int parse_ethhdr(struct hdr_cursor *nh, void *data_end, struct ethhdr **ethhdr) {

	struct ethhdr *eth = nh->pos;
	struct vlanhdr *vlh;
	__u16 h_proto;
	int i;

	if (eth + 1 > data_end)
		return -1;

	nh->pos = eth + 1;
	*ethhdr = eth;
	vlh = nh->pos;
	h_proto = eth->h_proto;

	/* Use loop unrolling to avoid the verifier restriction on loops;
	 * support up to VLAN_MAX_DEPTH layers of VLAN encapsulation.
	 */
	#pragma unroll
	for (i = 0; i < VLAN_MAX_DEPTH; i++) {

		if (!proto_is_vlan(h_proto)) {
			break;
		}

		if (vlh + 1 > data_end) {
			break;
		}

		h_proto = vlh->h_vlan_encapsulated_proto;
		vlh++;

	}

	nh->pos = vlh;

	return h_proto; /* network-byte-order */

}

static __always_inline int parse_iphdr(struct hdr_cursor *nh, void *data_end, struct iphdr **iphdr) {

	struct iphdr *iph = nh->pos;
	int hdrsize;

	if (iph + 1 > data_end) {
		return -1;
	}

	hdrsize = iph->ihl * 4;

	/* Variable-length IPv4 header, need to use byte-based arithmetic */
	if (nh->pos + hdrsize > data_end) {
		return -1;
	}

	nh->pos += hdrsize;
	*iphdr = iph;

	return iph->protocol;

}

static __always_inline int parse_icmphdr(struct hdr_cursor *nh, void *data_end, struct icmphdr **icmphdr) {

	struct icmphdr *icmph = nh->pos;

	if (icmph + 1 > data_end) {
		return -1;
	}

	nh->pos  = icmph + 1;
	*icmphdr = icmph;

	return icmph->type;

}

static __always_inline int parse_ipv6hdr(struct hdr_cursor *nh, void *data_end, struct ipv6hdr **ip6hdr) {

	struct ipv6hdr *ip6h = nh->pos;

	if (ip6h + 1 > data_end) {
		return -1;
	}

	nh->pos = ip6h + 1;
	*ip6hdr = ip6h;

	return skip_ip6hdrext(nh, data_end, ip6h->nexthdr);

}

static __always_inline int parse_icmp6hdr(struct hdr_cursor *nh, void *data_end, struct icmp6hdr **icmp6hdr) {

	struct icmp6hdr *icmp6h = nh->pos;

	if (icmp6h + 1 > data_end) {
		return -1;
	}

	nh->pos   = icmp6h + 1;
	*icmp6hdr = icmp6h;

	return icmp6h->icmp6_type;

}

static __always_inline int parse_udphdr(struct hdr_cursor *nh, void *data_end, struct udphdr **udphdr) {

	int len;
	struct udphdr *udph = nh->pos;

	if (udph + 1 > data_end) {
		return -1;
	}

	nh->pos = udph + 1;
	*udphdr = udph;

	len = bpf_ntohs(udph->len) - sizeof(struct udphdr);
	if (len < 0) {
		return -1;
	}

	return len;

}

static __always_inline int parse_tcphdr(struct hdr_cursor *nh, void *data_end, struct tcphdr **tcphdr) {

	int len;
	struct tcphdr *tcph = nh->pos;

	if (tcph + 1 > data_end) {
		return -1;
	}

	len = tcph->doff * 4;
	if (len < (int)sizeof(struct tcphdr)) {
		return -1;
	}

	if ((void *) tcph + len > data_end) {
		return -1;
	}

	nh->pos = (char *) tcph + len;
	*tcphdr = tcph;

	return len;

}

#ifdef ENABLE_DNSFILTER

static __always_inline int parse_dnshdr(struct hdr_cursor *nh, void *data_end, struct dnshdr **dnshdr) {

	struct dnshdr *dnsh = nh->pos;

	if (dnsh + 1 > data_end) {
		return -1;
	}

	nh->pos = dnsh + 1;
	*dnshdr = dnsh;

	return (int)sizeof(struct dnshdr);

}

static __always_inline void *dns_hash_wire(const char *start, void *data_end, __u64 *out_hash) {

	__u64 hash = FNV_OFFSET;
	const char *base = start;

	for (int i = 0; i < DNS_MAX_NAME_BYTES; i++) {

		if ((void *) base + i + 1 > data_end) {
			return NULL;
		}

		__u8 b = *((const __u8 *) base + i);

		if ((b & 0xc0) == 0xc0) {

			if ((void *) base + i + 2 > data_end) {
				return NULL;
			}

			*out_hash = 0;
			return (void *) (base + i + 2);

		}

		__u8 c = b;

		if (c >= 'A' && c <= 'Z') {
			c = c | 0x20;
		}

		hash ^= c;
		hash *= FNV_PRIME;

		if (b == 0) {
			*out_hash = hash;
			return (void *) (base + i + 1);
		}

	}

	return NULL;

}

#endif

#endif
