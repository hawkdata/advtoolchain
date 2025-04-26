cmake_minimum_required(VERSION 3.10)
project(UndefinedSymbolDemo VERSION 1.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

set(CMAKE_VERBOSE_MAKEFILE ON CACHE BOOL "Enable verbose makefile output" FORCE)
# Add the subdirectories
add_subdirectory(static_lib_a)
add_subdirectory(static_lib_b)
add_subdirectory(shared_lib)
add_subdirectory(src)