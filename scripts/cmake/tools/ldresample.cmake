set(LDRESAMPLE_SRCS
	${MAME_DIR}/src/tools/ldresample.cpp
)

add_executable(ldresample ${LDRESAMPLE_SRCS})

target_include_directories(ldresample PRIVATE 
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/lib/util
	${MAME_DIR}/3rdparty/libflac/include
)

target_link_libraries(ldresample PRIVATE utils)
