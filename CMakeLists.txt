cmake_minimum_required(VERSION 3.13)

set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)
#if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
#   message(FATAL_ERROR "In-source builds are not allowed.")
#endif("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")

project(myapp)
set(PROJECT_VERSION 1.0.4)
set(CMAKE_VERBOSE_MAKEFILE ON)
add_subdirectory(src ${CMAKE_CURRENT_BINARY_DIR}/src)

