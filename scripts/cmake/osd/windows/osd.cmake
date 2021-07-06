# license:BSD-3-Clause
# copyright-holders:MAMEdev Team

##########################################################################
##
##   windows.lua
##
##   Rules for the building for Windows
##
##########################################################################

set(DIRECTINPUT "8" CACHE STRING "inimum DirectInput version to support.")

option(USE_SDL "Enable SDL sound output." OFF)

qtdebuggerbuild(qtdbg_${OSD})
osd_cfg(qtdbg_${OSD})

set(OSD_SRCS
    ${MAME_DIR}/src/osd/modules/render/d3d/d3dhlsl.cpp
    ${MAME_DIR}/src/osd/modules/render/d3d/d3dcomm.h
    ${MAME_DIR}/src/osd/modules/render/d3d/d3dhlsl.h
    ${MAME_DIR}/src/osd/modules/render/drawd3d.cpp
    ${MAME_DIR}/src/osd/modules/render/drawd3d.h
    ${MAME_DIR}/src/osd/modules/render/drawgdi.cpp
    ${MAME_DIR}/src/osd/modules/render/drawgdi.h
    ${MAME_DIR}/src/osd/modules/render/drawnone.cpp
    ${MAME_DIR}/src/osd/modules/render/drawnone.h
    ${MAME_DIR}/src/osd/windows/video.cpp
    ${MAME_DIR}/src/osd/windows/video.h
    ${MAME_DIR}/src/osd/windows/window.cpp
    ${MAME_DIR}/src/osd/windows/window.h
    ${MAME_DIR}/src/osd/modules/osdwindow.cpp
    ${MAME_DIR}/src/osd/modules/osdwindow.h
    ${MAME_DIR}/src/osd/windows/winmenu.cpp
    ${MAME_DIR}/src/osd/windows/winmain.cpp
    ${MAME_DIR}/src/osd/windows/winmain.h
    ${MAME_DIR}/src/osd/osdepend.h
    ${MAME_DIR}/src/osd/modules/debugger/win/consolewininfo.cpp
    ${MAME_DIR}/src/osd/modules/debugger/win/consolewininfo.h
    ${MAME_DIR}/src/osd/modules/debugger/win/debugbaseinfo.cpp
    ${MAME_DIR}/src/osd/modules/debugger/win/debugbaseinfo.h
    ${MAME_DIR}/src/osd/modules/debugger/win/debugviewinfo.cpp
    ${MAME_DIR}/src/osd/modules/debugger/win/debugviewinfo.h
    ${MAME_DIR}/src/osd/modules/debugger/win/debugwininfo.cpp
    ${MAME_DIR}/src/osd/modules/debugger/win/debugwininfo.h
    ${MAME_DIR}/src/osd/modules/debugger/win/disasmbasewininfo.cpp
    ${MAME_DIR}/src/osd/modules/debugger/win/disasmbasewininfo.h
    ${MAME_DIR}/src/osd/modules/debugger/win/disasmviewinfo.cpp
    ${MAME_DIR}/src/osd/modules/debugger/win/disasmviewinfo.h
    ${MAME_DIR}/src/osd/modules/debugger/win/disasmwininfo.cpp
    ${MAME_DIR}/src/osd/modules/debugger/win/disasmwininfo.h
    ${MAME_DIR}/src/osd/modules/debugger/win/editwininfo.cpp
    ${MAME_DIR}/src/osd/modules/debugger/win/editwininfo.h
    ${MAME_DIR}/src/osd/modules/debugger/win/logwininfo.cpp
    ${MAME_DIR}/src/osd/modules/debugger/win/logwininfo.h
    ${MAME_DIR}/src/osd/modules/debugger/win/logviewinfo.cpp
    ${MAME_DIR}/src/osd/modules/debugger/win/logviewinfo.h
    ${MAME_DIR}/src/osd/modules/debugger/win/memoryviewinfo.cpp
    ${MAME_DIR}/src/osd/modules/debugger/win/memoryviewinfo.h
    ${MAME_DIR}/src/osd/modules/debugger/win/memorywininfo.cpp
    ${MAME_DIR}/src/osd/modules/debugger/win/memorywininfo.h
    ${MAME_DIR}/src/osd/modules/debugger/win/pointswininfo.cpp
    ${MAME_DIR}/src/osd/modules/debugger/win/pointswininfo.h
    ${MAME_DIR}/src/osd/modules/debugger/win/uimetrics.cpp
    ${MAME_DIR}/src/osd/modules/debugger/win/uimetrics.h
    ${MAME_DIR}/src/osd/modules/debugger/win/debugwin.h
)
osdmodulesbuild(osd_${OSD} "${OSD_SRCS}")
osd_cfg(osd_${OSD})

target_include_directories(osd_${OSD} PRIVATE 
		${MAME_DIR}/src/emu
		${MAME_DIR}/src/devices # accessing imagedev from debugger
		${MAME_DIR}/src/osd
		${MAME_DIR}/src/lib
		${MAME_DIR}/src/lib/util
		${MAME_DIR}/src/osd/modules/file
		${MAME_DIR}/src/osd/modules/render
		${MAME_DIR}/3rdparty
    	${MAME_DIR}/src/osd/windows
)
if(MSVC)
	target_include_directories(osd_${OSD} PRIVATE ${MAME_DIR}/3rdparty/dxsdk/Include)
endif()

target_compile_definitions(osd_${OSD} PRIVATE DIRECT3D_VERSION=0x0900)

if(DIRECTINPUT STREQUAL "8")
    target_compile_definitions(osd_${OSD} PRIVATE DIRECTINPUT_VERSION=0x0800)
else()
    target_compile_definitions(osd_${OSD} PRIVATE DIRECTINPUT_VERSION=0x0700)
endif()

set(OCORE_SRCS
    ${MAME_DIR}/src/osd/eigccppc.h
    ${MAME_DIR}/src/osd/eigccx86.h
    ${MAME_DIR}/src/osd/eivc.h
    ${MAME_DIR}/src/osd/eivcarm.h
    ${MAME_DIR}/src/osd/eivcx86.h
    ${MAME_DIR}/src/osd/eminline.h
    ${MAME_DIR}/src/osd/osdcomm.h
    ${MAME_DIR}/src/osd/osdcore.cpp
    ${MAME_DIR}/src/osd/osdcore.h
    ${MAME_DIR}/src/osd/strconv.cpp
    ${MAME_DIR}/src/osd/strconv.h
    ${MAME_DIR}/src/osd/osdsync.cpp
    ${MAME_DIR}/src/osd/osdsync.h
    ${MAME_DIR}/src/osd/windows/main.cpp
    ${MAME_DIR}/src/osd/windows/winutf8.cpp
    ${MAME_DIR}/src/osd/windows/winutf8.h
    ${MAME_DIR}/src/osd/windows/winutil.cpp
    ${MAME_DIR}/src/osd/windows/winutil.h
    ${MAME_DIR}/src/osd/modules/osdmodule.cpp
    ${MAME_DIR}/src/osd/modules/osdmodule.h
    ${MAME_DIR}/src/osd/modules/file/windir.cpp
    ${MAME_DIR}/src/osd/modules/file/winfile.cpp
    ${MAME_DIR}/src/osd/modules/file/winfile.h
    ${MAME_DIR}/src/osd/modules/file/winptty.cpp
    ${MAME_DIR}/src/osd/modules/file/winsocket.cpp
    ${MAME_DIR}/src/osd/modules/lib/osdlib_win32.cpp
)
add_library(ocore_${OSD} ${LIBTYPE} ${OCORE_SRCS})
osd_cfg(ocore_${OSD})

target_include_directories(ocore_${OSD} PRIVATE 
	${MAME_DIR}/3rdparty
	${MAME_DIR}/src/emu
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/osd/modules/file
	${MAME_DIR}/src/lib
	${MAME_DIR}/src/lib/util
	
	${MAME_DIR}/src/osd/windows
)

target_link_libraries(ocore_${OSD} PRIVATE utils)
target_link_libraries(ocore_${OSD} PUBLIC 
	comctl32
	comdlg32
	psapi
	ole32
	shlwapi
)
target_link_libraries(ocore_${OSD} PUBLIC 
	wsock32
	ws2_32
)

macro(maintargetosdoptions _projectname)
	osdmodulestargetconf(${_projectname})

if (NOT MSVC)
	target_link_libraries(${_projectname} PUBLIC mingw32)
endif()

if(DIRECTINPUT STREQUAL "8")
    target_link_libraries(${_projectname} PUBLIC dinput8)
else()
    target_link_libraries(${_projectname} PUBLIC dinput)
endif()

if(USE_SDL)
    find_package(SDL2 REQUIRED)
    target_link_libraries(${_projectname} PUBLIC SDL2::SDL2)
endif()

endmacro()
