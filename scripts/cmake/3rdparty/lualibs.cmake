##################################################
## small lua library objects
##################################################

add_library(lualibs ${LIBTYPE})

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
	target_compile_options(lualibs PRIVATE /wd4244) # warning C4244: 'argument' : conversion from 'xxx' to 'xxx', possible loss of data
	target_compile_options(lualibs PRIVATE /wd4055) # warning C4055: 'type cast': from data pointer 'void *' to function pointer 'xxx'
    target_compile_options(lualibs PRIVATE /wd4152) # warning C4152: nonstandard extension, function/data pointer conversion in expression
    target_compile_options(lualibs PRIVATE /wd4130) # warning C4130: '==': logical operation on address of string constant
endif()

target_link_libraries(lualibs PUBLIC lua sqlite3 linenoise zlib)

target_include_directories(lualibs PRIVATE
    ${MAME_DIR}/3rdparty
    ${EXT_INCLUDEDIR_LUA}
    ${EXT_INCLUDEDIR_ZLIB}
    ${EXT_INCLUDEDIR_SQLITE3}
)

target_sources(lualibs PRIVATE
    ${MAME_DIR}/3rdparty/lsqlite3/lsqlite3.c
    ${MAME_DIR}/3rdparty/lua-zlib/lua_zlib.c
    ${MAME_DIR}/3rdparty/luafilesystem/src/lfs.c
)

if (${OSD} STREQUAL "uwp")
    target_sources(lualibs PRIVATE ${MAME_DIR}/3rdparty/lua-linenoise/linenoise_none.c)
else()
    target_include_directories(lualibs PRIVATE ${MAME_DIR}/3rdparty/linenoise)
    target_sources(lualibs PRIVATE ${MAME_DIR}/3rdparty/lua-linenoise/linenoise.c)
endif()
