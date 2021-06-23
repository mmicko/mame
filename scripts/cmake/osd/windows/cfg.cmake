# license:BSD-3-Clause
# copyright-holders:MAMEdev Team

macro(osd_cfg _project)
	add_project_to_group(libs ${_project})

    target_compile_definitions(${_project} PRIVATE
        WIN32
        _WIN32

        OSD_WINDOWS
        WIN32_LEAN_AND_MEAN
        NOMINMAX
    )

    target_compile_definitions(${_project} PRIVATE
        UNICODE
        _UNICODE
    )

    #configuration { "vs*" }
    #	flags {
    #		"Unicode",
    #	}

    if (MODERN_WIN_API)
        target_compile_definitions(${_project} PRIVATE 
            WINVER=0x0602
            _WIN32_WINNT=0x0602
            NTDDI_VERSION=0x06030000
            MODERN_WIN_API
        )
    else()
        target_compile_definitions(${_project} PRIVATE _WIN32_WINNT=0x0501)
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

    if(USE_SDL)
        target_compile_definitions(${_project} PRIVATE 
            SDLMAME_SDL2=1
            USE_XINPUT=0
            USE_SDL=1
            USE_SDL_SOUND
        )
    else()
        target_compile_definitions(${_project} PRIVATE USE_SDL=0)
    endif()
endmacro()
