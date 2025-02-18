// UNSUPPORTED: system-windows
// RUN: dpct --format-range=none -out-root %T/double2_overloaded_operator %s --cuda-include-path="%cuda-path/include" -- -std=c++14 -x cuda --cuda-host-only
// RUN: FileCheck %s --match-full-lines --input-file %T/double2_overloaded_operator/double2_overloaded_operator.dp.cpp
// RUN: %if build_lit %{icpx -c -fsycl %T/double2_overloaded_operator/double2_overloaded_operator.dp.cpp -o %T/double2_overloaded_operator/double2_overloaded_operator.dp.o %}

#include <cuda_runtime.h>

// CHECK: typedef sycl::double2 ty;
typedef double2 ty;
// CHECK: typedef sycl::double2& ty2;
typedef double2& ty2;
// CHECK: typedef sycl::double2&& ty3;
typedef double2&& ty3;
// CHECK: typedef sycl::double2** ty4;
typedef double2** ty4;
// CHECK: typedef sycl::double2* ty5;
typedef double2* ty5;
// CHECK: typedef sycl::double2*** ty6;
typedef double2*** ty6;
// CHECK: typedef const sycl::double2*** ty7;
typedef const double2*** ty7;
// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: inline sycl::double2 &operator*=(sycl::double2 &v, const sycl::double2 &v2)          ;
// CHECK: }  // namespace dpct_operator_overloading
inline double2 &operator*=(double2 &v, const double2 &v2)          ;

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: template<typename T>
// CHECK: inline sycl::double2 &operator*=(sycl::double2 &v, const sycl::double2 &v2)          ;
// CHECK: }  // namespace dpct_operator_overloading
template<typename T>
inline double2 &operator*=(double2 &v, const double2 &v2)          ;

// CHECK: inline sycl::double2 &copy(sycl::double2 &v, const sycl::double2 &v2) {
// CHECK:   v.x() = v2.x();
// CHECK:   v.y() = v2.y();
// CHECK:   return v;
// CHECK: }
__host__ __device__ inline double2 &copy(double2 &v, const double2 &v2) {
  v.x = v2.x;
  v.y = v2.y;
  return v;
}
// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: inline sycl::double2 &operator+=(sycl::double2 &v, const sycl::double2 &v2) {
// CHECK:   v.x() += v2.x();
// CHECK:   v.y() += v2.y();
// CHECK:   return v;
// CHECK: }
// CHECK: }  // namespace dpct_operator_overloading
__host__ __device__ inline double2 &operator+=(double2 &v, const double2 &v2) {
  v.x += v2.x;
  v.y += v2.y;
  return v;
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: template<typename T>
// CHECK: inline sycl::double2 &operator+=(sycl::double2 &v, const sycl::double2 &v2) {
// CHECK:   v.x() += v2.x();
// CHECK:   v.y() += v2.y();
// CHECK:   return v;
// CHECK: }
// CHECK: }  // namespace dpct_operator_overloading
template<typename T>
__host__ __device__ inline double2 &operator+=(double2 &v, const double2 &v2) {
  v.x += v2.x;
  v.y += v2.y;
  return v;
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: inline sycl::double2 &operator-=(sycl::double2 &v, const sycl::double2 &v2) {
// CHECK:   v.x() -= v2.x();
// CHECK:   v.y() -= v2.y();
// CHECK:   return v;
// CHECK: }  // namespace dpct_operator_overloading
__host__ __device__ inline double2 &operator-=(double2 &v, const double2 &v2) {
  v.x -= v2.x;
  v.y -= v2.y;
  return v;
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: template<typename T>
// CHECK: inline sycl::double2 &operator-=(sycl::double2 &v, const sycl::double2 &v2) {
// CHECK:   v.x() -= v2.x();
// CHECK:   v.y() -= v2.y();
// CHECK:   return v;
// CHECK: }  // namespace dpct_operator_overloading
template<typename T>
__host__ __device__ inline double2 &operator-=(double2 &v, const double2 &v2) {
  v.x -= v2.x;
  v.y -= v2.y;
  return v;
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: inline sycl::double2 &operator*=(sycl::double2 &v, const double &r) {
// CHECK:   v.x() *= r;
// CHECK:   v.y() *= r;
// CHECK:   return v;
// CHECK: }  // namespace dpct_operator_overloading
__host__ __device__ inline double2 &operator*=(double2 &v, const double &r) {
  v.x *= r;
  v.y *= r;
  return v;
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: template<typename T>
// CHECK: inline sycl::double2 &operator*=(sycl::double2 &v, const double &r) {
// CHECK:   v.x() *= r;
// CHECK:   v.y() *= r;
// CHECK:   return v;
// CHECK: }  // namespace dpct_operator_overloading
template<typename T>
__host__ __device__ inline double2 &operator*=(double2 &v, const double &r) {
  v.x *= r;
  v.y *= r;
  return v;
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: inline sycl::double2 &operator/=(sycl::double2 &v, const double &r) {
// CHECK:   v.x() /= r;
// CHECK:   v.y() /= r;
// CHECK:   return v;
// CHECK: }  // namespace dpct_operator_overloading
__host__ __device__ inline double2 &operator/=(double2 &v, const double &r) {
  v.x /= r;
  v.y /= r;
  return v;
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: template<typename T>
// CHECK: inline sycl::double2 &operator/=(sycl::double2 &v, const double &r) {
// CHECK:   v.x() /= r;
// CHECK:   v.y() /= r;
// CHECK:   return v;
// CHECK: }  // namespace dpct_operator_overloading
template<typename T>
__host__ __device__ inline double2 &operator/=(double2 &v, const double &r) {
  v.x /= r;
  v.y /= r;
  return v;
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: inline bool operator==(const sycl::double2 &v1,
// CHECK:                                            const sycl::double2 &v2) {
// CHECK:   return ((v1.x() == v2.x()) && (v1.y() == v2.y()));
// CHECK: }
// CHECK: }  // namespace dpct_operator_overloading
__host__ __device__ inline bool operator==(const double2 &v1,
                                           const double2 &v2) {
  return ((v1.x == v2.x) && (v1.y == v2.y));
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: template<typename T>
// CHECK: inline bool operator==(const sycl::double2 &v1,
// CHECK:                                            const sycl::double2 &v2) {
// CHECK:   return ((v1.x() == v2.x()) && (v1.y() == v2.y()));
// CHECK: }
// CHECK: }  // namespace dpct_operator_overloading
template<typename T>
__host__ __device__ inline bool operator==(const double2 &v1,
                                           const double2 &v2) {
  return ((v1.x == v2.x) && (v1.y == v2.y));
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: inline bool operator!=(const sycl::double2 &v1,
// CHECK:                                            const sycl::double2 &v2) {
// CHECK:   return (!(dpct_operator_overloading::operator==(v1 , v2)));
// CHECK: }
// CHECK: }  // namespace dpct_operator_overloading
__host__ __device__ inline bool operator!=(const double2 &v1,
                                           const double2 &v2) {
  return (!(v1 == v2));
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: template<typename T>
// CHECK: inline bool operator!=(const sycl::double2 &v1,
// CHECK:                                            const sycl::double2 &v2) {
// CHECK:   return (!(dpct_operator_overloading::operator==(v1 , v2)));
// CHECK: }
// CHECK: }  // namespace dpct_operator_overloading
template<typename T>
__host__ __device__ inline bool operator!=(const double2 &v1,
                                           const double2 &v2) {
  return (!(v1 == v2));
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: inline sycl::double2 operator+(const sycl::double2 &v) { return v; }
// CHECK: }  // namespace dpct_operator_overloading
__host__ __device__ inline double2 operator+(const double2 &v) { return v; }

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: template<typename T>
// CHECK: inline sycl::double2 operator+(const sycl::double2 &v) { return v; }
// CHECK: }  // namespace dpct_operator_overloading
template<typename T>
__host__ __device__ inline double2 operator+(const double2 &v) { return v; }

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: inline sycl::double2 operator-(const sycl::double2 &v) {
// CHECK:   return sycl::double2(-v.x(), -v.y());
// CHECK: }
// CHECK: }  // namespace dpct_operator_overloading
__host__ __device__ inline double2 operator-(const double2 &v) {
  return make_double2(-v.x, -v.y);
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: template<typename T>
// CHECK: inline sycl::double2 operator-(const sycl::double2 &v) {
// CHECK:   return sycl::double2(-v.x(), -v.y());
// CHECK: }
// CHECK: }  // namespace dpct_operator_overloading
template<typename T>
__host__ __device__ inline double2 operator-(const double2 &v) {
  return make_double2(-v.x, -v.y);
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: inline sycl::double2 operator+(const sycl::double2 &v1,
// CHECK:                                              const sycl::double2 &v2) {
// CHECK:   return sycl::double2(v1.x() + v2.x(), v1.y() + v2.y());
// CHECK: }
// CHECK:}  // namespace dpct_operator_overloading
__host__ __device__ inline double2 operator+(const double2 &v1,
                                             const double2 &v2) {
  return make_double2(v1.x + v2.x, v1.y + v2.y);
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: template<typename T>
// CHECK: inline sycl::double2 operator+(const sycl::double2 &v1,
// CHECK:                                              const sycl::double2 &v2) {
// CHECK:   return sycl::double2(v1.x() + v2.x(), v1.y() + v2.y());
// CHECK: }
// CHECK:}  // namespace dpct_operator_overloading
template<typename T>
__host__ __device__ inline double2 operator+(const double2 &v1,
                                             const double2 &v2) {
  return make_double2(v1.x + v2.x, v1.y + v2.y);
}
// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: inline sycl::double2 operator-(const sycl::double2 &v1,
// CHECK:                                              const sycl::double2 &v2) {
// CHECK:   return sycl::double2(v1.x() - v2.x(), v1.y() - v2.y());
// CHECK: }
// CHECK: }  // namespace dpct_operator_overloading
__host__ __device__ inline double2 operator-(const double2 &v1,
                                             const double2 &v2) {
  return make_double2(v1.x - v2.x, v1.y - v2.y);
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: template<typename T>
// CHECK: inline sycl::double2 operator-(const sycl::double2 &v1,
// CHECK:                                              const sycl::double2 &v2) {
// CHECK:   return sycl::double2(v1.x() - v2.x(), v1.y() - v2.y());
// CHECK: }
// CHECK: }  // namespace dpct_operator_overloading
template<typename T>
__host__ __device__ inline double2 operator-(const double2 &v1,
                                             const double2 &v2) {
  return make_double2(v1.x - v2.x, v1.y - v2.y);
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: inline sycl::double2 operator*(const sycl::double2 &v,
// CHECK:                                              const double &r) {
// CHECK:   return sycl::double2(v.x() * r, v.y() * r);
// CHECK: }
// CHECK: }  // namespace dpct_operator_overloading
__host__ __device__ inline double2 operator*(const double2 &v,
                                             const double &r) {
  return make_double2(v.x * r, v.y * r);
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: template<typename T>
// CHECK: inline sycl::double2 operator*(const sycl::double2 &v,
// CHECK:                                              const double &r) {
// CHECK:   return sycl::double2(v.x() * r, v.y() * r);
// CHECK: }
// CHECK: }  // namespace dpct_operator_overloading
template<typename T>
__host__ __device__ inline double2 operator*(const double2 &v,
                                             const double &r) {
  return make_double2(v.x * r, v.y * r);
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: inline sycl::double2 operator*(const double &r,
// CHECK:                                              const sycl::double2 &v) {
// CHECK:   return sycl::double2(v.x() * r, v.y() * r);
// CHECK: }
// CHECK: }  // namespace dpct_operator_overloading
__host__ __device__ inline double2 operator*(const double &r,
                                             const double2 &v) {
  return make_double2(v.x * r, v.y * r);
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: template<typename T>
// CHECK: inline sycl::double2 operator*(const double &r,
// CHECK:                                              const sycl::double2 &v) {
// CHECK:   return sycl::double2(v.x() * r, v.y() * r);
// CHECK: }
// CHECK: }  // namespace dpct_operator_overloading
template<typename T>
__host__ __device__ inline double2 operator*(const double &r,
                                             const double2 &v) {
  return make_double2(v.x * r, v.y * r);
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: inline sycl::double2 operator/(const sycl::double2 &v,
// CHECK:                                              const double &r) {
// CHECK:   double rinv = (double)1. / r;
// CHECK:   return sycl::double2(v.x() * rinv, v.y() * rinv);
// CHECK: }
// CHECK: }  // namespace dpct_operator_overloading
__host__ __device__ inline double2 operator/(const double2 &v,
                                             const double &r) {
  double rinv = (double)1. / r;
  return make_double2(v.x * rinv, v.y * rinv);
}

// CHECK:/*
// CHECK-NEXT:DPCT1011:{{[0-9]+}}: The tool detected overloaded operators for built-in vector types, which may conflict with the SYCL 2020 standard operators (see 4.14.2.1 Vec interface). The tool inserted a namespace to avoid the conflict. Use SYCL 2020 standard operators instead.
// CHECK-NEXT:*/
// CHECK: namespace dpct_operator_overloading {
// CHECK: template<typename T>
// CHECK: inline sycl::double2 operator/(const sycl::double2 &v,
// CHECK:                                              const double &r) {
// CHECK:   double rinv = (double)1. / r;
// CHECK:   return sycl::double2(v.x() * rinv, v.y() * rinv);
// CHECK: }
// CHECK: }  // namespace dpct_operator_overloading
template<typename T>
__host__ __device__ inline double2 operator/(const double2 &v,
                                             const double &r) {
  double rinv = (double)1. / r;
  return make_double2(v.x * rinv, v.y * rinv);
}

// CHECK: inline double dot(const sycl::double2 &v1, const sycl::double2 &v2) {
// CHECK:   return (v1.x() * v2.x() + v1.y() * v2.y());
// CHECK: }
__host__ __device__ inline double dot(const double2 &v1, const double2 &v2) {
  return (v1.x * v2.x + v1.y * v2.y);
}

// CHECK: inline double cross(const sycl::double2 &v1, const sycl::double2 &v2) {
// CHECK:   return (v1.x() * v2.y() - v1.y() * v2.x());
// CHECK: }
__host__ __device__ inline double cross(const double2 &v1, const double2 &v2) {
  return (v1.x * v2.y - v1.y * v2.x);
}

// CHECK: inline double length(const sycl::double2 &v) {
// CHECK:   return (sycl::sqrt(v.x() * v.x() + v.y() * v.y()));
// CHECK: }
__host__ __device__ inline double length(const double2 &v) {
  return (std::sqrt(v.x * v.x + v.y * v.y));
}

// CHECK: inline double length2(const sycl::double2 &v) {
// CHECK:   return (v.x() * v.x() + v.y() * v.y());
// CHECK: }
__host__ __device__ inline double length2(const double2 &v) {
  return (v.x * v.x + v.y * v.y);
}

// CHECK: inline sycl::double2 rotateCCW(const sycl::double2 &v) {
// CHECK:   return sycl::double2(-v.y(), v.x());
// CHECK: }
__host__ __device__ inline double2 rotateCCW(const double2 &v) {
  return make_double2(-v.y, v.x);
}

// CHECK: inline sycl::double2 rotateCW(const sycl::double2 &v) {
// CHECK:   return sycl::double2(v.y(), -v.x());
// CHECK: }
__host__ __device__ inline double2 rotateCW(const double2 &v) {
  return make_double2(v.y, -v.x);
}

// CHECK: inline sycl::double2 project(sycl::double2 &v, const sycl::double2 &u) {
// CHECK:   return dpct_operator_overloading::operator-(v , dpct_operator_overloading::operator*(dot(v, u) , u));
// CHECK: }
__host__ __device__ inline double2 project(double2 &v, const double2 &u) {
  return v - dot(v, u) * u;
}

// CHECK: void test() {
// CHECK:   sycl::double2 a;
// CHECK:   sycl::double2 b;
// CHECK:   dpct_operator_overloading::operator+=(a , b);
// CHECK:   dpct_operator_overloading::operator-(a);
// CHECK:   b = a;
// CHECK: }
void test() {
  double2 a;
  double2 b;
  a += b;
  -a;
  b = a;
}

//CHECK: template<typename T> class A{
//CHECK-NEXT: public:
//CHECK-NEXT:   A operator-(const T b) const
//CHECK-NEXT:   {
//CHECK-NEXT:     return *this;
//CHECK-NEXT:   };
//CHECK-NEXT: };
template<typename T> class A{
public:
  A operator-(const T b) const
  {
    return *this;
  };
};

//CHECK: typedef A<sycl::int2> A2;
//CHECK-NEXT: void foo(){
//CHECK-NEXT:   sycl::int2 i2;
//CHECK-NEXT:   A2 a;
//CHECK-NEXT:   a - i2;
//CHECK-NEXT: }
typedef A<int2> A2;
void foo(){
  int2 i2;
  A2 a;
  a - i2;
}

inline __device__ float2 operator+(const float2 & a, const float2 & b) {
  return {a.x + b.x, a.y + b.y};
}

// CHECK: template<typename T>
// CHECK: struct Sum {
// CHECK:   inline Sum() {}
// CHECK:   inline T operator()(const T &a, const T &b) const {
// CHECK:       return a + b;
// CHECK:   }
// CHECK: };
template<typename T>
struct Sum {
  inline __device__ Sum() {}
  inline __device__ T operator()(const T &a, const T &b) const {
      return a + b;
  }
};

// CHECK: template <typename T>
// CHECK: void bar() {
// CHECK:   T a, b, c;
// CHECK:   c = a + b;
// CHECK: }
template <typename T>
__device__ void bar() {
  T a, b, c;
  c = a + b;
}

__global__ void kernel() {
  bar<float2>();
  bar<float>();
  Sum<float2> a;
  Sum<float> b;
}
