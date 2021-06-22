set(ROMCMP_SRCS
	${MAME_DIR}/src/tools/romcmp.cpp
)

add_executable(romcmp ${ROMCMP_SRCS})

target_include_directories(romcmp PRIVATE 
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/lib/util
)

target_link_libraries(romcmp PRIVATE utils)
