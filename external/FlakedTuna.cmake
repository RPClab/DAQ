if(NOT TARGET FlakedTuna_project)
  include(ExternalProject)
  # ----- FlakedTuna_project package -----
  externalproject_add(
    FlakedTuna_project
    GIT_REPOSITORY ${FLAKEDTUNA_REPOSITORY}
    GIT_TAG ${FLAKEDTUNA_VERSION}
    GIT_PROGRESS TRUE
    GIT_SHALLOW TRUE
    CMAKE_ARGS -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
               -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
               -DCMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD}
               -DCMAKE_CXX_STANDARD_REQUIRED=${CMAKE_CXX_STANDARD_REQUIRED}
               -DCMAKE_CXX_EXTENSIONS=${CMAKE_CXX_EXTENSIONS}
               -DCMAKE_POSITION_INDEPENDENT_CODE=${CMAKE_POSITION_INDEPENDENT_CODE}
               -DBUILD_EXAMPLES=OFF
               -DBUILD_TESTS=OFF
    PREFIX ${CMAKE_BINARY_DIR}/FlakedTuna_project
    INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
    LOG_DOWNLOAD ON
    )
endif()

