set(UTF8PROC_SRCS
	${MAME_DIR}/3rdparty/utf8proc/utf8proc.c
)

add_library(utf8proc STATIC ${UTF8PROC_SRCS})

target_compile_definitions(utf8proc PRIVATE
	UTF8PROC_DLLEXPORT=
	ZLIB_CONST
)

if((CMAKE_CXX_COMPILER_ID STREQUAL "GNU") OR (CMAKE_CXX_COMPILER_ID MATCHES "Clang"))
	target_compile_options(utf8proc PRIVATE -Wno-strict-prototypes)
endif()
