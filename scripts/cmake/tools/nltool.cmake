set(NLTOOLS_SRCS
	${MAME_DIR}/src/lib/netlist/prg/nltool.cpp
)

add_executable(nltool ${NLTOOLS_SRCS})

target_include_directories(nltool PRIVATE 
	${MAME_DIR}/src/lib
	${MAME_DIR}/src/lib/netlist
)

if (MINGW)
	target_link_options(nltool PRIVATE -municode)
endif()

target_link_libraries(nltool PRIVATE netlist)
