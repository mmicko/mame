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
#
#
#function sdlconfigcmd()
#	if _OPTIONS["targetos"]=="asmjs" then
#		return "sdl2-config"
#	elseif not _OPTIONS["SDL_INSTALL_ROOT"] then
#		return pkgconfigcmd() .. " sdl2"
#	else
#		return path.join(_OPTIONS["SDL_INSTALL_ROOT"],"bin"sdl2") .. "-config"
#	end
#end
#
#
#newoption {
#	trigger = "MESA_INSTALL_ROOT
#	description = "link against specific GL-Library - also adds rpath to executable (overridden by USE_DISPATCH_GL)
#}
#
#newoption {
#	trigger = "SDL_INI_PATH
#	description = "Default search path for .ini files
#}
#
option(NO_X11 "Disable use of X11" OFF)
#
#if not _OPTIONS["NO_X11"] then
#	if _OPTIONS["targetos"]=="windows" or _OPTIONS["targetos"]=="macosx" or _OPTIONS["targetos"]=="haiku" or _OPTIONS["targetos"]=="asmjs" then
#		_OPTIONS["NO_X11"] = "1"
#	else
#		_OPTIONS["NO_X11"] = "0"
#	end
#end

#
#if not _OPTIONS["NO_USE_XINPUT"] then
#	if _OPTIONS["targetos"]=="windows" or _OPTIONS["targetos"]=="macosx" or _OPTIONS["targetos"]=="haiku" or _OPTIONS["targetos"]=="asmjs" then
#		_OPTIONS["NO_USE_XINPUT"] = "1"
#	else
#		_OPTIONS["NO_USE_XINPUT"] = "0"
#	end
#end
option(NO_USE_XINPUT "Disable use of Xinput" OFF)

option(NO_USE_XINPUT_WII_LIGHTGUN_HACK "Disable use of Xinput Wii Lightgun Hack" ON)


option(SDL2_MULTIAPI "Use couriersud's multi-keyboard patch for SDL 2.1? (this API was removed prior to the 2.0 release)" OFF)


#newoption {
#	trigger = "SDL_INSTALL_ROOT
#	description = "Equivalent to the ./configure --prefix=<path>
#}
#
#newoption {
#	trigger = "SDL_FRAMEWORK_PATH
#	description = "Location of SDL framework for custom OS X installations
#}
#
#if not _OPTIONS["SDL_FRAMEWORK_PATH"] then
#	_OPTIONS["SDL_FRAMEWORK_PATH"] = "/Library/Frameworks/"
#end

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
osdmodulesbuild("osd" "${OSD_SRCS}")

target_include_directories(osd PRIVATE 
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
osd_cfg(osd)


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
    target_include_directories(ocore PRIVATE 
		${MAME_DIR}/src/osd/windows
    )
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

add_library(ocore ${LIBTYPE} ${OCORE_SRCS})

osd_cfg(ocore)

target_include_directories(ocore PRIVATE 
	${MAME_DIR}/src/emu
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/lib
	${MAME_DIR}/src/lib/util
	${MAME_DIR}/src/osd/sdl
)

target_link_libraries(ocore PUBLIC 
	dl
	pthread
    SDL2
)

