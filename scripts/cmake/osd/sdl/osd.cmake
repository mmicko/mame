### license:BSD-3-Clause
### copyright-holders:MAMEdev Team
#
############################################################################
###
###   sdl.lua
###
###   Rules for the building with SDL
###
############################################################################

find_package(SDL2 REQUIRED)
macro(maintargetosdoptions _projectname)
	osdmodulestargetconf(${_projectname})

#	if _OPTIONS["USE_DISPATCH_GL"]~="1" and _OPTIONS["MESA_INSTALL_ROOT"] then
#		libdirs {
#			path.join(_OPTIONS["MESA_INSTALL_ROOT"],"lib"),
#		}
#		linkoptions {
#			"-Wl,-rpath=" .. path.join(_OPTIONS["MESA_INSTALL_ROOT"],"lib"),
#		}
#	end
#
if(NOT NO_X11)
    target_link_libraries(${_projectname} PRIVATE
        X11
        Xinerama
    )
else()
    if((${CMAKE_SYSTEM_NAME} STREQUAL "Linux") OR (${CMAKE_SYSTEM_NAME} STREQUAL "NetBSD") OR (${CMAKE_SYSTEM_NAME} STREQUAL "OpenBSD"))
        target_link_libraries(${_projectname} PRIVATE EGL)
    endif()
endif()
if(NOT NO_USE_XINPUT)
    target_link_libraries(${_projectname} PRIVATE
        Xext
        Xi
    )
endif()

if((${BASE_TARGETOS} STREQUAL "unix") AND (NOT ${CMAKE_SYSTEM_NAME} STREQUAL "Darwin") AND (NOT ${CMAKE_SYSTEM_NAME} STREQUAL "Android") AND (NOT ${CMAKE_SYSTEM_NAME} STREQUAL "Emscripten"))
        target_link_libraries(${_projectname} PRIVATE SDL2_ttf)
        target_link_libraries(${_projectname} PRIVATE fontconfig freetype) # pkgconfig --libs fontconfig
endif()

if(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
#	if _OPTIONS["targetos"]=="windows" then
#		if _OPTIONS["with-bundled-sdl2"]~=nil then
#			configuration { "mingw*"}
#				links {
#					"SDL2
#					"imm32
#					"version
#					"ole32
#					"oleaut32
#				}
#			configuration { "vs*" }
#				links {
#					"SDL2
#					"imm32
#					"version
#				}
#			configuration { }
#		else
#			if _OPTIONS["USE_LIBSDL"]~="1" then
#				configuration { "mingw*"}
#					links {
#						"SDL2main
#						"SDL2
#					}
#				configuration { "vs*" }
#					links {
#						"SDL2
#						"imm32
#						"version
#					}
#				configuration { }
#			else
#				local str = backtick(sdlconfigcmd() .. " --libs | sed 's/ -lSDLmain//'")
#				addlibfromstring(str)
#				addoptionsfromstring(str)
#			end
#			configuration { "x32 "vs*" }
#				libdirs {
#					path.join(_OPTIONS["SDL_INSTALL_ROOT"],"lib"x86")
#				}
#			configuration { "x64 "vs*" }
#				libdirs {
#					path.join(_OPTIONS["SDL_INSTALL_ROOT"],"lib"x64")
#				}
#			configuration { }
#		end
#		links {
#			"psapi
#		}
endif()
if(${CMAKE_SYSTEM_NAME} STREQUAL "Haiku")
#		links {
#			"network
#			"bsd
#		}
endif()
#
#	configuration { "mingw*" or "vs*" }
#		targetprefix "sdl"
#		links {
#			"psapi
#			"ole32
#		}
#	configuration { }
#
#	if _OPTIONS["targetos"]=="macosx" then
#		if _OPTIONS["with-bundled-sdl2"]~=nil then
#			links {
#				"SDL2
#target_link_libraries(${_projectname} PRIVATE SDL2)
#			}
#		end
#	end
#
endmacro()

set(SDL_INI_PATH "" CACHE STRING "Default search path for .ini files.")

if((${CMAKE_SYSTEM_NAME} STREQUAL "Windows") OR (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin") OR (${CMAKE_SYSTEM_NAME} STREQUAL "Haiku") OR (${CMAKE_SYSTEM_NAME} STREQUAL "Emscripten"))
    set(NO_X11_DEFAULT ON)
else()
    set(NO_X11_DEFAULT OFF)
endif()
option(NO_X11 "Disable use of X11" ${NO_X11_DEFAULT})

if((${CMAKE_SYSTEM_NAME} STREQUAL "Windows") OR (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin") OR (${CMAKE_SYSTEM_NAME} STREQUAL "Haiku") OR (${CMAKE_SYSTEM_NAME} STREQUAL "Emscripten"))
    set(NO_USE_XINPUT_DEFAULT ON)
else()
    set(NO_USE_XINPUT_DEFAULT OFF)
endif()
option(NO_USE_XINPUT "Disable use of Xinput" ${NO_USE_XINPUT_DEFAULT})

option(NO_USE_XINPUT_WII_LIGHTGUN_HACK "Disable use of Xinput Wii Lightgun Hack" ON)


option(SDL2_MULTIAPI "Use couriersud's multi-keyboard patch for SDL 2.1? (this API was removed prior to the 2.0 release)" OFF)

option(USE_LIBSDL "Use SDL library on OS (rather than framework/dll)" OFF)

set(BASE_TARGETOS "unix")
set(SDLOS_TARGETOS "unix")

if (${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
    set(BASE_TARGETOS "win32")
    set(SDLOS_TARGETOS "win32")
elseif (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
    set(SDLOS_TARGETOS "macosx")
endif()

#if _OPTIONS["with-bundled-sdl2"]~=nil then
#	includedirs {
#		GEN_DIR .. "includes
#	}
#end

if (${BASE_TARGETOS} STREQUAL "unix")
    if (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
#		local os_version = str_to_version(backtick("sw_vers -productVersion"))
#
#		links {
#			"Cocoa.framework
#		}
#		linkoptions {
#			"-framework QuartzCore
#			"-framework OpenGL
#		}
#
#
#		if os_version>=101100 then
#			linkoptions {
#				"-weak_framework Metal
#			}
#		end
#		if _OPTIONS["with-bundled-sdl2"]~=nil then
#			linkoptions {
#				"-framework AudioToolbox
#				"-framework AudioUnit
#				"-framework CoreAudio
#				"-framework Carbon
#				"-framework ForceFeedback
#				"-framework IOKit
#				"-framework CoreVideo
#			}
#		else
#			if _OPTIONS["USE_LIBSDL"]~="1" then
#				linkoptions {
#					"-F" .. _OPTIONS["SDL_FRAMEWORK_PATH"],
#				}
#				links {
#					"SDL2.framework
#				}
#			else
#				local str = backtick(sdlconfigcmd() .. " --libs --static | sed 's/-lSDLmain//'")
#				addlibfromstring(str)
#				addoptionsfromstring(str)
#			end
#		end
    else()
        if (NO_X11)
            set_option(USE_QTDEBUG OFF)
        else()
#			libdirs {
#				"/usr/X11/lib
#				"/usr/X11R6/lib
#				"/usr/openwin/lib
#			}
		endif()
#		if _OPTIONS["with-bundled-sdl2"]~=nil then
#			if _OPTIONS["targetos"]~="android" then
#				links {
#					"SDL2
#				}
#			end
#		else
#			local str = backtick(sdlconfigcmd() .. " --libs")
#			addlibfromstring(str)
#			addoptionsfromstring(str)
#		end
#
#		if _OPTIONS["targetos"]~="haiku" and _OPTIONS["targetos"]~="android" then
#			links {
#				"m
#				"pthread
#			}
#			if _OPTIONS["targetos"]=="solaris" then
#				links {
#					"socket
#					"nsl
#				}
#			elseif _OPTIONS["targetos"]~="asmjs" then
#				links {
#					"util
#				}
#			end
#		end
    endif()
endif()

qtdebuggerbuild(qtdbg_${OSD})
osd_cfg(qtdbg_${OSD})

set(OSD_SRCS
    ${MAME_DIR}/src/osd/sdl/osdsdl.h
    ${MAME_DIR}/src/osd/sdl/sdlprefix.h
    ${MAME_DIR}/src/osd/sdl/sdlmain.cpp
    ${MAME_DIR}/src/osd/osdepend.h
    ${MAME_DIR}/src/osd/sdl/video.cpp
    ${MAME_DIR}/src/osd/sdl/window.cpp
    ${MAME_DIR}/src/osd/sdl/window.h
    ${MAME_DIR}/src/osd/modules/osdwindow.cpp
    ${MAME_DIR}/src/osd/modules/osdwindow.h
    ${MAME_DIR}/src/osd/modules/render/drawsdl.cpp
    ${MAME_DIR}/src/osd/modules/render/draw13.cpp
    ${MAME_DIR}/src/osd/modules/render/blit13.h
)

if (${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
    list(APPEND OSD_SRCS ${MAME_DIR}/src/osd/windows/main.cpp)
endif()

if (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
    list(APPEND OSD_SRCS 
        ${MAME_DIR}/src/osd/modules/debugger/debugosx.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/breakpointsview.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/breakpointsview.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/consoleview.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/consoleview.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/debugcommandhistory.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/debugcommandhistory.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/debugconsole.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/debugconsole.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/debugview.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/debugview.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/debugwindowhandler.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/debugwindowhandler.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/deviceinfoviewer.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/deviceinfoviewer.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/devicesviewer.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/devicesviewer.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/disassemblyview.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/disassemblyviewer.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/disassemblyviewer.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/errorlogview.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/errorlogview.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/disassemblyview.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/errorlogviewer.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/errorlogviewer.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/memoryview.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/memoryview.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/memoryviewer.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/memoryviewer.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/pointsviewer.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/pointsviewer.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/registersview.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/registersview.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/watchpointsview.mm
        ${MAME_DIR}/src/osd/modules/debugger/osx/watchpointsview.h
        ${MAME_DIR}/src/osd/modules/debugger/osx/debugosx.h
    )
endif()
osdmodulesbuild(osd_${OSD} "${OSD_SRCS}")

target_include_directories(osd_${OSD} PRIVATE 
    ${MAME_DIR}/src/emu
    ${MAME_DIR}/src/devices # accessing imagedev from debugger
    ${MAME_DIR}/src/osd
    ${MAME_DIR}/src/lib
    ${MAME_DIR}/src/lib/util
    ${MAME_DIR}/src/osd/modules/file
    ${MAME_DIR}/src/osd/modules/render
    ${MAME_DIR}/3rdparty
    ${MAME_DIR}/src/osd/sdl
)
osd_cfg(osd_${OSD})
target_link_libraries(osd_${OSD} PRIVATE SDL2::SDL2)

set(OCORE_SRCS
    ${MAME_DIR}/src/osd/osdcore.cpp
    ${MAME_DIR}/src/osd/osdcore.h
    ${MAME_DIR}/src/osd/osdfile.h
    ${MAME_DIR}/src/osd/strconv.cpp
    ${MAME_DIR}/src/osd/strconv.h
    ${MAME_DIR}/src/osd/osdsync.cpp
    ${MAME_DIR}/src/osd/osdsync.h
    ${MAME_DIR}/src/osd/modules/osdmodule.cpp
    ${MAME_DIR}/src/osd/modules/osdmodule.h
    ${MAME_DIR}/src/osd/modules/lib/osdlib_${SDLOS_TARGETOS}.cpp
    ${MAME_DIR}/src/osd/modules/lib/osdlib.h
)

if(${BASE_TARGETOS} STREQUAL "unix") 
    list(APPEND OCORE_SRCS
        ${MAME_DIR}/src/osd/modules/file/posixdir.cpp
        ${MAME_DIR}/src/osd/modules/file/posixdomain.cpp
        ${MAME_DIR}/src/osd/modules/file/posixfile.cpp
        ${MAME_DIR}/src/osd/modules/file/posixfile.h
        ${MAME_DIR}/src/osd/modules/file/posixptty.cpp
        ${MAME_DIR}/src/osd/modules/file/posixsocket.cpp
    )
elseif(${BASE_TARGETOS} STREQUAL "win32")
    list(APPEND OCORE_SRCS
        ${MAME_DIR}/src/osd/modules/file/windir.cpp
        ${MAME_DIR}/src/osd/modules/file/winfile.cpp
        ${MAME_DIR}/src/osd/modules/file/winfile.h
        ${MAME_DIR}/src/osd/modules/file/winptty.cpp
        ${MAME_DIR}/src/osd/modules/file/winsocket.cpp
        ${MAME_DIR}/src/osd/windows/winutil.cpp # FIXME put the necessary functions somewhere more appropriate
    )
else()
    list(APPEND OCORE_SRCS
        ${MAME_DIR}/src/osd/modules/file/stdfile.cpp
    )
endif()

add_library(ocore_${OSD} ${LIBTYPE} ${OCORE_SRCS})

osd_cfg(ocore_${OSD})

target_include_directories(ocore_${OSD} PRIVATE 
	${MAME_DIR}/src/emu
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/lib
	${MAME_DIR}/src/lib/util
	${MAME_DIR}/src/osd/sdl
)

if(${BASE_TARGETOS} STREQUAL "win32")
    target_include_directories(ocore_${OSD} PRIVATE 
		${MAME_DIR}/src/osd/windows
    )
endif()

if (NOT (${CMAKE_SYSTEM_NAME} STREQUAL "Windows"))
    target_link_libraries(ocore_${OSD} PUBLIC dl)
endif()

target_link_libraries(ocore_${OSD} PUBLIC 
	pthread
    SDL2::SDL2
)
if (${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
    target_link_libraries(ocore_${OSD} PUBLIC 
        comctl32
        comdlg32
        psapi
        ole32
        shlwapi
    )
    target_link_libraries(ocore_${OSD} PUBLIC 
        utils
        wsock32
        ws2_32
    )
endif()
if (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
    target_link_libraries(ocore_${OSD} PUBLIC "-framework Carbon")
endif()
