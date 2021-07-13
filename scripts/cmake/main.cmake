### license:BSD-3-Clause
### copyright-holders:MAMEdev Team
#
############################################################################
###
###   main.lua
###
###   Rules for building main binary
###
############################################################################

macro(mainProject _target _subtarget)
    if (SOURCES STREQUAL "")
        if(${_target} STREQUAL ${_subtarget})
            set(projectname ${_target})
        elseif(${_subtarget} STREQUAL "mess")
            set(projectname ${_subtarget})
        else()
            set(projectname ${_target}${_subtarget})
        endif()
    else()
        set(projectname ${_subtarget})
    endif()

if(NOT STANDALONE)
    set(MAINFILE  ${MAME_DIR}/src/${_target}/${_subtarget}.cpp)
    if(NOT EXISTS ${MAINFILE})
        set(MAINFILE  ${MAME_DIR}/src/${_target}/${_target}.cpp)
    endif()
    set(MAINPROJECT_SRCS 
        ${MAINFILE}
        ${GEN_DIR}/version.cpp
        ${GEN_DIR}/${_target}/${_subtarget}/drivlist.cpp
    )

    add_executable(${projectname} ${MAINPROJECT_SRCS})
endif()

if(STANDALONE)
	standalone(${projectname})
endif()

add_project_to_group(emulator ${projectname})

if((CMAKE_CXX_COMPILER_ID STREQUAL "GNU") OR (CMAKE_CXX_COMPILER_ID MATCHES "Clang"))
    if(MAP)
        target_link_options(${projectname} PRIVATE "-Wl,-Map,${projectname}.map")
    endif()
endif()

#	addprojectflags()
#	flags {
#		"NoManifest",
#		"Symbols", -- always include minimum symbols for executables
#	}
#
#	if _OPTIONS["SYMBOLS"] then
#		configuration { "mingw*" }
#			postbuildcommands {
#				"$(SILENT) echo Dumping symbols.",
#				"$(SILENT) objdump --section=.text --line-numbers --syms --demangle $(TARGET) >$(subst .exe,.sym,$(TARGET))"
#			}
#	end

if(CMAKE_BUILD_TYPE STREQUAL "Release")
    if(PROFILE)
        set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME "${projectname}p")
    endif()
endif()

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME "${projectname}d")
    if(PROFILE)
        set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME "${projectname}dp")
    endif()
endif()

if (${CMAKE_SYSTEM_NAME} STREQUAL "Emscripten")
    set_target_properties(${projectname} PROPERTIES SUFFIX ".html")
    target_compile_options(${projectname} PRIVATE -r)
    target_link_options(${projectname} PRIVATE "SHELL:-s USE_SDL=2")
    target_link_options(${projectname} PRIVATE "SHELL:-s USE_SDL_TTF=2")
    target_link_options(${projectname} PRIVATE "SHELL:--memory-init-file 0")
    target_link_options(${projectname} PRIVATE "SHELL:-s EXCEPTION_CATCHING_ALLOWED=\"['__ZN15running_machine17start_all_devicesEv','__ZN12cli_frontend7executeEiPPc','__ZN8chd_file11open_commonEb','__ZN8chd_file13read_metadataEjjRNSt3__212basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE','__ZN8chd_file13read_metadataEjjRNSt3__26vectorIhNS0_9allocatorIhEEEE','__ZNK19netlist_mame_device19base_validity_checkER16validity_checker']\"")
    target_link_options(${projectname} PRIVATE "SHELL:-s EXPORTED_FUNCTIONS=\"['_main', '_malloc', '__ZN15running_machine30emscripten_get_running_machineEv', '__ZN15running_machine17emscripten_get_uiEv', '__ZN15running_machine20emscripten_get_soundEv', '__ZN15mame_ui_manager12set_show_fpsEb', '__ZNK15mame_ui_manager8show_fpsEv', '__ZN13sound_manager4muteEbh', '_SDL_PauseAudio', '_SDL_SendKeyboardKey', '__ZN15running_machine15emscripten_saveEPKc', '__ZN15running_machine15emscripten_loadEPKc', '__ZN15running_machine21emscripten_hard_resetEv', '__ZN15running_machine21emscripten_soft_resetEv', '__ZN15running_machine15emscripten_exitEv']\"")
    target_link_options(${projectname} PRIVATE "SHELL:-s EXPORTED_RUNTIME_METHODS=\"['cwrap']\"")
    target_link_options(${projectname} PRIVATE "SHELL:-s ERROR_ON_UNDEFINED_SYMBOLS=0")
    target_link_options(${projectname} PRIVATE "SHELL:-s USE_WEBGL2=1")
    target_link_options(${projectname} PRIVATE "SHELL:-s LEGACY_GL_EMULATION=1")
    target_link_options(${projectname} PRIVATE "SHELL:-s GL_UNSAFE_OPTS=0")
    target_link_options(${projectname} PRIVATE "SHELL:--pre-js ${MAME_DIR}/src/osd/modules/sound/js_sound.js")
    target_link_options(${projectname} PRIVATE "SHELL:--post-js ${MAME_DIR}/scripts/resources/emscripten/emscripten_post.js")
    target_link_options(${projectname} PRIVATE "SHELL:--embed-file ${MAME_DIR}/bgfx/chains@bgfx/chains")
    target_link_options(${projectname} PRIVATE "SHELL:--embed-file ${MAME_DIR}/bgfx/effects@bgfx/effects")
    target_link_options(${projectname} PRIVATE "SHELL:--embed-file ${MAME_DIR}/bgfx/shaders/essl@bgfx/shaders/essl")
    target_link_options(${projectname} PRIVATE "SHELL:--embed-file ${MAME_DIR}/artwork/bgfx@artwork/bgfx")
    target_link_options(${projectname} PRIVATE "SHELL:--embed-file ${MAME_DIR}/artwork/slot-mask.png@artwork/slot-mask.png")
    if(SYMBOLS)
        target_link_options(${projectname} PRIVATE "SHELL:-s DEMANGLE_SUPPORT=1")
    endif()
    if (WEBASSEMBLY)
        target_link_options(${projectname} PRIVATE "SHELL:-s WASM=1")
        target_link_options(${projectname} PRIVATE "SHELL:-s ALLOW_MEMORY_GROWTH=1")
    else()
        target_link_options(${projectname} PRIVATE "SHELL:-s WASM=0")
        target_link_options(${projectname} PRIVATE "SHELL:-s ALLOW_MEMORY_GROWTH=0")
        target_link_options(${projectname} PRIVATE "SHELL:-s TOTAL_MEMORY=268435456")
    endif()
endif()

if(NOT STANDALONE)
    if(${CMAKE_VERSION} VERSION_LESS "3.18.0") 
        file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/build/eval_linkProjects.cmake "linkProjects_${TARGET}_${SUBTARGET}(${TARGET} ${SUBTARGET} ${projectname})")
        include(${CMAKE_CURRENT_BINARY_DIR}/build/eval_linkProjects.cmake)
    else()
        cmake_language(CALL linkProjects_${TARGET}_${SUBTARGET} ${TARGET} ${SUBTARGET} ${projectname})
    endif()
endif()

target_link_libraries(${projectname} PRIVATE osd_${OSD})
target_link_libraries(${projectname} PRIVATE qtdbg_${OSD})

if(NOT STANDALONE)
    target_link_libraries(${projectname} PRIVATE frontend)
endif()
target_link_libraries(${projectname} PRIVATE optional emu)
target_link_libraries(${projectname} PRIVATE formats)

list(LENGTH DASM_SRCS DASM_SRCS_LEN)
if(${DASM_SRCS_LEN} GREATER 0)
    target_link_libraries(${projectname} PRIVATE dasm)
endif()

if("NETLIST" IN_LIST MACHINES)
    target_link_libraries(${projectname} PRIVATE netlist)
endif()

target_link_libraries(${projectname} PRIVATE
	utils
	${EXT_LIB_EXPAT}
	softfloat
    softfloat3
    wdlfft
	ymfm
	${EXT_LIB_JPEG}
	7z
)

if(NOT FORCE_DRC_C_BACKEND)
    target_link_libraries(${projectname} PRIVATE asmjit)
endif()
if(NOT STANDALONE)
    target_link_libraries(${projectname} PRIVATE 
        ${EXT_LIB_LUA} 
        lualibs
    )
    if(NOT ${OSD} STREQUAL "uwp")
        target_link_libraries(${projectname} PRIVATE linenoise)
    endif()
endif()

target_link_libraries(${projectname} PRIVATE 
    ${EXT_LIB_ZLIB}
    ${EXT_LIB_FLAC} 
    ${EXT_LIB_UTF8PROC}
)

if(NOT STANDALONE)
    target_link_libraries(${projectname} PRIVATE ${EXT_LIB_SQLITE3})
endif()

if(NOT NO_USE_PORTAUDIO)
    target_link_libraries(${projectname} PRIVATE ${EXT_LIB_PORTAUDIO})
endif()

if(NOT NO_USE_MIDI)
    target_link_libraries(${projectname} PRIVATE ${EXT_LIB_PORTMIDI})
endif()

target_link_libraries(${projectname} PRIVATE
    bgfx
    bimg
    bx
    ocore_${OSD}
)
#
#	override_resources = false;
#
maintargetosdoptions(${projectname})

target_include_directories(${projectname} PRIVATE
        ${MAME_DIR}/src/osd
        ${MAME_DIR}/src/emu
        ${MAME_DIR}/src/devices
        ${MAME_DIR}/src/${_target}
        ${MAME_DIR}/src/lib
        ${MAME_DIR}/src/lib/util
        ${MAME_DIR}/3rdparty
		${GEN_DIR}/${_target}/layout
		${GEN_DIR}/resource
)

#
if(NOT STANDALONE)
#	if _OPTIONS["targetos"]=="macosx" and (not override_resources) then
#		linkoptions {
#			"-sectcreate __TEXT __info_plist " .. _MAKE.esc(GEN_DIR) .. "resource/" .. _subtarget .. "-Info.plist"
#		}
#		custombuildtask {
#			{ GEN_DIR .. "version.cpp" ,  GEN_DIR .. "resource/" .. _subtarget .. "-Info.plist",    {  MAME_DIR .. "scripts/build/verinfo.py" }, {"@echo Emitting " .. _subtarget .. "-Info.plist" .. "...",    PYTHON .. " $(1)  -p -b " .. _subtarget .. " $(<) > $(@)" }},
#		}
#		dependency {
#			{ "$(TARGET)" ,  GEN_DIR  .. "resource/" .. _subtarget .. "-Info.plist", true  },
#		}
#
#	end
#	local rctarget = _subtarget
#
#	if _OPTIONS["targetos"]=="windows" and (not override_resources) then
#		rcfile = MAME_DIR .. "scripts/resources/windows/" .. _subtarget .. "/" .. rctarget ..".rc"
#		if os.isfile(rcfile) then
#			files {
#				rcfile,
#			}
#			dependency {
#				{ "$(OBJDIR)/".._subtarget ..".res" ,  GEN_DIR  .. "resource/" .. rctarget .. "vers.rc", true  },
#			}
#		else
#			rctarget = "mame"
#			files {
#				MAME_DIR .. "scripts/resources/windows/mame/mame.rc",
#			}
#			dependency {
#				{ "$(OBJDIR)/mame.res" ,  GEN_DIR  .. "resource/" .. rctarget .. "vers.rc", true  },
#			}
#		end
#	end
#

	if(SOURCES STREQUAL "")
        if(EXISTS ${MAME_DIR}/src/${_target}/${_subtarget}.flt)
            add_custom_command(
                COMMAND ${CMAKE_COMMAND} -E make_directory ${GEN_DIR}/${_target}/${_subtarget}/
                COMMAND ${PYTHON_EXECUTABLE} ${MAME_DIR}/scripts/build/makedep.py driverlist ${MAME_DIR}/src/${_target}/${_target}.lst -f ${MAME_DIR}/src/${_target}/${_subtarget}.flt > ${GEN_DIR}/${_target}/${_subtarget}/drivlist.cpp
                DEPENDS ${MAME_DIR}/scripts/build/makedep.py ${MAME_DIR}/src/${_target}/${_target}.lst ${MAME_DIR}/src/${_target}/${_subtarget}.flt
                OUTPUT ${GEN_DIR}/${_target}/${_subtarget}/drivlist.cpp
                COMMENT "Building driver list..."
            )
        elseif(EXISTS ${MAME_DIR}/src/${_target}/${_subtarget}.lst)
            add_custom_command(
                COMMAND ${CMAKE_COMMAND} -E make_directory ${GEN_DIR}/${_target}/${_subtarget}/
                COMMAND ${PYTHON_EXECUTABLE} ${MAME_DIR}/scripts/build/makedep.py driverlist ${MAME_DIR}/src/${_target}/${_subtarget}.lst > ${GEN_DIR}/${_target}/${_subtarget}/drivlist.cpp
                DEPENDS ${MAME_DIR}/scripts/build/makedep.py ${MAME_DIR}/src/${_target}/${_subtarget}.lst
                OUTPUT ${GEN_DIR}/${_target}/${_subtarget}/drivlist.cpp
                COMMENT "Building driver list..."
            )
        else()
            add_custom_command(
                COMMAND ${CMAKE_COMMAND} -E make_directory ${GEN_DIR}/${_target}/${_target}/
                COMMAND ${PYTHON_EXECUTABLE} ${MAME_DIR}/scripts/build/makedep.py driverlist ${MAME_DIR}/src/${_target}/${_target}.lst > ${GEN_DIR}/${_target}/${_target}/drivlist.cpp
                DEPENDS ${MAME_DIR}/scripts/build/makedep.py ${MAME_DIR}/src/${_target}/${_target}.lst
                OUTPUT ${GEN_DIR}/${_target}/${_target}/drivlist.cpp
                COMMENT "Building driver list..."
            )
        endif()
    else()
        add_custom_command(
            COMMAND ${CMAKE_COMMAND} -E make_directory ${GEN_DIR}/${_target}/${_subtarget}/
            COMMAND ${PYTHON_EXECUTABLE} ${MAME_DIR}/scripts/build/makedep.py driverlist ${MAME_DIR}/src/${_target}/${_target}.lst -f ${GEN_DIR}/${_target}/sources_${_subtarget}.flt > ${GEN_DIR}/${_target}/${_subtarget}/drivlist.cpp
            DEPENDS ${MAME_DIR}/scripts/build/makedep.py ${MAME_DIR}/src/${_target}/${_target}.lst ${GEN_DIR}/${_target}/sources_${_subtarget}.flt
            OUTPUT ${GEN_DIR}/${_target}/${_subtarget}/drivlist.cpp
            COMMENT "Building driver list..."
        )
    endif()

#
#	configuration { "mingw*" }
#		custombuildtask {
#			{ GEN_DIR .. "version.cpp" ,  GEN_DIR  .. "resource/" .. rctarget .. "vers.rc",    {  MAME_DIR .. "scripts/build/verinfo.py" }, {"@echo Emitting " .. rctarget .. "vers.rc" .. "...",    PYTHON .. " $(1)  -r -b " .. rctarget .. " $(<) > $(@)" }},
#		}
#
#	configuration { "vs20*" }
#		prebuildcommands {
#			"mkdir \"" .. path.translate(GEN_DIR  .. "resource/","\\") .. "\" 2>NUL",
#			"@echo Emitting ".. rctarget .. "vers.rc...",
#			PYTHON .. " \"" .. path.translate(MAME_DIR .. "scripts/build/verinfo.py","\\") .. "\" -r -b " .. rctarget .. " \"" .. path.translate(GEN_DIR .. "version.cpp","\\") .. "\" > \"" .. path.translate(GEN_DIR  .. "resource/" .. rctarget .. "vers.rc", "\\") .. "\"" ,
#		}
#
#	configuration { "vsllvm" }
#		prebuildcommands {
#			"mkdir \"" .. path.translate(GEN_DIR  .. "resource/","\\") .. "\" 2>NUL",
#			"@echo Emitting ".. rctarget .. "vers.rc...",
#			PYTHON .. " \"" .. path.translate(MAME_DIR .. "scripts/build/verinfo.py","\\") .. "\" -r -b " .. rctarget .. " \"" .. path.translate(GEN_DIR .. "version.cpp","\\") .. "\" > \"" .. path.translate(GEN_DIR  .. "resource/" .. rctarget .. "vers.rc", "\\") .. "\"" ,
#		}
endif() # (NOT STANDALONE)

    if(MSVC)
        if(NOT DEBUG_DIR STREQUAL "")
            set_target_properties(${projectname} PROPERTIES VS_DEBUGGER_WORKING_DIRECTORY ${DEBUG_DIR})
        else()
            set_target_properties(${projectname} PROPERTIES VS_DEBUGGER_WORKING_DIRECTORY ${MAME_DIR})
        endif()
        if(NOT DEBUG_ARGS STREQUAL "")
            set_target_properties(${projectname} PROPERTIES VS_DEBUGGER_COMMAND_ARGUMENTS ${DEBUG_ARGS})
        else()
            set_target_properties(${projectname} PROPERTIES VS_DEBUGGER_COMMAND_ARGUMENTS "-window")
        endif()
    endif()
endmacro()