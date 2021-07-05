# license:BSD-3-Clause
# copyright-holders:MAMEdev Team

##########################################################################
## testkeys
##########################################################################

add_executable(testkeys)

target_include_directories(testkeys PRIVATE 
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/lib/util
)
if (MINGW)
	target_link_libraries(testkeys PRIVATE mingw32)
	target_link_libraries(testkeys PRIVATE SDL2::SDL2main)
endif()

target_link_libraries(testkeys PRIVATE ocore_sdl)

target_sources(testkeys PRIVATE
	${MAME_DIR}/src/tools/testkeys.cpp
)
