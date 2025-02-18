set (GCC_COMPILER g++)

# In the following cases check for changes after running the
# pattern-rewritter
set (CMAKE_CXX_COMPILER g++)
set (CMAKE_CXX_COMPILER clang++)
set (CMAKE_CXX_COMPILER /usr/bin/clang++)
set (CMAKE_CXX_COMPILER no_a_cpp_compiler)
set (CMAKE_CXX_COMPILER ${GCC_COMPILER})

# In the following cases check for NO changes after running the
# pattern-rewritter
set (CMAKE_C_COMPILER clang)
set (CMAKE_C_COMPILER icx)

# In the following cases check for NO changes after running the
# pattern-rewritter
set (CMAKE_CXX_COMPILER icpx)
# The following example will not work due to limitation of pattern
# rewritter
# set (CMAKE_CXX_COMPILER /path/to/icpx)
# set (ICPX_COMPILER icpx)
# set (CMAKE_CXX_COMPILER ${ICPX_COMPILER})

# No change to non-cmake variable
set (Cmake_CXX_Standard clang++)

# Test extrat spaces inserted
set ( CMAKE_CXX_COMPILER clang++)
set  (   CMAKE_CXX_COMPILER clang++)
set  (     CMAKE_CXX_COMPILER clang++)
set   (    CMAKE_CXX_COMPILER clang++)
