set(TESTKEYS_SRCS
	${MAME_DIR}/src/tools/testkeys.cpp
)

add_executable(testkeys ${TESTKEYS_SRCS})
if (MINGW)
	target_link_options(testkeys PRIVATE -municode)
endif()

target_include_directories(testkeys PRIVATE 
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/lib/util
)

target_link_libraries(testkeys PRIVATE utils)
