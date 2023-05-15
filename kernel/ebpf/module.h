#ifndef __MODULE_H
#define __MODULE_H

#include <linux/types.h>

#ifndef __u128
#define __u128 __uint128_t
#endif

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

#endif
