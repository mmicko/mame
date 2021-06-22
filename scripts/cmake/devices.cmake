### license:BSD-3-Clause
### copyright-holders:MAMEdev Team
#
############################################################################
###
###   devices.lua
###
###   Rules for building device cores
###
############################################################################

include(scripts/cmake/cpu.cmake)
include(scripts/cmake/sound.cmake)
include(scripts/cmake/video.cmake)
include(scripts/cmake/machine.cmake)
include(scripts/cmake/bus.cmake)

add_library(optional STATIC ${CPU_SRCS} ${SOUND_SRCS} ${VIDEO_SRCS} ${MACHINE_SRCS} ${BUS_SRCS})
add_project_to_group(devices optional)
addprojectflags(optional)

target_include_directories(optional PRIVATE
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/emu
	${MAME_DIR}/src/devices
	${MAME_DIR}/src/mame # used for sound amiga
	${MAME_DIR}/src/lib
	${MAME_DIR}/src/lib/util
	${MAME_DIR}/3rdparty
	${GEN_DIR}/emu
	${GEN_DIR}/emu/layout
	${MAME_DIR}/3rdparty/asio/include
	${MAME_DIR}/3rdparty/expat/lib
	${MAME_DIR}/3rdparty/libflac/include
)

add_library(dasm STATIC ${DASM_SRCS})
add_project_to_group(devices dasm)

addprojectflags(dasm)

target_include_directories(dasm PRIVATE
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/emu
	${MAME_DIR}/src/devices
	${MAME_DIR}/src/lib
	${MAME_DIR}/src/lib/util
	${MAME_DIR}/3rdparty
	${GEN_DIR}/emu
	${MAME_DIR}/3rdparty/asio/include
	${MAME_DIR}/3rdparty/expat/lib
)
