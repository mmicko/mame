### license:BSD-3-Clause
### copyright-holders:MAMEdev Team
macro(osd_cfg _project)
add_project_to_group(libs ${_project})

if(MSVC)
    target_compile_options(${_project} PRIVATE "/FI\"${MAME_DIR}/src/osd/sdl/sdlprefix.h\"")
else()
    # GCC or Clang
    target_compile_options(${_project} PRIVATE "-include${MAME_DIR}/src/osd/sdl/sdlprefix.h")
endif()

if(USE_TAPTUN OR USE_PCAP)
    target_compile_definitions(${_project} PRIVATE USE_NETWORK)
	if (USE_TAPTUN)
        target_compile_definitions(${_project} PRIVATE OSD_NET_USE_TAPTUN)
	endif()
	if (USE_PCAP)
        target_compile_definitions(${_project} PRIVATE OSD_NET_USE_PCAP)
	endif()
endif()
#
#if _OPTIONS["NO_OPENGL"]~="1" and _OPTIONS["USE_DISPATCH_GL"]~="1" and _OPTIONS["MESA_INSTALL_ROOT"] then
#	includedirs {
#		path.join(_OPTIONS["MESA_INSTALL_ROOT"],"include"),
#	}
#end
#
#if _OPTIONS["SDL_INI_PATH"]~=nil then
#	defines {
#		"'INI_PATH=\"" .. _OPTIONS["SDL_INI_PATH"] .. "\"'",
#	}
#end
#
if(NO_X11)
    target_compile_definitions(${_project} PRIVATE SDLMAME_NO_X11)
else()
    target_compile_definitions(${_project} PRIVATE SDLMAME_X11)
#	includedirs {
#		"/usr/X11/include",
#		"/usr/X11R6/include",
#		"/usr/openwin/include",
#	}
endif()
#
if(NO_USE_XINPUT)
    target_compile_definitions(${_project} PRIVATE USE_XINPUT=0)
else()
    target_compile_definitions(${_project} PRIVATE 
        USE_XINPUT=1
        USE_XINPUT_DEBUG=0
    )
endif()

if(NO_USE_XINPUT_WII_LIGHTGUN_HACK)
    target_compile_definitions(${_project} PRIVATE USE_XINPUT_WII_LIGHTGUN_HACK=0)
else()
    target_compile_definitions(${_project} PRIVATE USE_XINPUT_WII_LIGHTGUN_HACK=1)
endif()


#if _OPTIONS["NO_USE_MIDI"]~="1" and _OPTIONS["targetos"]=="linux" then
#	buildoptions {
#		backtick(pkgconfigcmd() .. " --cflags alsa"),
#	}
#end
#
target_compile_definitions(${_project} PRIVATE SDLMAME_SDL2=1)

if(SDL2_MULTIAPI)
    target_compile_definitions(${_project} PRIVATE SDL2_MULTIAPI)
endif()

target_compile_definitions(${_project} PRIVATE OSD_SDL)

if(${BASE_TARGETOS} STREQUAL "unix")
    target_compile_definitions(${_project} PRIVATE SDLMAME_UNIX)
#	if _OPTIONS["targetos"]=="macosx" then
#		if _OPTIONS["with-bundled-sdl2"]==nil then
#			if _OPTIONS["USE_LIBSDL"]~="1" then
#				buildoptions {
#					"-F" .. _OPTIONS["SDL_FRAMEWORK_PATH"],
#				}
#			else
#				defines {
#					"MACOSX_USE_LIBSDL",
#				}
#				buildoptions {
#					backtick(sdlconfigcmd() .. " --cflags | sed 's:/SDL2::'"),
#				}
#			end
#		end
#	else
#		buildoptions {
#			backtick(sdlconfigcmd() .. " --cflags"),
#		}
#		if _OPTIONS["targetos"]~="asmjs" then
#			buildoptions {
#				backtick(pkgconfigcmd() .. " --cflags fontconfig"),
#			}
#		end
#	end
endif()

#if _OPTIONS["targetos"]=="windows" then
#	configuration { "mingw* or vs*" }
#		defines {
#			"UNICODE",
#			"_UNICODE",
#			"_WIN32_WINNT=0x0501",
#			"WIN32_LEAN_AND_MEAN",
#			"NOMINMAX",
#		}
#
#	configuration { }
#
#elseif _OPTIONS["targetos"]=="linux" then
#	if _OPTIONS["QT_HOME"]~=nil then
#		buildoptions {
#			"-I" .. backtick(_OPTIONS["QT_HOME"] .. "/bin/qmake -query QT_INSTALL_HEADERS"),
#		}
#	else
#		buildoptions {
#			backtick(pkgconfigcmd() .. " --cflags Qt5Widgets"),
#		}
#	end
#elseif _OPTIONS["targetos"]=="macosx" then
#	defines {
#		"SDLMAME_MACOSX",
#		"SDLMAME_DARWIN",
#	}
#elseif _OPTIONS["targetos"]=="freebsd" then
#	buildoptions {
#		-- /usr/local/include is not considered a system include director on FreeBSD.  GL.h resides there and throws warnings
#		"-isystem /usr/local/include",
#	}
#end
#
    if (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
        target_include_directories(${_project} PRIVATE ${MAME_DIR}/3rdparty/bx/include/compat/osx)
    endif()
    if((${CMAKE_SYSTEM_NAME} STREQUAL "FreeBSD") OR (${CMAKE_SYSTEM_NAME} STREQUAL "NetBSD"))
        target_include_directories(${_project} PRIVATE ${MAME_DIR}/3rdparty/bx/include/compat/freebsd)
    endif()
endmacro()