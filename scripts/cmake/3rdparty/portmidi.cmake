set(PORTMIDI_SRCS
	${MAME_DIR}/3rdparty/portmidi/pm_common/portmidi.c
	${MAME_DIR}/3rdparty/portmidi/pm_common/pmutil.c
)

if (${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
set(PORTMIDI_SRCS_ADDITIONAL
	${MAME_DIR}/3rdparty/portmidi/pm_linux/pmlinux.c
	${MAME_DIR}/3rdparty/portmidi/pm_linux/pmlinuxalsa.c
	${MAME_DIR}/3rdparty/portmidi/pm_linux/finddefault.c
	${MAME_DIR}/3rdparty/portmidi/porttime/ptlinux.c
)
elseif (${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
set(PORTMIDI_SRCS_ADDITIONAL
	${MAME_DIR}/3rdparty/portmidi/porttime/ptwinmm.c
	${MAME_DIR}/3rdparty/portmidi/pm_win/pmwin.c
	${MAME_DIR}/3rdparty/portmidi/pm_win/pmwinmm.c
	${MAME_DIR}/3rdparty/portmidi/porttime/ptwinmm.c
)
elseif (${CMAKE_SYSTEM_NAME} STREQUAL "NetBSD")
set(PORTMIDI_SRCS_ADDITIONAL
	${MAME_DIR}/3rdparty/portmidi/pm_linux/pmlinux.c
	${MAME_DIR}/3rdparty/portmidi/pm_linux/finddefault.c
	${MAME_DIR}/3rdparty/portmidi/porttime/ptlinux.c
)
elseif (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
set(PORTMIDI_SRCS_ADDITIONAL
	${MAME_DIR}/3rdparty/portmidi/pm_mac/pmmac.c
	${MAME_DIR}/3rdparty/portmidi/pm_mac/pmmacosxcm.c
	${MAME_DIR}/3rdparty/portmidi/pm_mac/finddefault.c
	${MAME_DIR}/3rdparty/portmidi/pm_mac/readbinaryplist.c
	${MAME_DIR}/3rdparty/portmidi/pm_mac/osxsupport.m
	${MAME_DIR}/3rdparty/portmidi/porttime/ptmacosx_mach.c
)
endif()

add_library(portmidi ${LIBTYPE} ${PORTMIDI_SRCS} ${PORTMIDI_SRCS_ADDITIONAL})

target_include_directories(portmidi PRIVATE
	${MAME_DIR}/3rdparty/portmidi/pm_common
	${MAME_DIR}/3rdparty/portmidi/porttime
)

if (${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
	target_compile_definitions(portmidi PRIVATE PMALSA=1)
endif()

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
	target_compile_options(portmidi PRIVATE /wd4100) # warning C4100: 'xxx' : unreferenced formal parameter
	target_compile_options(portmidi PRIVATE /wd4127) # warning C4127: conditional expression is constant
	target_compile_options(portmidi PRIVATE /wd4244) # warning C4244: 'argument' : conversion from 'xxx' to 'xxx', possible loss of data
	target_compile_options(portmidi PRIVATE /wd4456) # warning C4456: declaration of 'xxx' hides previous local declaration
	target_compile_options(portmidi PRIVATE /wd4706) # warning C4706: assignment within conditional expression
endif()
