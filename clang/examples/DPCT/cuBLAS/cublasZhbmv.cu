#include "cublas_v2.h"

void test(cublasHandle_t handle, cublasFillMode_t upper_lower, int n, int k,
          const cuDoubleComplex *alpha, const cuDoubleComplex *a, int lda,
          const cuDoubleComplex *x, int incx, const cuDoubleComplex *beta,
          cuDoubleComplex *y, int incy) {
  // Start
  cublasZhbmv(handle /*cublasHandle_t*/, upper_lower /*cublasFillMode_t*/,
              n /*int*/, k /*int*/, alpha /*const cuDoubleComplex **/,
              a /*const cuDoubleComplex **/, lda /*int*/,
              x /*const cuDoubleComplex **/, incx /*int*/,
              beta /*const cuDoubleComplex **/, y /*cuDoubleComplex **/,
              incy /*int*/);
  // End
}
