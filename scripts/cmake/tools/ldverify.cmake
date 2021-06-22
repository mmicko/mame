set(LDVERIFY_SRCS
	${MAME_DIR}/src/tools/ldverify.cpp
)

add_executable(ldverify ${LDVERIFY_SRCS})

target_include_directories(ldverify PRIVATE 
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/lib/util
	${MAME_DIR}/3rdparty/libflac/include
)

target_link_libraries(ldverify PRIVATE utils)
