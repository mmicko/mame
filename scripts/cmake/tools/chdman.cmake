set(CHDMAN_SRCS
	${MAME_DIR}/src/tools/chdman.cpp
	${GEN_DIR}/version.cpp
)

set_source_files_properties(${GEN_DIR}/version.cpp	PROPERTIES GENERATED TRUE)

add_executable(chdman ${CHDMAN_SRCS})

target_include_directories(chdman PRIVATE 
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/lib/util
	${MAME_DIR}/3rdparty/libflac/include
)

target_link_libraries(chdman PRIVATE utils)
