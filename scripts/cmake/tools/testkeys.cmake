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

target_link_libraries(testkeys PRIVATE utils)

target_sources(testkeys PRIVATE
	${MAME_DIR}/src/tools/testkeys.cpp
)
