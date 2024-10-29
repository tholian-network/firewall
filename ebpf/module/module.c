#include <stdbool.h>
#include <linux/if_ether.h>
#include <linux/ip.h>
#include <linux/ipv6.h>
#include <linux/udp.h>
#include <linux/tcp.h>
#include <linux/icmp.h>
#include <linux/icmpv6.h>
#include <linux/in.h>

#include "../headers/common.h"
#include "../headers/bpf.h"
#include "../headers/bpf_helpers.h"
#include "../headers/bpf_endian.h"
#include "module.h"

struct ipv4_subnet {
	__u32 prefixlen;
	__u8  address[4];
};

struct ipv6_subnet {
	__u32 prefixlen;
	__u8  address[16];
};

// Max usage: ~16MB (16711425 bytes)
struct {
	__uint(type, BPF_MAP_TYPE_HASH);
	__uint(max_entries, 65535);
	__uint(key, 254);    // FQDN, host byte order (little endian)
	__type(value, __u8); // 1 = banned, 0 = unbanned
} domain_bans SEC(".maps");

// Max usage: ~590KB (589815 bytes)
struct {
	__uint(type, BPF_MAP_TYPE_LPM_TRIE);
	__uint(max_entries, 65535);
	__type(key, struct ipv4_subnet);  // ipv4 address, network byte order (big endian)
	__type(value, __u8); // 1 = banned, 0 = unbanned
	__uint(map_flags, BPF_F_NO_PREALLOC);
} ipv4_bans SEC(".maps");

// Max usage: ~1KB (1152 bytes)
struct {
	__uint(type, BPF_MAP_TYPE_LRU_HASH);
	__uint(max_entries, 128);
	__type(key, struct ipv4_subnet);  // ipv4 address, network byte order (big endian)
	__type(value, __u8); // (1 - 16) amount of warnings
} ipv4_warnings SEC(".maps");

// Max usage: ~1MB (1376235 bytes)
struct {
	__uint(type, BPF_MAP_TYPE_LPM_TRIE);
	__uint(max_entries, 65535);
	__type(key, struct ipv6_subnet); // ipv6 address, network byte order (big endian)
	__type(value, __u8); // 1 = banned, 0 = unbanned
	__uint(map_flags, BPF_F_NO_PREALLOC);
} ipv6_bans SEC(".maps");

// Max usage: ~2KB (2688 bytes)
struct {
	__uint(type, BPF_MAP_TYPE_LRU_HASH);
	__uint(max_entries, 128);
	__type(key, struct ipv6_subnet); // ipv6 address, network byte order (big endian)
	__type(value, __u8); // (1 - 16) amount of warnings
} ipv6_warnings SEC(".maps");

// Max usage: ~197KB (196605 bytes)
struct {
	__uint(type, BPF_MAP_TYPE_HASH);
	__uint(max_entries, 65535);
	__type(key, __u16);  // port number, network byte order (big endian)
	__type(value, __u8); // 1 = banned, 0 = unbanned
} port_bans SEC(".maps");



static __always_inline bool warn_ipv4(struct ipv4_subnet *subnet) {

	__u8 *warnings= NULL;

	warnings = bpf_map_lookup_elem(&ipv4_warnings, subnet);

	if (warnings != NULL) {

		__u8 value = 0;
		value = *warnings + 1;

		bpf_map_update_elem(&ipv4_warnings, subnet, &value, BPF_ANY);

		if (value > 16) {

			__u8 banned = 1;
			bpf_map_update_elem(&ipv4_bans, subnet, &banned, BPF_ANY);
			bpf_map_delete_elem(&ipv4_warnings, subnet);

		}

	} else {

		__u8 value = 1;
		bpf_map_update_elem(&ipv4_warnings, subnet, &value, BPF_ANY);

	}

	return true;

}

static __always_inline bool warn_ipv6(struct ipv6_subnet *subnet) {

	__u8 *warnings = NULL;

	warnings = bpf_map_lookup_elem(&ipv6_warnings, subnet);

	if (warnings != NULL) {

		__u8 value = 0;
		value = *warnings + 1;

		bpf_map_update_elem(&ipv6_warnings, subnet, &value, BPF_ANY);

		if (value > 16) {

			__u8 banned = 1;
			bpf_map_update_elem(&ipv6_bans, subnet, &banned, BPF_ANY);
			bpf_map_delete_elem(&ipv6_warnings, subnet);

		}

	} else {

		__u8 value = 1;
		bpf_map_update_elem(&ipv6_warnings, subnet, &value, BPF_ANY);

	}

	return true;

}

static __always_inline bool is_filtered_ipv4(struct ipv4_subnet *subnet) {

	__u8 *banned = NULL;

	banned = bpf_map_lookup_elem(&ipv4_bans, subnet);

	if (banned != NULL && banned != 0) {
		return true;
	}

	return false;

}

static __always_inline bool is_filtered_ipv6(struct ipv6_subnet *subnet) {

	__u8 *banned = NULL;

	banned = bpf_map_lookup_elem(&ipv6_bans, subnet);

	if (banned != NULL && banned != 0) {
		return true;
	}

	return false;

}

static __always_inline bool is_filtered_port(__u16 port) {

	__u8 *blocked_port = NULL;

	blocked_port = bpf_map_lookup_elem(&port_bans, &port);

	if (blocked_port != NULL && blocked_port != 0) {
		return true;
	}

	return false;

}

static __always_inline bool is_filtered_icmp_packet(struct icmphdr *icmp_header) {

	int type = icmp_header->type;

	if (
		type == 0 // echo reply
		|| type == 1 // reserved
		|| type == 2 // reserved
		|| type == 4 // source quench
		|| type == 6 // deprecated (alternate host address)
		|| type == 7 // reserved
		|| type == 8 // echo request
		|| type == 9 // router advertisement
		|| type == 10 // router solicitation
		|| type == 13 // timestamp request
		|| type == 14 // timestamp reply
		|| type == 15 // deprecated (information request)
		|| type == 16 // deprecated (information reply)
		|| type == 17 // deprecated (address mask request)
		|| type == 18 // deprecated (address mask reply)
		|| type == 19 // reserved
		|| (type >= 20 && type <= 41) // reserved
		|| type == 42 // extended echo request
		|| type == 43 // extended echo request
		|| (type >= 44 && type <= 255) // reserved
	) {
		return true;
	}

	return false;

}

static __always_inline bool is_filtered_icmp6_packet(struct icmp6hdr *icmp6_header) {

	int type = icmp6_header->icmp6_type;

	if (
		type == 0 // echo reply
		|| type == 1 // reserved
		|| type == 2 // reserved
		|| type == 4 // source quench
		|| type == 6 // deprecated (alternate host address)
		|| type == 7 // reserved
		|| type == 8 // echo request
		|| type == 9 // router advertisement
		|| type == 10 // router solicitation
		|| type == 13 // timestamp request
		|| type == 14 // timestamp reply
		|| type == 15 // deprecated (information request)
		|| type == 16 // deprecated (information reply)
		|| type == 17 // deprecated (address mask request)
		|| type == 18 // deprecated (address mask reply)
		|| type == 19 // reserved
		|| (type >= 20 && type <= 41) // reserved
		|| type == 42 // extended echo request
		|| type == 43 // extended echo request
		|| (type >= 44 && type <= 127) // reserved
		|| type == 128 // echo request
		|| type == 129 // echo reply
		|| type == 133 // router solicitation
		|| type == 134 // router advertisement
		|| type == 135 // neighbor solicitation
		|| type == 136 // neighbor advertisement
		|| type == 150 // reserved
		|| type == 151 // multicast router advertisement
		|| type == 152 // multicast router solicitation
		|| type == 153 // multicast router termination
		|| type == 154 // reserved
		|| (type >= 156 && type <= 255) // reserved
	) {
		return true;
	}

	return false;

}

static __always_inline bool is_filtered_nmap_tcp_scan(struct tcphdr *tcp_header) {

	if (
		tcp_header->fin == 1
		&& tcp_header->syn == 0
		&& tcp_header->rst == 0
		&& tcp_header->psh == 0
		&& tcp_header->ack == 0
		&& tcp_header->urg == 0
		&& tcp_header->ece == 0
		&& tcp_header->cwr == 0
	) {
		return true;
	}
	
	// nmap -sT
	if (
		tcp_header->fin == 0
		&& tcp_header->syn == 0
		&& tcp_header->rst == 1
		&& tcp_header->psh == 0
		&& tcp_header->ack == 1
		&& tcp_header->urg == 0
		&& tcp_header->ece == 0
		&& tcp_header->cwr == 0
		&& tcp_header->window == 0
	) {
		return true;
	}
	
	return false;

}

static __always_inline bool is_likely_nmap_tcp_scan(struct tcphdr *tcp_header) {

	// nmap -sP
	// nmap -P0
	if (
		tcp_header->fin == 0
		&& tcp_header->cwr == 0
		&& tcp_header->ece == 0
		&& tcp_header->ack == 0
		&& tcp_header->psh == 0
		&& tcp_header->rst == 0
		&& tcp_header->syn == 1
		&& tcp_header->window == 61690
	) {
		return true;
	}

	return false;

}



SEC("xdp")
int xdp_prog_main(struct xdp_md *ctx) {

	// Initialize data.
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;

	if (data + sizeof(struct ethhdr) > data_end) {
		return XDP_DROP;
	}

	int ethernet_protocol;
	struct hdr_cursor cursor;
	struct ethhdr *ethernet_header = NULL;
    struct iphdr *ipv4_header = NULL;
    struct ipv6hdr *ipv6_header = NULL;

	cursor.pos = data;
	ethernet_protocol = parse_ethhdr(&cursor, data_end, &ethernet_header);

	// struct udphdr *udp_header = NULL;

	// __u16 ipv4_port = 0;
	// __u16 ipv6_port = 0;

	if (ethernet_protocol == bpf_htons(ETH_P_IP)) {

		int protocol = parse_iphdr(&cursor, data_end, &ipv4_header);

		struct ipv4_subnet ipv4_source;
		ipv4_source.prefixlen = 32;

		struct ipv4_subnet ipv4_dest;
		ipv4_dest.prefixlen = 32;

		if (ipv4_header) {

			memcpy(&ipv4_source.address, &ipv4_header->saddr, sizeof(ipv4_source.address));
			memcpy(&ipv4_dest.address, &ipv4_header->daddr, sizeof(ipv4_dest.address));

			if (is_filtered_ipv4(&ipv4_source) == true) {

#ifdef ENABLE_DEBUG
				// bpf_printk("Banned %pI4", &ipv4_source.address);
#endif

				return XDP_DROP;

			} else if (is_filtered_ipv4(&ipv4_dest) == true) {

#ifdef ENABLE_DEBUG
				// bpf_printk("Banned %pI4", &ipv4_dest.address);
#endif

				return XDP_DROP;

			}

		}

		if (protocol == IPPROTO_UDP) {

			struct udphdr *udp_header = NULL;

			int length = parse_udphdr(&cursor, data_end, &udp_header);
			if (length < 0) {
				return XDP_DROP;
			}

			__u16 port_source = udp_header->source;

			// remote port is filtered
			if (is_filtered_port(port_source) == true) {
				return XDP_DROP;
			}

			__u16 port_dest = udp_header->dest;

			// local port is filtered
			if (is_filtered_port(port_dest) == true) {
				return XDP_DROP;
			}

#ifdef ENABLE_DNSFILTER

			if (
				port_source == bpf_htons(53)
				|| port_source == bpf_htons(853)
				|| port_source == bpf_htons(5353)
				|| port_dest == bpf_htons(53)
				|| port_dest == bpf_htons(853)
				|| port_dest == bpf_htons(5353)
			) {

				struct dnshdr *dns_header = NULL;

				int length = parse_dnshdr(&cursor, data_end, &dns_header);
				if (length < 0) {
					return XDP_DROP;
				}

				bpf_printk("ETH_P_IP/UDP port %d -> %d", bpf_ntohs(port_source), bpf_ntohs(port_dest));
				bpf_printk("%pI4", &ipv4_source.address);
				bpf_printk("%pI4", &ipv4_dest.address);

			}

#endif

		} else if (protocol == IPPROTO_TCP) {

			struct tcphdr *tcp_header = NULL;

			int length = parse_tcphdr(&cursor, data_end, &tcp_header);

			if (length < 0) {
				return XDP_DROP;
			}

			if (is_filtered_nmap_tcp_scan(tcp_header) == true) {
				return XDP_DROP;
			} else if (is_likely_nmap_tcp_scan(tcp_header) == true) {
				warn_ipv4(&ipv4_source);
			}

			__u16 port_source = tcp_header->source;

			// remote port is filtered
			if (is_filtered_port(port_source) == true) {
				return XDP_DROP;
			}

			__u16 port_dest = tcp_header->dest;

			// local port is filtered
			if (is_filtered_port(port_dest) == true) {
				return XDP_DROP;
			}

#ifdef ENABLE_DNSFILTER

			if (
				port_source == bpf_htons(53)
				|| port_source == bpf_htons(853)
				|| port_source == bpf_htons(5353)
				|| port_dest == bpf_htons(53)
				|| port_dest == bpf_htons(853)
				|| port_dest == bpf_htons(5353)
			) {

				// TODO: struct dnshdr *dns_header = NULL;
				// TODO: dnshdr is offsetted by two bytes which represent the length

			}

#endif

		} else if (protocol == IPPROTO_ICMP) {

			struct icmphdr *icmp_header = NULL;

			parse_icmphdr(&cursor, data_end, &icmp_header);

			if (icmp_header && is_filtered_icmp_packet(icmp_header) == true) {
				return XDP_DROP;
			}

#ifdef ENABLE_DEBUG
			// bpf_printk("ETH_P_IP/ICMP");
			// bpf_printk("%pI4", &ipv4_source.address);
			// bpf_printk("%pI4", &ipv4_dest.address);
#endif

		}

		return XDP_PASS;

	} else if (ethernet_protocol == bpf_htons(ETH_P_IPV6)) {

		int protocol = parse_ipv6hdr(&cursor, data_end, &ipv6_header);

		struct ipv6_subnet ipv6_source;
        ipv6_source.prefixlen = 128;

		struct ipv6_subnet ipv6_dest;
		ipv6_dest.prefixlen = 128;

		if (ipv6_header) {

			memcpy(&ipv6_source.address, &ipv6_header->saddr.in6_u.u6_addr32, sizeof(ipv6_source.address));
			memcpy(&ipv6_dest.address, &ipv6_header->daddr.in6_u.u6_addr32, sizeof(ipv6_dest.address));

			if (is_filtered_ipv6(&ipv6_source) == true) {

#ifdef ENABLE_DEBUG
				// bpf_printk("Banned %pI6", &ipv6_source.address);
#endif

				return XDP_DROP;

			} else if (is_filtered_ipv6(&ipv6_dest) == true) {

#ifdef ENABLE_DEBUG
				// bpf_printk("Banned %pI6", &ipv6_dest.address);
#endif

				return XDP_DROP;

			}

			if (protocol == IPPROTO_UDP) {

				struct udphdr *udp_header = NULL;

				int length = parse_udphdr(&cursor, data_end, &udp_header);
				if (length < 0) {
					return XDP_DROP;
				}

				__u16 port_source = udp_header->source;

				// remote port is filtered
				if (is_filtered_port(port_source) == true) {
					return XDP_DROP;
				}

				__u16 port_dest = udp_header->dest;

				// local port is filtered
				if (is_filtered_port(port_dest) == true) {
					return XDP_DROP;
				}

#ifdef ENABLE_DNSFILTER

				if (
					port_source == bpf_htons(53)
					|| port_source == bpf_htons(853)
					|| port_source == bpf_htons(5353)
					|| port_dest == bpf_htons(53)
					|| port_dest == bpf_htons(853)
					|| port_dest == bpf_htons(5353)
				) {

					// TODO: struct dnshdr *dns_header = NULL;

				}

#endif

			} else if (protocol == IPPROTO_TCP) {

				struct tcphdr *tcp_header = NULL;

				int length = parse_tcphdr(&cursor, data_end, &tcp_header);

				if (length < 0) {
					return XDP_DROP;
				}

				if (is_filtered_nmap_tcp_scan(tcp_header) == true) {
					return XDP_DROP;
				} else if (is_likely_nmap_tcp_scan(tcp_header) == true) {
					warn_ipv6(&ipv6_source);
				}

				__u16 port_source = tcp_header->source;

				// remote port is filtered
				if (is_filtered_port(port_source) == true) {
					return XDP_DROP;
				}

				__u16 port_dest = tcp_header->dest;

				// local port is filtered
				if (is_filtered_port(port_dest) == true) {
					return XDP_DROP;
				}

#ifdef ENABLE_DNSFILTER

				if (
					port_source == bpf_htons(53)
					|| port_source == bpf_htons(853)
					|| port_source == bpf_htons(5353)
					|| port_dest == bpf_htons(53)
					|| port_dest == bpf_htons(853)
					|| port_dest == bpf_htons(5353)
				) {

					// TODO: struct dnshdr *dns_header = NULL;

				}

#endif

			} else if (protocol == IPPROTO_ICMP) {

				struct icmphdr *icmp_header = NULL;

				parse_icmphdr(&cursor, data_end, &icmp_header);

				if (icmp_header && is_filtered_icmp_packet(icmp_header) == true) {
					return XDP_DROP;
				}

#ifdef ENABLE_DEBUG
				// bpf_printk("ETH_P_IP/ICMP");
				// bpf_printk("%pI6", &ipv6_source.address);
				// bpf_printk("%pI6", &ipv6_dest.address);
#endif

			} else if (protocol == IPPROTO_ICMPV6) {

				struct icmp6hdr *icmp6_header = NULL;

				parse_icmp6hdr(&cursor, data_end, &icmp6_header);

				if (icmp6_header && is_filtered_icmp6_packet(icmp6_header) == true) {
					return XDP_DROP;
				}

#ifdef ENABLE_DEBUG
				// bpf_printk("ETH_P_IP/ICMP6");
				// bpf_printk("%pI6", &ipv6_source.address);
				// bpf_printk("%pI6", &ipv6_dest.address);
#endif

			}

		}

	}

	return XDP_PASS;

}

char _license[] SEC("license") = "GPL";
