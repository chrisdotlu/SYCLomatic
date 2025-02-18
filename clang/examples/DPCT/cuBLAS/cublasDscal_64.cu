#include "cublas_v2.h"

void test(cublasHandle_t handle, int64_t n, const double *alpha, double *x,
          int64_t incx) {
  // Start
  cublasDscal_64(handle /*cublasHandle_t*/, n /*int64_t*/,
                 alpha /*const double **/, x /*double **/, incx /*int64_t*/);
  // End
}
