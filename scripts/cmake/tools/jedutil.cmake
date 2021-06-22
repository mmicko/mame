set(JEDUTIL_SRCS
	${MAME_DIR}/src/tools/jedutil.cpp
)

add_executable(jedutil ${JEDUTIL_SRCS})

target_include_directories(jedutil PRIVATE 
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/lib/util
)

target_link_libraries(jedutil PRIVATE utils)
