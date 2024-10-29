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
	__u16 transaction_id;
	__u8 rd: 1;       // Recursion desired
	__u8 tc: 1;       // Truncated
	__u8 aa: 1;       // Authoritive answer
	__u8 opcode: 4;   // Opcode
	__u8 qr: 1;       // Query/response flag
	__u8 rcode: 4;    // Response code
	__u8 cd: 1;       // Checking disabled
	__u8 ad: 1;       // Authenticated data
	__u8 z: 1;        // Z reserved bit
	__u8 ra: 1;       // Recursion available
	__u16 q_count;    // Number of questions
	__u16 ans_count;  // Number of answer RRs
	__u16 auth_count; // Number of authority RRs
	__u16 add_count;  // Number of resource RRs
};

struct dnsquestion {
	char name[256];
	__u16 type;
	__u16 class;
};

struct dnsrecord {
	char name[256];
	__u16 type;
	__u16 class;
	__u32 ttl;
	__u16 data_length;
	char data[65535];
};

// TODO: Integrate other DNS types here, from IANA's list
// https://www.iana.org/assignments/dns-parameters/dns-parameters.xhtml
enum {
	DNS_TYPE_A = 1,
	DNS_TYPE_NS = 2,
	DNS_TYPE_CNAME = 5,
	DNS_TYPE_MX = 15,
	DNS_TYPE_TXT = 16,
	DNS_TYPE_AAAA = 28,
	DNS_TYPE_LOC = 29,
	DNS_TYPE_SRV = 33,
};

enum {
	DNS_CLASS_INTERNET = 1,
	DNS_CLASS_SCIENCENET = 2, // deprecated
	DNS_CLASS_CHAOSNET = 3,   // deprecated
	DNS_CLASS_HESOIDNET = 4   // deprecated
};

// TODO: This is used as network response in case it was blocked on DNS level
// struct dnsresponse {
//    __u16 query_pointer;
//    __u16 record_type;
//    __u16 record_class;
//    __u32 ttl;
//    __u16 data_length;
// } __attribute__((packed));

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

#ifdef ENABLE_DNSFILTER
static __always_inline int parse_dnshdr(struct hdr_cursor *nh, void *data_end, struct dnshdr **dnshdr) {

	int len;
	struct dnshdr *dnsh = nh->pos;

	if (dnsh + 1 > data_end) {
		return -1;
	}

	nh->pos = dnsh + 1;
	*dnshdr = dnsh;

	return len;

}
#endif

static __always_inline int parse_tcphdr(struct hdr_cursor *nh, void *data_end, struct tcphdr **tcphdr) {

	int len;
	struct tcphdr *tcph = nh->pos;

	if (tcph + 1 > data_end) {
		return -1;
	}

	len = tcph->doff * 4;
	if ((void *) tcph + len > data_end) {
		return -1;
	}

	nh->pos = tcph + 1;
	*tcphdr = tcph;

	return len;

}



#endif
