# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(mathlib2_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(mathlib2_FRAMEWORKS_FOUND_RELEASE "${mathlib2_FRAMEWORKS_RELEASE}" "${mathlib2_FRAMEWORK_DIRS_RELEASE}")

set(mathlib2_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET mathlib2_DEPS_TARGET)
    add_library(mathlib2_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET mathlib2_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${mathlib2_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${mathlib2_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### mathlib2_DEPS_TARGET to all of them
conan_package_library_targets("${mathlib2_LIBS_RELEASE}"    # libraries
                              "${mathlib2_LIB_DIRS_RELEASE}" # package_libdir
                              mathlib2_DEPS_TARGET
                              mathlib2_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "mathlib2")    # package_name

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${mathlib2_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})


########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET mathlib2::mathlib2
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${mathlib2_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${mathlib2_LIBRARIES_TARGETS}>
                 APPEND)

    if("${mathlib2_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET mathlib2::mathlib2
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     mathlib2_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET mathlib2::mathlib2
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${mathlib2_LINKER_FLAGS_RELEASE}> APPEND)
    set_property(TARGET mathlib2::mathlib2
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${mathlib2_INCLUDE_DIRS_RELEASE}> APPEND)
    set_property(TARGET mathlib2::mathlib2
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${mathlib2_COMPILE_DEFINITIONS_RELEASE}> APPEND)
    set_property(TARGET mathlib2::mathlib2
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${mathlib2_COMPILE_OPTIONS_RELEASE}> APPEND)

########## For the modules (FindXXX)
set(mathlib2_LIBRARIES_RELEASE mathlib2::mathlib2)
