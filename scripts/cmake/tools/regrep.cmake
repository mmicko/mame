set(REGREP_SRCS
	${MAME_DIR}/src/tools/regrep.cpp
)

add_executable(regrep ${REGREP_SRCS})

target_include_directories(regrep PRIVATE 
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/lib/util
)

target_link_libraries(regrep PRIVATE utils)
