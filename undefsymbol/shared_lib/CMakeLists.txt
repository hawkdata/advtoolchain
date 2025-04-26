add_library(shared_lib SHARED shared_lib.cpp)
target_link_libraries(shared_lib PRIVATE static_lib_a static_lib_b)
target_include_directories(shared_lib PRIVATE
        ${CMAKE_SOURCE_DIR}/lib/static_lib_a
        ${CMAKE_SOURCE_DIR}/lib/static_lib_b
)
