
include(InstallRequiredSystemLibraries)

# Ensure PRINT_VERSION is defined before including this file (e.g., in CMakeLists.txt)
if(NOT DEFINED PRINT_VERSION)
    message(FATAL_ERROR "PRINT_VERSION is not set. Please define it in your CMakeLists.txt before including CPackConfig.cmake.")
endif()

# Common package settings
set(CPACK_PACKAGE_CONTACT "booboo@boo.bo")
set(CPACK_PACKAGE_VERSION "${PRINT_VERSION}")
set(CPACK_PACKAGE_NAME "solver")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Static C++ library for solver")
set(CPACK_PACKAGE_VENDOR "ghost")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${PRINT_VERSION}")

# Source package formats
set(CPACK_SOURCE_GENERATOR "TGZ;ZIP")

# Debian package settings
set(CPACK_DEBIAN_PACKAGE_PREDEPENDS "cmake (>= 3.0)")
set(CPACK_DEBIAN_PACKAGE_RELEASE 1)
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "all")
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "solves equations")

# RPM package settings
set(CPACK_RPM_PACKAGE_SUMMARY "solves equations")
set(CPACK_RPM_PACKAGE_RELEASE 1)
set(CPACK_RPM_PACKAGE_ARCHITECTURE "%{_arch}")

# Generator selection by platform
if(WIN32)
    set(CPACK_GENERATOR "WIX")
    # GUIDs should be stable across releases
    set(CPACK_WIX_PRODUCT_GUID "YOUR-UNIQUE-PRODUCT-GUIDHERE-1234-1234-1234-1234567890AB")
    set(CPACK_WIX_UPGRADE_GUID "YOUR-UNIQUE-UPGRADE-GUIDHERE-ABCD-ABCD-ABCD-ABCDEF012345")
elseif(APPLE)
    set(CPACK_GENERATOR "DragNDrop")
else()
    set(CPACK_GENERATOR "DEB;RPM")
endif()

include(CPack)
