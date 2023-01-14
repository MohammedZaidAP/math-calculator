cmake_minimum_required(VERSION 3.0)
project(consume)

# Add the library to the include directories
include_directories(${CONAN_INCLUDE_DIRS})

# Add the library to the link directories
link_directories(${CONAN_LIB_DIRS})

# Add the library to the link libraries
link_libraries(${CONAN_LIBS})

# Add the calculator application source files
add_executable(consume main.cpp)

