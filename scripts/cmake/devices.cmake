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

add_library(optional ${LIBTYPE} ${CPU_SRCS} ${SOUND_SRCS} ${VIDEO_SRCS} ${MACHINE_SRCS} ${BUS_SRCS})
add_project_to_group(devices optional)
addprojectflags(optional)
precompiledheaders(optional)

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
	${EXT_INCLUDEDIR_ASIO}
	${EXT_INCLUDEDIR_EXPAT}
	${EXT_INCLUDEDIR_FLAC}
)

add_library(dasm ${LIBTYPE} ${DASM_SRCS})
add_project_to_group(devices dasm)
addprojectflags(dasm)
precompiledheaders(dasm)

target_include_directories(dasm PRIVATE
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/emu
	${MAME_DIR}/src/devices
	${MAME_DIR}/src/lib
	${MAME_DIR}/src/lib/util
	${MAME_DIR}/3rdparty
	${GEN_DIR}/emu
	${EXT_INCLUDEDIR_ASIO}
	${EXT_INCLUDEDIR_EXPAT}
)
