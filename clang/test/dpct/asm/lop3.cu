// RUN: dpct -out-root %T/lop3 %s --cuda-include-path="%cuda-path/include" -- -std=c++14 -x cuda --cuda-host-only
// RUN: FileCheck %s --match-full-lines --input-file %T/lop3/lop3.dp.cpp
// RUN: %if build_lit %{icpx -c -fsycl %T/lop3/lop3.dp.cpp -o %T/lop3/lop3.dp.o %}
// clang-format off
#include <cstdint>

// a^b^c
static __device__ __forceinline__ uint32_t LOP3LUT_XOR(uint32_t a, uint32_t b, uint32_t c) {
  uint32_t d1;
  // CHECK: d1 = a ^ b ^ c;
  asm("lop3.b32 %0, %1, %2, %3, 0x96;" : "=r"(d1) : "r"(a), "r"(b), "r"(c));
  return d1;
}

// (a ^ (c & (b ^ a)))
static __device__ __forceinline__ uint32_t LOP3LUT_XORAND(uint32_t a, uint32_t b, uint32_t c) {
  uint32_t d2;
  // CHECK: d2 = (a ^ (c & (b ^ a)));
  asm("lop3.b32 %0, %1, %3, %2, 0xb8;" : "=r"(d2) : "r"(a), "r"(b), "r"(c));
  return d2;
}

// ((a & (b | b)) | (b & b))
static __device__ __forceinline__ uint32_t LOP3LUT_ANDOR(uint32_t a, uint32_t b) {
  uint32_t d3;
  // CHECK: d3 = ((a & (b | b)) | (b & b));
  asm("lop3.b32 %0, %1, %2, %2, 0xe8;" : "=r"(d3) : "r"(a), "r"(b));
  return d3;
}

#define B 3
__device__  int hard(int a) {
  int d4;
  // CHECK: d4 = (~(a + B) & B & ~3) | (~(a + B) & B & 3) | ((a + B) & ~B & ~3);
  asm("lop3.b32 %0, %1, %2, 3, 0x1C;" : "=r"(d4) : "r"(a + B), "r"(B));
  return d4;
}
// clang-format on
