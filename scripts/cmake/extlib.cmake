# license:BSD-3-Clause
# copyright-holders:MAMEdev Team,Jeffrey Clark

option(WITH_SYSTEM_EXPAT "Use system Expat library" OFF)
option(WITH_SYSTEM_ZLIB "Use system Zlib library" OFF)
option(WITH_SYSTEM_JPEG "Use system JPEG library" OFF)
option(WITH_SYSTEM_FLAC "Use system FLAC library" OFF)
option(WITH_SYSTEM_SQLITE3 "Use system SQLite library" OFF)
option(WITH_SYSTEM_PORTMIDI "Use system PortMidi library" OFF)
option(WITH_SYSTEM_PORTAUDIO "Use system PortAudio library" OFF)
option(WITH_SYSTEM_LUA "Use system LUA library" OFF)
option(WITH_SYSTEM_UTF8PROC "Use system utf8proc library" OFF)

option(WITH_SYSTEM_ASIO "Use system Asio library" OFF)
option(WITH_SYSTEM_GLM "Use system glm library" OFF)
option(WITH_SYSTEM_RAPIDJSON "Use system rapidjson library" OFF)
option(WITH_SYSTEM_PUGIXML "Use system pugixml library" OFF)

if(NOT WITH_SYSTEM_EXPAT)
    set(EXT_LIB_EXPAT expat)
    set(EXT_INCLUDEDIR_EXPAT ${MAME_DIR}/3rdparty/expat/lib)
else()
    #TODO
endif()

if(NOT WITH_SYSTEM_ZLIB)
    set(EXT_LIB_ZLIB zlib)
    set(EXT_INCLUDEDIR_ZLIB ${MAME_DIR}/3rdparty/zlib)
else()
    #TODO
endif()

if(NOT WITH_SYSTEM_JPEG)
    set(EXT_LIB_JPEG jpeg)
    set(EXT_INCLUDEDIR_JPEG ${MAME_DIR}/3rdparty/libjpeg)
else()
    #TODO
endif()

if(NOT WITH_SYSTEM_FLAC)
    set(EXT_LIB_FLAC flac)
    set(EXT_INCLUDEDIR_FLAC ${MAME_DIR}/3rdparty/libflac/include)
else()
    #TODO
endif()

if(NOT WITH_SYSTEM_LUA)
    set(EXT_LIB_LUA lua)
    set(EXT_INCLUDEDIR_LUA ${MAME_DIR}/3rdparty/lua/src)
else()
    #TODO
endif()

if(NOT WITH_SYSTEM_SQLITE3)
    set(EXT_LIB_SQLITE3 sqlite3)
    set(EXT_INCLUDEDIR_SQLITE3 ${MAME_DIR}/3rdparty/sqlite3)
else()
    #TODO
endif()

if(NOT WITH_SYSTEM_PORTMIDI)
    set(EXT_LIB_PORTMIDI portmidi)
    set(EXT_INCLUDEDIR_PORTMIDI ${MAME_DIR}/3rdparty/portmidi/pm_common)
else()
    #TODO
endif()

if(NOT WITH_SYSTEM_PORTAUDIO)
    set(EXT_LIB_PORTAUDIO portaudio)
    set(EXT_INCLUDEDIR_PORTAUDIO ${MAME_DIR}/3rdparty/portaudio/include)
else()
    #TODO
endif()

if(NOT WITH_SYSTEM_UTF8PROC)
    set(EXT_LIB_UTF8PROC utf8proc)
    set(EXT_INCLUDEDIR_UTF8PROC ${MAME_DIR}/3rdparty/utf8proc)
else()
    #TODO
endif()

if(NOT WITH_SYSTEM_ASIO)
    set(EXT_INCLUDEDIR_ASIO ${MAME_DIR}/3rdparty/asio/include)
else()
    #TODO
endif()

if(NOT WITH_SYSTEM_GLM)
    set(EXT_INCLUDEDIR_GLM ${MAME_DIR}/3rdparty/glm)
else()
    #TODO
endif()

if(NOT WITH_SYSTEM_RAPIDJSON)
    set(EXT_INCLUDEDIR_RAPIDJSON ${MAME_DIR}/3rdparty/rapidjson/include)
else()
    #TODO
endif()

if(NOT WITH_SYSTEM_PUGIXML)
    set(EXT_INCLUDEDIR_PUGIXML ${MAME_DIR}/3rdparty/pugixml/src)
else()
    #TODO
endif()


# 
# if _OPTIONS["with-system-jpeg"]~=nil then
# 	defines {
# 		"XMD_H",
# 	}
# end
# 
# if not _OPTIONS["with-system-flac"]~=nil then
# 	defines {
# 		"FLAC__NO_DLL",
# 	}
# end
