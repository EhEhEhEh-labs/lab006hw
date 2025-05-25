# CPackConfig.cmake

include(InstallRequiredSystemLibraries)

# Общие настройки
set(CPACK_PACKAGE_CONTACT "booboo@boo.bo")
set(CPACK_PACKAGE_VERSION "${PRINT_VERSION}") # Ensure PRINT_VERSION is set correctly in your CMakeLists.txt
set(CPACK_PACKAGE_NAME "solver")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "static C++ library for solver")
set(CPACK_PACKAGE_VENDOR "ghost")
set(CPACK_PACKAGE_FILE_NAME "solver-${PRINT_VERSION}") # Base name for package files

# Настройки исходных пакетов
set(CPACK_SOURCE_GENERATOR "TGZ;ZIP")

# Настройки Debian
set(CPACK_DEBIAN_PACKAGE_PREDEPENDS "cmake >= 3.0")
set(CPACK_DEBIAN_PACKAGE_RELEASE 1)
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "all") # Consider "amd64" or similar if it's not architecture-independent
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "solves equations")

# Настройки RPM
set(CPACK_RPM_PACKAGE_SUMMARY "solves equations")
# Consider adding CPACK_RPM_PACKAGE_RELEASE and CPACK_RPM_PACKAGE_ARCHITECTURE

# Выбор генераторов в зависимости от ОС
if(WIN32)
    set(CPACK_GENERATOR "WIX")
    # Дополнительные настройки для MSI
    # 👇 IMPORTANT: Replace this with a real, unique GUID 👇
    set(CPACK_WIX_PRODUCT_GUID "YOUR-UNIQUE-GUID-HERE-例えば-12345678-1234-1234-1234-1234567890AB")
    set(CPACK_WIX_UPGRADE_GUID "YOUR-UNIQUE-UPGRADE-GUID-HERE-例えば-ABCDEF01-ABCD-ABCD-ABCD-ABCDEF012345") # Also good to have a unique one
elseif(APPLE)
    set(CPACK_GENERATOR "DragNDrop")
else()
    set(CPACK_GENERATOR "DEB;RPM")
endif()

include(CPack)
