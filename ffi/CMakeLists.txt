cmake_minimum_required(VERSION 3.7 FATAL_ERROR)
project(ffi VERSION 1.0.0 LANGUAGES C)
add_library(ffi SHARED inno.c inno.def)
add_executable(ffi_test inno.c)

set_target_properties(ffi PROPERTIES
    PUBLIC_HEADER inno.h
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
    OUTPUT_NAME "ffi"
)