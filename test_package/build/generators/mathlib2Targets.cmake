# Load the debug and release variables
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB DATA_FILES "${_DIR}/mathlib2-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${mathlib2_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(STATUS "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET mathlib2::mathlib2)
    add_library(mathlib2::mathlib2 INTERFACE IMPORTED)
    message(STATUS "Conan: Target declared 'mathlib2::mathlib2'")
endif()
# Load the debug and release library finders
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB CONFIG_FILES "${_DIR}/mathlib2-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()