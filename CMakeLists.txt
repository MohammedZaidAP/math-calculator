cmake_minimum_required(VERSION 3.15)
project(mathlib2 CXX)

add_library(mathlib2 src/mathlib2.cpp)
target_include_directories(mathlib2 PUBLIC include)

set_target_properties(mathlib2 PROPERTIES PUBLIC_HEADER "include/mathlib2.h")
install(TARGETS mathlib2)
