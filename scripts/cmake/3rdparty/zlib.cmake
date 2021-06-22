set(ZLIB_SRCS
	${MAME_DIR}/3rdparty/zlib/adler32.c
	${MAME_DIR}/3rdparty/zlib/compress.c
	${MAME_DIR}/3rdparty/zlib/crc32.c
	${MAME_DIR}/3rdparty/zlib/deflate.c
	${MAME_DIR}/3rdparty/zlib/inffast.c
	${MAME_DIR}/3rdparty/zlib/inflate.c
	${MAME_DIR}/3rdparty/zlib/infback.c
	${MAME_DIR}/3rdparty/zlib/inftrees.c
	${MAME_DIR}/3rdparty/zlib/trees.c
	${MAME_DIR}/3rdparty/zlib/uncompr.c
	${MAME_DIR}/3rdparty/zlib/zutil.c
)

add_library(zlib STATIC ${ZLIB_SRCS})

if((CMAKE_CXX_COMPILER_ID STREQUAL "GNU") OR (CMAKE_CXX_COMPILER_ID MATCHES "Clang"))
	target_compile_options(zlib PRIVATE -Wno-strict-prototypes)
endif()

target_compile_definitions(zlib PRIVATE ZLIB_CONST)
target_compile_definitions(zlib PRIVATE $<$<CONFIG:DEBUG>:verbose=-1>)