########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(mathlib2_COMPONENT_NAMES "")
set(mathlib2_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(mathlib2_PACKAGE_FOLDER_RELEASE "C:/Users/MohammedZaidMohammed/.conan/data/mathlib2/0.1/zaid/math2/package/6cc50b139b9c3d27b3e9042d5f5372d327b3a9f7")
set(mathlib2_BUILD_MODULES_PATHS_RELEASE )


set(mathlib2_INCLUDE_DIRS_RELEASE "${mathlib2_PACKAGE_FOLDER_RELEASE}/include")
set(mathlib2_RES_DIRS_RELEASE )
set(mathlib2_DEFINITIONS_RELEASE )
set(mathlib2_SHARED_LINK_FLAGS_RELEASE )
set(mathlib2_EXE_LINK_FLAGS_RELEASE )
set(mathlib2_OBJECTS_RELEASE )
set(mathlib2_COMPILE_DEFINITIONS_RELEASE )
set(mathlib2_COMPILE_OPTIONS_C_RELEASE )
set(mathlib2_COMPILE_OPTIONS_CXX_RELEASE )
set(mathlib2_LIB_DIRS_RELEASE "${mathlib2_PACKAGE_FOLDER_RELEASE}/lib")
set(mathlib2_LIBS_RELEASE mathlib2)
set(mathlib2_SYSTEM_LIBS_RELEASE )
set(mathlib2_FRAMEWORK_DIRS_RELEASE )
set(mathlib2_FRAMEWORKS_RELEASE )
set(mathlib2_BUILD_DIRS_RELEASE "${mathlib2_PACKAGE_FOLDER_RELEASE}/")

# COMPOUND VARIABLES
set(mathlib2_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${mathlib2_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${mathlib2_COMPILE_OPTIONS_C_RELEASE}>")
set(mathlib2_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${mathlib2_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${mathlib2_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${mathlib2_EXE_LINK_FLAGS_RELEASE}>")


set(mathlib2_COMPONENTS_RELEASE )