__global__ void test(float f1, float f2) {
  // Start
  __fdiv_rn(f1 /*float*/, f2 /*float*/);
  // End
}
