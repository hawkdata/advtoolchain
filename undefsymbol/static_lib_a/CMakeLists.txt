add_library(static_lib_a STATIC lib_a.cpp)
target_include_directories(static_lib_a PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})