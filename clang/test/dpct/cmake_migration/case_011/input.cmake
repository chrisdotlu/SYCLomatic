add_library(culib)
add_executable(cuexe)
TARGET_COMPILE_FEATURES(culib PUBLIC c_std_11)
target_compile_features(culib PRIVATE cxx_std_11)
target_compile_features(culib 
  PUBLIC 
  cuda_std_11)

TARGET_COMPILE_FEATURES(culib PUBLIC c_std_17)
target_compile_features(culib PRIVATE cxx_std_17)
target_compile_features(culib 
  PUBLIC 
  cuda_std_17)

#Currently the Yaml based migartion rule migartes CXX and CUDA std_20 down to std_17.
#An implicit migration rule will be implemented to fix this issue in future.
#TARGET_COMPILE_FEATURES(cuexe PUBLIC c_std_20)
#target_compile_features(cuexe PRIVATE cxx_std_20)
#target_compile_features(cuexe
#  PUBLIC
#  cuda_std_20)

#Currently the Yaml based migartion rule migartes CXX and CUDA std_23 down to std_17.
#An implicit migration rule will be implemented to fix this issue in future.
#TARGET_COMPILE_FEATURES(cuexe PUBLIC c_std_23)
#target_compile_features(cuexe PRIVATE cxx_std_23)
#target_compile_features(cuexe
#  PUBLIC
#  cuda_std_23)
