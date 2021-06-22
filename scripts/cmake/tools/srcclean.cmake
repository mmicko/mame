set(SRCCLEAN_SRCS
	${MAME_DIR}/src/tools/srcclean.cpp
)

add_executable(srcclean ${SRCCLEAN_SRCS})

target_include_directories(srcclean PRIVATE 
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/lib/util
)

target_link_libraries(srcclean PRIVATE utils)
