add_library(static_lib_b STATIC lib_b.cpp)
target_include_directories(static_lib_b PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})