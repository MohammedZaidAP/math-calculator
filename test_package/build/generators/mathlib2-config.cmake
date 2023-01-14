########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/mathlib2Targets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${mathlib2_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(mathlib2_VERSION_STRING "0.1")
set(mathlib2_INCLUDE_DIRS ${mathlib2_INCLUDE_DIRS_RELEASE} )
set(mathlib2_INCLUDE_DIR ${mathlib2_INCLUDE_DIRS_RELEASE} )
set(mathlib2_LIBRARIES ${mathlib2_LIBRARIES_RELEASE} )
set(mathlib2_DEFINITIONS ${mathlib2_DEFINITIONS_RELEASE} )

# Only the first installed configuration is included to avoid the collision
foreach(_BUILD_MODULE ${mathlib2_BUILD_MODULES_PATHS_RELEASE} )
    message(STATUS "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


