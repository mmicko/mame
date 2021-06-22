set(PNGCMP_SRCS
	${MAME_DIR}/src/tools/pngcmp.cpp
)

add_executable(pngcmp ${PNGCMP_SRCS})

target_include_directories(pngcmp PRIVATE 
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/lib/util
)

target_link_libraries(pngcmp PRIVATE utils)
