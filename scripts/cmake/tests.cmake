### license:BSD-3-Clause
### copyright-holders:MAMEdev Team
#
############################################################################
###
###   tests.lua
###
###   Rules for building tests
###
############################################################################

set(MAMETESTS_SRCS
	${MAME_DIR}/src/emu/video/rgbsse.cpp
	${MAME_DIR}/src/emu/video/rgbsse.h
	${MAME_DIR}/src/emu/video/rgbvmx.cpp
	${MAME_DIR}/src/emu/video/rgbvmx.h
	${MAME_DIR}/tests/main.cpp
	${MAME_DIR}/tests/lib/util/corestr.cpp
	${MAME_DIR}/tests/lib/util/options.cpp
	${MAME_DIR}/tests/emu/attotime.cpp
	${MAME_DIR}/tests/emu/video/rgbutil.cpp
)

add_executable(mametests ${MAMETESTS_SRCS})
add_project_to_group(tests mametests)

target_include_directories(mametests PRIVATE 
	${MAME_DIR}/3rdparty/catch/single_include
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/emu
	${MAME_DIR}/src/lib/util
)

target_link_libraries(mametests PRIVATE utils)
