set(CASTOOL_SRCS
	${MAME_DIR}/src/tools/castool.cpp
)

add_executable(castool ${CASTOOL_SRCS})

target_include_directories(castool PRIVATE 
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/lib
	${MAME_DIR}/src/lib/util
)

target_link_libraries(castool PRIVATE formats)
