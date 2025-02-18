#include "cublas_v2.h"

void test(cublasHandle_t handle, cublasFillMode_t upper_lower,
          cublasOperation_t trans, cublasDiagType_t unit_nonunit, int n,
          const cuComplex *a, cuComplex *x, int incx) {
  // Start
  cublasCtpsv(handle /*cublasHandle_t*/, upper_lower /*cublasFillMode_t*/,
              trans /*cublasOperation_t*/, unit_nonunit /*cublasDiagType_t*/,
              n /*int*/, a /*const cuComplex **/, x /*cuComplex **/,
              incx /*int*/);
  // End
}
