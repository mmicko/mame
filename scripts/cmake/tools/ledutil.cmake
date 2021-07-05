##########################################################################
## ledutil
##########################################################################

add_executable(ledutil ${LDVERIFY_SRCS})

target_sources(ledutil PRIVATE
	${MAME_DIR}/src/osd/windows/ledutil.cpp
)

target_include_directories(ledutil PRIVATE 
	${MAME_DIR}/src/osd
)

target_link_libraries(ledutil PRIVATE ocore_windows)
