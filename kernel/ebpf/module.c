#include <linux/if_ether.h>
#include <linux/ip.h>
#include <linux/ipv6.h>
#include <linux/udp.h>
#include <linux/tcp.h>
#include <linux/icmp.h>
#include <linux/icmpv6.h>
#include <linux/in.h>

#include "../headers/bpf_helpers.h"
#include "../headers/bpf_endian.h"
#include "../headers/common.h"
#include "module.h"



struct {
	__uint(type, BPF_MAP_TYPE_HASH);
	__uint(max_entries, 65535);
	__type(key, __u16);  // port number
	__type(value, __u8); // 1 = banned, 0 = unbanned
} port_bans SEC(".maps");

struct {
	__uint(type, BPF_MAP_TYPE_HASH);
	__uint(max_entries, 500000);
	__type(key, __u32);  // ipv4 address
	__type(value, __u8); // 1 = banned, 0 = unbanned
} ipv4_bans SEC(".maps");

struct {
	__uint(type, BPF_MAP_TYPE_HASH);
	__uint(max_entries, 500000);
	__type(key, __u128); // ipv6 address
	__type(value, __u8); // 1 = banned, 0 = unbanned
} ipv6_bans SEC(".maps");

// TODO: Filter out cloudflare-dns and google-dns requests that are done via DNS over HTTPS
// So all traffic to 1.0.0.1, 1.1.1.1, 8.8.4.4, 8.8.8.8 must be blocked, probably

#ifdef ENABLE_DNSFILTER
static __always_inline int is_malicious_dns_packet(struct dnshdr *dns_header) {

	// TODO: If dns question, filter blocked IPs in subjects of PTR, SRV question
	// TODO: If dns response, filter blocked IPs in subjects of A, AAAA, CNAME, MX or NS records

	return 0;

}

static __always_inline int is_dns_exfiltration(struct dnshdr *dns_header) {

	// TODO: If dns question or response, filter out TXT records
	// TODO: If dns question or response, filter out LOC records

	return 0;

}
#endif

static __always_inline int is_nmap_scan(struct tcphdr *tcp_header) {

	if (
			tcp_header->fin == 1
			&& tcp_header->cwr == 0
			&& tcp_header->ece == 0
			&& tcp_header->ack == 0
			&& tcp_header->psh == 0
			&& tcp_header->rst == 0
			&& tcp_header->syn == 0
	) {
		return 1;
	}

	return 0;

}

#ifdef ENABLE_DNSFILTER
static __always_inline int parse_dns_question(struct xdp_md *ctx, struct dnshdr *dns_header, struct dnsquestion *dns_question, void *question_start) {

	void *data_end = (void *)(long)ctx->data_end;
	void *pointer = question_start;

	// TODO: This causes bpftool errors
	for (int i = 0; i < 512; i++) {
		dns_question->name[i] = 0;
	}

	// TODO: This causes bpftool errors
	dns_question->type = 0;
	dns_question->class = 0;

	for (int n = 0; n < 256; n++) {

		if (pointer < data_end) {

			if (*(char *)(pointer) == 0) {

				dns_question->type = __bpf_htons(*(__u16 *)(pointer + 1));
				dns_question->class = __bpf_htons(*(__u16 *)(pointer + 3));

				break;

			} else {

				dns_question->name[n] = *(char *)(pointer);
				pointer++;

			}

		} else {
			break;
		}

	}

	if (dns_question->type != 0) {
		return 1;
	}

	return 0;

};
#endif


SEC("xdp_prog")
int xdp_prog_main(struct xdp_md *ctx) {

	// Initialize data.
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;

	if (data + sizeof(struct ethhdr) > data_end) {
		return XDP_DROP;
	}

	struct ethhdr *ethernet_header = data;
    struct iphdr *ipv4_header = NULL;
    struct ipv6hdr *ipv6_header = NULL;

	struct udphdr *udp_header = NULL;
	struct tcphdr *tcp_header = NULL;
	struct icmphdr *icmp_header = NULL;
#ifdef ENABLE_DNSFILTER
	struct dnshdr *dns_header = NULL;
#endif

	__u8 *blocked_ip = NULL;
	__u32 ipv4_address = 0;
	__u128 ipv6_address = 0;

	__u8 *blocked_port = NULL;
	__u16 ipv4_port = 0;
	__u16 ipv6_port = 0;

	if (ethernet_header->h_proto == ETH_P_IPV6) {

		if (data + sizeof(*ethernet_header) + sizeof(struct ipv6hdr) < data_end) {

			ipv6_header = (data + sizeof(*ethernet_header));

			memcpy(&ipv6_address, &ipv6_header->saddr.in6_u.u6_addr32, sizeof(ipv6_address));

			if (ipv6_address != 0) {

				blocked_ip = bpf_map_lookup_elem(&ipv6_bans, &ipv6_address);

				if (blocked_ip != NULL && *blocked_ip != 0) {
					return XDP_DROP;
				}

			}

			if (ipv6_header->nexthdr == IPPROTO_UDP) {

				udp_header = (data + sizeof(*ethernet_header) + sizeof(*ipv6_header));

				if (udp_header + 1 <= (struct udphdr *)data_end) {

					ipv6_port = __bpf_htons(udp_header->dest);

					if (ipv6_port != 0) {

						blocked_port = bpf_map_lookup_elem(&port_bans, &ipv6_port);

						if (blocked_port != NULL && blocked_port != 0) {
							return XDP_DROP;
						}

					}

				}

#ifdef ENABLE_DNSFILTER
				// TODO: DNS Filtering
#endif

			} else if (ipv6_header->nexthdr == IPPROTO_TCP) {

				tcp_header = (data + sizeof(*ethernet_header) + sizeof(*ipv6_header));

				if (tcp_header + 1 <= (struct tcphdr *)data_end) {

					if (is_nmap_scan(tcp_header)) {
						return XDP_DROP;
					}

					ipv6_port = __bpf_htons(tcp_header->dest);

					if (ipv6_port != 0) {

						blocked_port = bpf_map_lookup_elem(&port_bans, &ipv6_port);

						if (blocked_port != NULL && blocked_port != 0) {
							return XDP_DROP;
						}

					}

				}

			} else if (ipv6_header->nexthdr == IPPROTO_ICMPV6) {

				icmp_header = (data + sizeof(*ethernet_header) + sizeof(*ipv6_header));

				if (icmp_header + 1 <= (struct icmphdr *)data_end) {

					if (
						icmp_header->type == 0 // echo reply
						|| icmp_header->type == 1 // reserved
						|| icmp_header->type == 2 // reserved
						|| icmp_header->type == 4 // source quench
						|| icmp_header->type == 6 // deprecated (alternate host address)
						|| icmp_header->type == 7 // reserved
						|| icmp_header->type == 8 // echo request
						|| icmp_header->type == 9 // router advertisement
						|| icmp_header->type == 10 // router solicitation
						|| icmp_header->type == 13 // timestamp request
						|| icmp_header->type == 14 // timestamp reply
						|| icmp_header->type == 15 // deprecated (information request)
						|| icmp_header->type == 16 // deprecated (information reply)
						|| icmp_header->type == 17 // deprecated (address mask request)
						|| icmp_header->type == 18 // deprecated (address mask reply)
						|| icmp_header->type == 19 // reserved
						|| (icmp_header->type >= 20 && icmp_header->type <= 41) // reserved
						|| icmp_header->type == 42 // extended echo request
						|| icmp_header->type == 43 // extended echo request
						|| (icmp_header->type >= 44 && icmp_header->type <= 127) // reserved
						|| icmp_header->type == 128 // echo request
						|| icmp_header->type == 129 // echo reply
						|| icmp_header->type == 133 // router solicitation
						|| icmp_header->type == 134 // router advertisement
						|| icmp_header->type == 135 // neighbor solicitation
						|| icmp_header->type == 136 // neighbor advertisement
						|| icmp_header->type == 150 // reserved
						|| icmp_header->type == 151 // multicast router advertisement
						|| icmp_header->type == 152 // multicast router solicitation
						|| icmp_header->type == 153 // multicast router termination
						|| icmp_header->type == 154 // reserved
						|| (icmp_header->type >= 156 && icmp_header->type <= 255) // reserved
					) {
						return XDP_DROP;
					}

				}

			} else if (ipv6_header->nexthdr == IPPROTO_ICMP) {

				icmp_header = (data + sizeof(*ethernet_header) + sizeof(*ipv6_header));

				if (icmp_header + 1 <= (struct icmphdr *)data_end) {

					if (
						icmp_header->type == 0 // echo reply
						|| icmp_header->type == 1 // reserved
						|| icmp_header->type == 2 // reserved
						|| icmp_header->type == 4 // source quench
						|| icmp_header->type == 6 // deprecated (alternate host address)
						|| icmp_header->type == 7 // reserved
						|| icmp_header->type == 8 // echo request
						|| icmp_header->type == 9 // router advertisement
						|| icmp_header->type == 10 // router solicitation
						|| icmp_header->type == 13 // timestamp request
						|| icmp_header->type == 14 // timestamp reply
						|| icmp_header->type == 15 // deprecated (information request)
						|| icmp_header->type == 16 // deprecated (information reply)
						|| icmp_header->type == 17 // deprecated (address mask request)
						|| icmp_header->type == 18 // deprecated (address mask reply)
						|| icmp_header->type == 19 // reserved
						|| (icmp_header->type >= 20 && icmp_header->type <= 41) // reserved
						|| icmp_header->type == 42 // extended echo request
						|| icmp_header->type == 43 // extended echo request
						|| (icmp_header->type >= 44 && icmp_header->type <= 255) // reserved
					) {
						return XDP_DROP;
					}

				}

			}

		} else {
			return XDP_DROP;
		}

	} else if (ethernet_header->h_proto == ETH_P_IP) {

		if (data + sizeof(*ethernet_header) + sizeof(struct iphdr) < data_end) {

			ipv4_header = (data + sizeof(*ethernet_header));

			memcpy(&ipv4_address, &ipv4_header->saddr, sizeof(ipv4_address));

			if (ipv4_address != 0) {

				blocked_ip = bpf_map_lookup_elem(&ipv4_bans, &ipv4_address);

				if (blocked_ip != NULL && *blocked_ip != 0) {
					return XDP_DROP;
				}

			}

			if (ipv4_header->protocol == IPPROTO_UDP) {

				udp_header = (data + sizeof(*ethernet_header) + sizeof(*ipv4_header));

				if (udp_header + 1 <= (struct udphdr *)data_end) {

					ipv4_port = __bpf_htons(udp_header->dest);

					if (ipv4_port != 0) {

						blocked_port = bpf_map_lookup_elem(&port_bans, &ipv4_port);

						if (blocked_port != NULL && blocked_port != 0) {
							return XDP_DROP;
						}

					}

#ifdef ENABLE_DNSFILTER
					if (data + sizeof(*ethernet_header) + sizeof(*ipv4_header) + sizeof(*udp_header) + sizeof(struct dnshdr) < data_end) {

						dns_header = (data + sizeof(*ethernet_header) + sizeof(*ipv4_header) + sizeof(*udp_header));

						if (dns_header) {

							if (dns_header->qr == 0 && dns_header->opcode == 0) {

								struct dnsquestion *dns_question = NULL;
								
								parse_dns_question(ctx, dns_header, dns_question, (void *)dns_header + sizeof(struct dnshdr));

								if (dns_question->class == DNS_CLASS_INTERNET) {

									if (dns_question->type == DNS_TYPE_A) {
									} else if (dns_question->type == DNS_TYPE_AAAA) {
									} else if (dns_question->type == DNS_TYPE_CNAME) {
									} else if (dns_question->type == DNS_TYPE_SRV) {
									} else if (dns_question->type == DNS_TYPE_TXT) {

										// TODO: Block DNS exfil attempt via TXT record

									}

									// TODO: Iterate over response records
									// TODO: If an A record is a blocked ipv4, return 127.0.0.1
									// TODO: If an AAAA record is a blocked ipv6, return ::1

									// TODO: return XDP_DROP in case the domains/subjects of the
									// question are blocked

								} else {
									return XDP_DROP;
								}


							} else if (dns_header->qr == 1 && dns_header->opcode == 0) {

								// TODO: Modify response in case the domain is blocked
								// TODO: Implement parse_dns_records() method

							}

						}

					}

#endif

				}

			} else if (ipv4_header->protocol == IPPROTO_TCP) {

				tcp_header = (data + sizeof(*ethernet_header) + sizeof(*ipv4_header));

				if (tcp_header + 1 <= (struct tcphdr *)data_end) {

					if (is_nmap_scan(tcp_header)) {
						return XDP_DROP;
					}

					ipv4_port = __bpf_htons(tcp_header->dest);

					if (ipv4_port != 0) {

						blocked_port = bpf_map_lookup_elem(&port_bans, &ipv4_port);

						if (blocked_port != NULL && blocked_port != 0) {
							return XDP_DROP;
						}

					}

				}

			} else if (ipv4_header->protocol == IPPROTO_ICMP) {

				icmp_header = (data + sizeof(*ethernet_header) + sizeof(*ipv4_header));

				if (icmp_header + 1 <= (struct icmphdr *)data_end) {

					if (
						icmp_header->type == 0 // echo reply
						|| icmp_header->type == 1 // reserved
						|| icmp_header->type == 2 // reserved
						|| icmp_header->type == 4 // source quench
						|| icmp_header->type == 6 // deprecated (alternate host address)
						|| icmp_header->type == 7 // reserved
						|| icmp_header->type == 8 // echo request
						|| icmp_header->type == 9 // router advertisement
						|| icmp_header->type == 10 // router solicitation
						|| icmp_header->type == 13 // timestamp request
						|| icmp_header->type == 14 // timestamp reply
						|| icmp_header->type == 15 // deprecated (information request)
						|| icmp_header->type == 16 // deprecated (information reply)
						|| icmp_header->type == 17 // deprecated (address mask request)
						|| icmp_header->type == 18 // deprecated (address mask reply)
						|| icmp_header->type == 19 // reserved
						|| (icmp_header->type >= 20 && icmp_header->type <= 41) // reserved
						|| icmp_header->type == 42 // extended echo request
						|| icmp_header->type == 43 // extended echo request
						|| (icmp_header->type >= 44 && icmp_header->type <= 255) // reserved
					) {
						return XDP_DROP;
					}

				}

			}

		} else {
			return XDP_DROP;
		}

	} else if (ethernet_header->h_proto == ETH_P_CAN) {

		// TODO

	} else if (ethernet_header->h_proto == ETH_P_CANFD) {

		// TODO

	} else if (ethernet_header->h_proto == ETH_P_CANXL) {

		// TODO

	}

	return XDP_PASS;

}

char _license[] SEC("license") = "GPL";
