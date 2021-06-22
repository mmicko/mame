set(LUALIBS_SRCS
    ${MAME_DIR}/3rdparty/lsqlite3/lsqlite3.c
    ${MAME_DIR}/3rdparty/lua-zlib/lua_zlib.c
    ${MAME_DIR}/3rdparty/luafilesystem/src/lfs.c
    #${MAME_DIR}/3rdparty/lua-linenoise/linenoise_none.c
    ${MAME_DIR}/3rdparty/lua-linenoise/linenoise.c
)

add_library(lualibs ${LIBTYPE} ${LUALIBS_SRCS})

target_link_libraries(lualibs PUBLIC lua sqlite3 linenoise zlib)

target_include_directories(lualibs PRIVATE
	${MAME_DIR}/3rdparty
	${MAME_DIR}/3rdparty/linenoise   
    ${MAME_DIR}/3rdparty/lua/src
    ${MAME_DIR}/3rdparty/zlib
    ${MAME_DIR}/3rdparty/sqlite3
)

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
	target_compile_options(lualibs PRIVATE /wd4244) # warning C4244: 'argument' : conversion from 'xxx' to 'xxx', possible loss of data
	target_compile_options(lualibs PRIVATE /wd4055) # warning C4055: 'type cast': from data pointer 'void *' to function pointer 'xxx'
    target_compile_options(lualibs PRIVATE /wd4152) # warning C4152: nonstandard extension, function/data pointer conversion in expression
    target_compile_options(lualibs PRIVATE /wd4130) # warning C4130: '==': logical operation on address of string constant
endif()
