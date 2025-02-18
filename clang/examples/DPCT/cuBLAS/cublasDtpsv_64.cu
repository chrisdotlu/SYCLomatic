#include "cublas_v2.h"

void test(cublasHandle_t handle, cublasFillMode_t upper_lower,
          cublasOperation_t trans, cublasDiagType_t unit_nonunit, int64_t n,
          const double *a, double *x, int64_t incx) {
  // Start
  cublasDtpsv_64(handle /*cublasHandle_t*/, upper_lower /*cublasFillMode_t*/,
                 trans /*cublasOperation_t*/, unit_nonunit /*cublasDiagType_t*/,
                 n /*int64_t*/, a /*const double **/, x /*double **/,
                 incx /*int64_t*/);
  // End
}
