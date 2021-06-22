set(SPLIT_SRCS
	${MAME_DIR}/src/tools/split.cpp
)

add_executable(split ${SPLIT_SRCS})

target_include_directories(split PRIVATE 
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/lib/util
)

target_link_libraries(split PRIVATE utils)
