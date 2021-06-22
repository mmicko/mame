set(WDLFFT_SRCS
	${MAME_DIR}/3rdparty/wdlfft/fft.c
	${MAME_DIR}/3rdparty/wdlfft/fft.h
)

add_library(wdlfft ${LIBTYPE} ${WDLFFT_SRCS})

if((CMAKE_CXX_COMPILER_ID STREQUAL "GNU") OR (CMAKE_CXX_COMPILER_ID MATCHES "Clang"))
	target_compile_options(wdlfft PRIVATE -Wno-strict-prototypes)
endif()
