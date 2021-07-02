##################################################
## linenoise library
##################################################

add_library(linenoise ${LIBTYPE})

if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
	target_compile_options(linenoise PRIVATE /wd4701) # warning C4701: potentially uninitialized local variable 'xxx' used
endif()

target_sources(linenoise PRIVATE
	${MAME_DIR}/3rdparty/linenoise/utf8.c
	${MAME_DIR}/3rdparty/linenoise/linenoise.c
)
