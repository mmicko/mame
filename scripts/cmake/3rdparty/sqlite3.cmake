set(SQLITE3_SRCS
	${MAME_DIR}/3rdparty/sqlite3/sqlite3.c
)

add_library(sqlite3 STATIC ${SQLITE3_SRCS})

if((CMAKE_CXX_COMPILER_ID STREQUAL "GNU") OR (CMAKE_CXX_COMPILER_ID MATCHES "Clang"))
	target_compile_options(sqlite3 PRIVATE -Wno-bad-function-cast)
	target_compile_options(sqlite3 PRIVATE -Wno-discarded-qualifiers)
	target_compile_options(sqlite3 PRIVATE -Wno-undef)
	target_compile_options(sqlite3 PRIVATE -Wno-unused-but-set-variable)
	if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
		target_compile_options(sqlite3 PRIVATE -Wno-incompatible-pointer-types-discards-qualifiers)
	endif()
endif()
