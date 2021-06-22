set(FLOPTOOL_SRCS
	${MAME_DIR}/src/tools/image_handler.cpp
	${MAME_DIR}/src/tools/image_handler.h
	${MAME_DIR}/src/tools/floptool.cpp
)

add_executable(floptool ${FLOPTOOL_SRCS})

target_include_directories(floptool PRIVATE 
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/lib
	${MAME_DIR}/src/lib/util
)

target_link_libraries(floptool PRIVATE formats)
