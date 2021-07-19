cmake_minimum_required(VERSION 3.7 FATAL_ERROR)
project(clib VERSION 1.0.0 LANGUAGES C)
add_library(clib SHARED random_number.c random_number.def)
add_executable(randomnumber random_number.c)

set_target_properties(clib PROPERTIES
    PUBLIC_HEADER randomNumber.h
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
    OUTPUT_NAME "clib"
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Hex_Identity_ID_Goes_Here"
)
