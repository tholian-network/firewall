#pragma once

typedef unsigned char __u8;
typedef short int __s16;
typedef short unsigned int __u16;
typedef int __s32;
typedef unsigned int __u32;
typedef long long int __s64;
typedef long long unsigned int __u64;
typedef __u8 u8;
typedef __s16 s16;
typedef __u16 u16;
typedef __s32 s32;
typedef __u32 u32;
typedef __s64 s64;
typedef __u64 u64;
typedef __u16 __le16;
typedef __u16 __be16;
typedef __u32 __be32;
typedef __u64 __be64;
typedef __u32 __wsum;
typedef __u16 __sum16;

#define ETH_P_IP 0x0800

/*
 * Already defined in <linux/if_ether.h>
 */
// struct ethhdr {
// 	unsigned char h_dest[6];
// 	unsigned char h_source[6];
// 	__be16 h_proto;
// };

/*
 * Already defined in <linux/ip.h>
 */
// struct iphdr {
// 	__u8 ihl: 4;
// 	__u8 version: 4;
// 	__u8 tos;
// 	__be16 tot_len;
// 	__be16 id;
// 	__be16 frag_off;
// 	__u8 ttl;
// 	__u8 protocol;
// 	__sum16 check;
// 	__be32 saddr;
// 	__be32 daddr;
// };

#if defined(__TARGET_ARCH_x86)
struct pt_regs {
	/*
	 * C ABI says these regs are callee-preserved. They aren't saved on kernel entry
	 * unless syscall needs a complete, fully filled "struct pt_regs".
	 */
	unsigned long r15;
	unsigned long r14;
	unsigned long r13;
	unsigned long r12;
	unsigned long rbp;
	unsigned long rbx;
	/* These regs are callee-clobbered. Always saved on kernel entry. */
	unsigned long r11;
	unsigned long r10;
	unsigned long r9;
	unsigned long r8;
	unsigned long rax;
	unsigned long rcx;
	unsigned long rdx;
	unsigned long rsi;
	unsigned long rdi;
	/*
	 * On syscall entry, this is syscall#. On CPU exception, this is error code.
	 * On hw interrupt, it's IRQ number:
	 */
	unsigned long orig_rax;
	/* Return frame for iretq */
	unsigned long rip;
	unsigned long cs;
	unsigned long eflags;
	unsigned long rsp;
	unsigned long ss;
	/* top of stack page */
};
#endif /* __TARGET_ARCH_x86 */
