include(InstallRequiredSystemLibraries)

# Общие настройки
set(CPACK_PACKAGE_CONTACT "booboo@boo.bo")
set(CPACK_PACKAGE_VERSION "${PRINT_VERSION}")
set(CPACK_PACKAGE_NAME "solver")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "static C++ library for solver")
set(CPACK_PACKAGE_VENDOR "ghost")
set(CPACK_PACKAGE_FILE_NAME "solver-${PRINT_VERSION}")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")

# Настройки исходных пакетов
set(CPACK_SOURCE_GENERATOR "TGZ;ZIP")

# Настройки Debian
set(CPACK_DEBIAN_PACKAGE_PREDEPENDS "cmake >= 3.0")
set(CPACK_DEBIAN_PACKAGE_RELEASE 1)
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "all")
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "solves equations")

# Настройки RPM
set(CPACK_RPM_PACKAGE_SUMMARY "solves equations")

# Выбор генераторов в зависимости от ОС
if(WIN32)
    set(CPACK_GENERATOR "WIX")
    # Дополнительные настройки для MSI
    set(CPACK_WIX_PRODUCT_GUID "PUT-YOUR-GUID-HERE") # Обязательно замените на реальный GUID
elseif(APPLE)
    set(CPACK_GENERATOR "DragNDrop")
else()
    set(CPACK_GENERATOR "DEB;RPM")
endif()

include(CPack)
