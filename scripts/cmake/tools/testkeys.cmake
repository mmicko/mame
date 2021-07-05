# license:BSD-3-Clause
# copyright-holders:MAMEdev Team

##########################################################################
## testkeys
##########################################################################

add_executable(testkeys)

if (MINGW)
	target_link_options(testkeys PRIVATE -municode)
endif()

target_include_directories(testkeys PRIVATE 
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/lib/util
)

target_link_libraries(testkeys PRIVATE utils)

target_sources(testkeys PRIVATE
	${MAME_DIR}/src/tools/testkeys.cpp
)
