include(InstallRequiredSystemLibraries)

set(CPACK_PACKAGE_CONTACT booboo@boo.bo)
set(CPACK_PACKAGE_VERSION ${PRINT_VERSION})
set(CPACK_PACKAGE_NAME "solver")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "static C++ library for solver")
set(CPACK_PACKAGE_VENDOR "ghost")
set(CPACK_PACKAGE_PACK_NAME "solver-${PRINT_VERSION}")

set(CPACK_RESOURCE_FILE_README ${CMAKE_CURRENT_SOURCE_DIR}/README.md)

set(CPACK_SOURCE_GENERATOR "TGZ;ZIP")

set(CPACK_DEBIAN_PACKAGE_PREDEPENDS "cmake >= 3.0")
set(CPACK_DEBIAN_PACKAGE_RELEASE 1)

set(CPACK_DEBIAN_PACKAGE_VERSION ${PRINT_VERSION})
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "all")
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION "solves equations")

set(CPACK_RPM_PACKAGE_SUMMARY "solves equations")

if(WIN32)
  set(CPACK_GENERATOR "WIX")
elseif(APPLE)
  set(CPACK_GENERATOR "DragNDrop")
else()
  set(CPACK_GENERATOR "DEB;RPM")
endif()

include(CPack)
