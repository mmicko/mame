##################################################
## wdlfft library objects (from Cockos WDL)
##################################################

add_library(wdlfft ${LIBTYPE})

if((CMAKE_CXX_COMPILER_ID STREQUAL "GNU") OR (CMAKE_CXX_COMPILER_ID MATCHES "Clang"))
	target_compile_options(wdlfft PRIVATE -Wno-strict-prototypes)
endif()

target_sources(wdlfft PRIVATE
	${MAME_DIR}/3rdparty/wdlfft/fft.c
	${MAME_DIR}/3rdparty/wdlfft/fft.h
)
