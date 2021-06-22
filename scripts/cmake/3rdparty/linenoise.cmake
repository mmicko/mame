set(LINENOISE_SRCS
	${MAME_DIR}/3rdparty/linenoise/utf8.c
	${MAME_DIR}/3rdparty/linenoise/linenoise.c
)

add_library(linenoise ${LIBTYPE} ${LINENOISE_SRCS})
