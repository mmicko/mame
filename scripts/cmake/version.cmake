execute_process(COMMAND git describe --dirty
                OUTPUT_VARIABLE NEW_GIT_VERSION
                ERROR_QUIET)

string(STRIP "${NEW_GIT_VERSION}" NEW_GIT_VERSION)

if ("${NEW_GIT_VERSION}" STREQUAL "")
    set(NEW_GIT_VERSION "unknown")
endif()

set(VERSION_CPP_SRC  "#define BARE_BUILD_VERSION \"0.231\"
extern const char bare_build_version[];
extern const char build_version[];
const char bare_build_version[] = BARE_BUILD_VERSION;
const char build_version[] = BARE_BUILD_VERSION \" (${NEW_GIT_VERSION})\";")

if(EXISTS ${GEN_DIR}/version.cpp)
    file(READ ${GEN_DIR}/version.cpp VERSION_CPP_SRC_CURRENT)
else()
    set(VERSION_CPP_SRC_CURRENT "")
endif()

if (NOT "${VERSION_CPP_SRC}" STREQUAL "${VERSION_CPP_SRC_CURRENT}")
    file(WRITE ${GEN_DIR}/version.cpp "${VERSION_CPP_SRC}")
endif()
