set(UNIDASM_SRCS
	${MAME_DIR}/src/tools/unidasm.cpp
)

add_executable(unidasm ${UNIDASM_SRCS})

target_include_directories(unidasm PRIVATE 
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/devices
	${MAME_DIR}/src/emu
	${MAME_DIR}/src/lib/util
	${MAME_DIR}/3rdparty
)

target_link_libraries(unidasm PRIVATE dasm utils)
