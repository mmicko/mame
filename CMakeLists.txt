# license:BSD-3-Clause
# copyright-holders:MAMEdev Team

cmake_minimum_required(VERSION 3.12)

set(TARGET "mame" CACHE STRING "Building target")

set(SUBTARGET "mame" CACHE STRING "Building subtarget")

if(WIN32)
  set(OSD_DEFAULT "windows")
else()
  set(OSD_DEFAULT "sdl")
endif()
set(OSD ${OSD_DEFAULT} CACHE STRING "Choose OSD layer implementation")

if(${TARGET} MATCHES ${SUBTARGET})
    set(projectname ${TARGET})
elseif(${SUBTARGET} MATCHES "mess")
    set(projectname ${SUBTARGET})
else()
    set(projectname ${TARGET}${SUBTARGET})
endif()

project(${projectname} CXX C)
if (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
  enable_language(OBJCXX)
endif()

include(scripts/cmake/helpers.cmake)

# silence "no symbols" warnings on apple clang 
if(APPLE)
    SET(CMAKE_C_ARCHIVE_CREATE   "<CMAKE_AR> Scr <TARGET> <LINK_FLAGS> <OBJECTS>")
    SET(CMAKE_CXX_ARCHIVE_CREATE "<CMAKE_AR> Scr <TARGET> <LINK_FLAGS> <OBJECTS>")
    SET(CMAKE_C_ARCHIVE_FINISH   "<CMAKE_RANLIB> -no_warning_for_no_symbols -c <TARGET>")
    SET(CMAKE_CXX_ARCHIVE_FINISH "<CMAKE_RANLIB> -no_warning_for_no_symbols -c <TARGET>")
endif()

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/build/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/build/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

set(STANDALONE false)
set(MAME_DIR "${CMAKE_SOURCE_DIR}")
# 
# newoption {
# 	trigger = "precompile",
# 	description = "Precompiled headers generation.",
# 	allowed = {
# 		{ "0",   "Disabled"     },
# 		{ "1",   "Enabled"      },
# 	}
# }
# 
# 
# function precompiledheaders()
# 	if _OPTIONS["precompile"]==nil or (_OPTIONS["precompile"]~=nil and _OPTIONS["precompile"]=="1") then
# 		configuration { "not xcode4" }
# 			pchheader("emu.h")
# 		configuration { }
# 	end
# end
# 
# function precompiledheaders_novs()
# 	precompiledheaders()
# 	if string.sub(_ACTION,1,4) == "vs20" then
# 		--print("Disabling pch for Visual Studio")
# 		flags {
# 			"NoPCH"
# 		}
# 	end
# end
#
set(CPUS "")
set(SOUNDS "")
set(MACHINES "")
set(VIDEOS "")
set(BUSES "")
set(FORMATS "")

option(BUILD_TOOLS "Enable building tools." ON)
option(BUILD_TESTS "Enable building tests." ON)
option(BUILD_BENCHMARKS "Enable building benchmarks." ON)


# 
# newoption {
# 	trigger = 'with-bundled-sdl2',
# 	description = 'Build bundled SDL2 library',
# }
# 
# newoption {
# 	trigger = "distro",
# 	description = "Choose distribution",
# 	allowed = {
# 		{ "generic",           "generic"            },
# 		{ "debian-stable",     "debian-stable"      },
# 		{ "ubuntu-intrepid",   "ubuntu-intrepid"    },
# 	},
# }


# 
# newoption {
# 	trigger = "gcc_version",
# 	description = "GCC compiler version",
# }
# 
# newoption {
# 	trigger = "CC",
# 	description = "CC replacement",
# }
# 
# newoption {
# 	trigger = "CXX",
# 	description = "CXX replacement",
# }
# 
# newoption {
# 	trigger = "LD",
# 	description = "LD replacement",
# }
# 
# newoption {
# 	trigger = "AR",
# 	description = "AR replacement",
# }
# 
# newoption {
# 	trigger = "TOOLCHAIN",
# 	description = "Toolchain prefix"
# }
# 
# newoption {
# 	trigger = "PROFILE",
# 	description = "Enable profiling.",
# }
# 
# newoption {
# 	trigger = "SYMBOLS",
# 	description = "Enable symbols.",
# }
# 
# newoption {
# 	trigger = "SYMLEVEL",
# 	description = "Symbols level.",
# }
# 
# newoption {
# 	trigger = "PROFILER",
# 	description = "Include the internal profiler.",
# }
# 
# newoption {
# 	trigger = "OPTIMIZE",
# 	description = "Optimization level.",
# }
# 
# newoption {
# 	trigger = "ARCHOPTS",
# 	description = "Additional options for target C/C++/Objective-C/Objective-C++ compilers and linker.",
# }
# 
# newoption {
# 	trigger = "ARCHOPTS_C",
# 	description = "Additional options for target C++ compiler.",
# }
# 
# newoption {
# 	trigger = "ARCHOPTS_CXX",
# 	description = "Additional options for target C++ compiler.",
# }
# 
# newoption {
# 	trigger = "ARCHOPTS_OBJC",
# 	description = "Additional options for target Objective-C compiler.",
# }
# 
# newoption {
# 	trigger = "ARCHOPTS_OBJCXX",
# 	description = "Additional options for target Objective-C++ compiler.",
# }
# 
# newoption {
# 	trigger = "OPT_FLAGS",
# 	description = "OPT_FLAGS.",
# }
# 
# newoption {
# 	trigger = "LDOPTS",
# 	description = "Additional linker options",
# }
# 
# newoption {
# 	trigger = "MAP",
# 	description = "Generate a link map.",
# }
# 

option(NOASM "Disable implementations based on assembler code." OFF)
option(FORCE_DRC_C_BACKEND "Force DRC C backend." OFF)
option(NOWERROR "Do not stop on errors." OFF)
option(DEPRECATED "Generate deprecation warnings during compilation." OFF)


# newoption {
# 	trigger = "SSE2",
# 	description = "SSE2 optimized code and SSE2 code generation.",
# 	allowed = {
# 		{ "0",   "Disabled"     },
# 		{ "1",   "Enabled"      },
# 	}
# }
# 
# newoption {
# 	trigger = "SSE3",
# 	description = "SSE3 optimized code and SSE3 code generation.",
# 	allowed = {
# 		{ "0",   "Disabled"     },
# 		{ "1",   "Enabled"      },
# 	}
# }
# 
# newoption {
# 	trigger = "OPENMP",
# 	description = "OpenMP optimized code.",
# 	allowed = {
# 		{ "0",   "Disabled"     },
# 		{ "1",   "Enabled"      },
# 	}
# }
# 
# newoption {
# 	trigger = "SEPARATE_BIN",
# 	description = "Use separate bin folders.",
# 	allowed = {
# 		{ "0",   "Disabled"     },
# 		{ "1",   "Enabled"      },
# 	}
# }
# 

option(SHADOW_CHECK "Shadow checks." OFF)
# 
# newoption {
# 	trigger = "STRIP_SYMBOLS",
# 	description = "Symbols stripping.",
# 	allowed = {
# 		{ "0",   "Disabled"     },
# 		{ "1",   "Enabled"      },
# 	}
# }
# 
# 
# newoption {
# 	trigger = "SHLIB",
# 	description = "Generate shared libs.",
# 	allowed = {
# 		{ "0",   "Static libs"  },
# 		{ "1",   "Shared libs"  },
# 	}
# }
# 
# newoption {
# 	trigger = "SOURCES",
# 	description = "List of sources to compile.",
# }
# 
# newoption {
# 	trigger = "PLATFORM",
# 	description = "Target machine platform (x86,arm,...)",
# }
# 
# newoption {
# 	trigger = "DEBUG_DIR",
# 	description = "Default directory for debugger.",
# }
# 
# newoption {
# 	trigger = "DEBUG_ARGS",
# 	description = "Arguments for running debug build.",
# }
# 
# newoption {
# 	trigger = "WEBASSEMBLY",
# 	description = "Produce WebAssembly output when building with Emscripten.",
# }
# 
# newoption {
# 	trigger = "SANITIZE",
# 	description = "Specifies the santizer(s) to use."
# }
# 
# newoption {
# 	trigger = "PROJECT",
# 	description = "Select projects to be built. Will look into project folder for files.",
# }
# 
# dofile ("extlib.lua")
# 
# if _OPTIONS["SHLIB"]=="1" then
# 	LIBTYPE = "SharedLib"
# else
# 	LIBTYPE = "StaticLib"
# end
# 

find_package(PythonInterp 3.6 REQUIRED)

if(NOASM AND (NOT FORCE_DRC_C_BACKEND))
 	set(FORCE_DRC_C_BACKEND ON)
endif()
# 
# if(_OPTIONS["TOOLCHAIN"] == nil) then
# 	_OPTIONS['TOOLCHAIN'] = ""
# end
# 
set(GEN_DIR "${CMAKE_SOURCE_DIR}/build/generated")


if ("${TARGET}" STREQUAL "")
  message(FATAL_ERROR "Target for build must be specified")
endif()
if ("${SUBTARGET}" STREQUAL "")
  message(FATAL_ERROR "Subtarget for build must be specified")
endif()
# 
# if (_OPTIONS["target"] == _OPTIONS["subtarget"]) then
# 	solution (_OPTIONS["target"])
# else
# 	if (_OPTIONS["subtarget"]=="mess") then
# 		solution (_OPTIONS["subtarget"])
# 	else
# 		solution (_OPTIONS["target"] .. _OPTIONS["subtarget"])
# 	end
# end
# 

set(CMAKE_CONFIGURATION_TYPES Debug Release)
if (NOT CMAKE_BUILD_TYPE)
  message(STATUS "No build type selected, default to Release")
  set(CMAKE_BUILD_TYPE "Release")
endif()

message(STATUS "Build configuration: " ${CMAKE_BUILD_TYPE})

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED on)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED on)
set(CMAKE_C_EXTENSIONS ON)


# 
# flags {
# 	"StaticRuntime",
# 	"Cpp17",
# }
# 
# configuration { "vs20*" }
# 	buildoptions {
if (MSVC)
  # enable multi-core compilation with MSVC
  add_compile_options(/MP)
  
  add_compile_options(/bigobj)
endif()
# 		"/bigobj",
# 	}
# 	flags {
# 		"ExtraWarnings",
# 	}
# 	if not _OPTIONS["NOWERROR"] then
# 		flags{
# 			"FatalWarnings",
# 		}
# 	end
# 
# 
# configuration { "Debug", "vs20*" }
# 	flags {
# 		"Symbols",
# 		"NoMultiProcessorCompilation",
# 	}
# 
# configuration { "Release", "vs20*" }
# 	flags {
# 		"Optimize",
# 		"NoEditAndContinue",
# 		"NoIncrementalLink",
# 	}
# 	if _OPTIONS["SYMBOLS"] then
# 		flags {
# 			"Symbols",
# 		}
# 	end
# 
# configuration { "vsllvm" }
# 	buildoptions {
# 		"/bigobj",
# 	}
# 	flags {
# 		"NoPCH",
# 		"ExtraWarnings",
# 	}
# 	if not _OPTIONS["NOWERROR"] then
# 		flags{
# 			"FatalWarnings",
# 		}
# 	end
# 
# 
# configuration { "Debug", "vsllvm" }
# 	flags {
# 		"Symbols",
# 		"NoMultiProcessorCompilation",
# 	}
# 
# configuration { "Release", "vsllvm" }
# 	flags {
# 		"Optimize",
# 		"NoEditAndContinue",
# 		"NoIncrementalLink",
# 	}
# 
# -- Force VS2015/17 targets to use bundled SDL2
# if string.sub(_ACTION,1,4) == "vs20" and _OPTIONS["osd"]=="sdl" then
# 	if _OPTIONS["with-bundled-sdl2"]==nil then
# 		_OPTIONS["with-bundled-sdl2"] = "1"
# 	end
# end
# -- Build SDL2 for Android
# if _OPTIONS["targetos"] == "android" then
# 	_OPTIONS["with-bundled-sdl2"] = "1"
# end
# 
# configuration {}
# 
# if _OPTIONS["osd"] == "uwp" then
# 	windowstargetplatformversion("10.0.14393.0")
# 	windowstargetplatformminversion("10.0.14393.0")
# 	premake._filelevelconfig = true
# end
# 

# 
# if (_OPTIONS["PROJECT"] ~= nil) then
# 	PROJECT_DIR = path.join(path.getabsolute(".."),"projects",_OPTIONS["PROJECT"]) .. "/"
# 	if (not os.isfile(path.join("..", "projects", _OPTIONS["PROJECT"], "scripts", "target", _OPTIONS["target"],_OPTIONS["subtarget"] .. ".lua"))) then
# 		error("File definition for TARGET=" .. _OPTIONS["target"] .. " SUBTARGET=" .. _OPTIONS["subtarget"] .. " does not exist")
# 	end
# 	dofile (path.join(".." ,"projects", _OPTIONS["PROJECT"], "scripts", "target", _OPTIONS["target"],_OPTIONS["subtarget"] .. ".lua"))
# end
# if (_OPTIONS["SOURCES"] == nil and _OPTIONS["PROJECT"] == nil) then
# 	if (not os.isfile(path.join("target", _OPTIONS["target"],_OPTIONS["subtarget"] .. ".lua"))) then
# 		error("File definition for TARGET=" .. _OPTIONS["target"] .. " SUBTARGET=" .. _OPTIONS["subtarget"] .. " does not exist")
# 	end
# 	dofile (path.join("target", _OPTIONS["target"],_OPTIONS["subtarget"] .. ".lua"))
# end

include(scripts/cmake/target/${TARGET}/${SUBTARGET}.cmake)
# 
# configuration { "gmake or ninja" }
# 	flags {
# 		"SingleOutputDir",
# 	}
# 
# dofile ("toolchain.lua")
# 

if(WIN32 AND CMAKE_SIZEOF_VOID_P EQUAL 8)
  add_compile_definitions(X64_WINDOWS_ABI)
endif()

# define PTR64 if we are a 64-bit target
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    # 64 bits
    message(STATUS "64-bit compiler detected")
    add_compile_definitions(PTR64=1)
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    # 32 bits
    message(STATUS "32-bit compiler detected")
endif()

# define MAME_DEBUG if we are a debugging build
add_compile_definitions($<$<CONFIG:DEBUG>:MAME_DEBUG>)
add_compile_definitions($<$<CONFIG:DEBUG>:MAME_PROFILER>)
#add_compile_definitions($<$<CONFIG:DEBUG>:BGFX_CONFIG_DEBUG=1>)

# configuration { }
# 
# if _OPTIONS["PROFILER"]=="1" then
# 	defines{
# 		"MAME_PROFILER", -- define MAME_PROFILER if we are a profiling build
# 	}
# end
# 
add_compile_definitions($<$<CONFIG:RELEASE>:NDEBUG>)

if(WIN32)
  add_compile_definitions(CRLF=3)
else()
  add_compile_definitions(CRLF=2)
endif()
# 
# 
# if _OPTIONS["BIGENDIAN"]=="1" then
# 	if _OPTIONS["targetos"]=="macosx" then
# 		defines {
# 			"OSX_PPC",
# 		}
# 		buildoptions {
# 			"-Wno-unused-label",
# 			"-flax-vector-conversions",
# 		}
# 		if _OPTIONS["SYMBOLS"] then
# 			buildoptions {
# 				"-mlong-branch",
# 			}
# 		end
# 		configuration { "x64" }
# 			buildoptions {
# 				"-arch ppc64",
# 			}
# 			linkoptions {
# 				"-arch ppc64",
# 			}
# 		configuration { "x32" }
# 			buildoptions {
# 				"-arch ppc",
# 			}
# 			linkoptions {
# 				"-arch ppc",
# 			}
# 		configuration { }
# 	end
# else
# 	defines {
# 		"LSB_FIRST",
# 	}
# 	if _OPTIONS["targetos"]=="macosx" then
# 		configuration { "arm64" }
# 			buildoptions {
# 				"-arch arm64",
# 			}
# 			linkoptions {
# 				"-arch arm64",
# 			}
# 		configuration { "x64", "not arm64" }
# 			buildoptions {
# 				"-arch x86_64",
# 			}
# 			linkoptions {
# 				"-arch x86_64",
# 			}
# 		configuration { "x32", "not arm64" }
# 			buildoptions {
# 				"-arch i386",
# 			}
# 			linkoptions {
# 				"-arch i386",
# 			}
# 		configuration { }
# 	end
# end
include (TestBigEndian)
TEST_BIG_ENDIAN(BIG_ENDIAN)

if (NOT BIG_ENDIAN)
	add_compile_definitions(LSB_FIRST)
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
# 
# if not _OPTIONS["with-system-pugixml"] then
# 	defines {
# 		"PUGIXML_HEADER_ONLY",
# 	}
add_compile_definitions(PUGIXML_HEADER_ONLY)
# else
# 	links {
# 		ext_lib("pugixml"),
# 	}
# end
# 
# if _OPTIONS["NOASM"]=="1" then
# 	defines {
# 		"MAME_NOASM"
# 	}
# end
# 
if(NOT FORCE_DRC_C_BACKEND AND NOT BIGENDIAN)
  if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    add_compile_definitions(NATIVE_DRC=drcbe_x64)
  elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    add_compile_definitions(NATIVE_DRC=drcbe_x86)
  endif()
endif()
# 
# 	defines {
# 		"LUA_COMPAT_ALL",
# 		"LUA_COMPAT_5_1",
# 		"LUA_COMPAT_5_2",
# 	}
# 

# GCC
if((CMAKE_CXX_COMPILER_ID STREQUAL "GNU") OR (CMAKE_CXX_COMPILER_ID STREQUAL "Clang"))
# this speeds it up a bit by piping between the preprocessor/compiler/assembler
add_compile_options(-pipe)

# -- add -g if we need symbols, and ensure we have frame pointers
# if _OPTIONS["SYMBOLS"]~=nil and _OPTIONS["SYMBOLS"]~="0" then
# 	buildoptions {
# 		"-g" .. _OPTIONS["SYMLEVEL"],
# 		"-fno-omit-frame-pointer",
# 		"-fno-optimize-sibling-calls",
# 	}
# end
# 
# --# we need to disable some additional implicit optimizations for profiling
# if _OPTIONS["PROFILE"] then
# 	buildoptions {
# 		"-mno-omit-leaf-frame-pointer",
# 	}
# end

# only show shadow warnings when enabled
if(SHADOW_CHECK)
  add_compile_options(-Wshadow)
endif()

# only show deprecation warnings when enabled
if(NOT DEPRECATED)
  add_compile_options(-Wno-deprecated-declarations)
endif()
# 
# -- add profiling information for the compiler
# if _OPTIONS["PROFILE"] then
# 	buildoptions {
# 		"-pg",
# 	}
# 	linkoptions {
# 		"-pg",
# 	}
# end
# 
# if _OPTIONS["SYMBOLS"]~=nil and _OPTIONS["SYMBOLS"]~="0" then
# 	flags {
# 		"Symbols",
# 	}
# end
# 

# add the error warning flag

if(NOT NOWERROR)
  add_compile_options(-Werror)
endif()
# 
# -- if we are optimizing, include optimization options
# if _OPTIONS["OPTIMIZE"] then
# 	buildoptions {
# 		"-O".. _OPTIONS["OPTIMIZE"],
# 		"-fno-strict-aliasing"
# 	}
add_compile_options(-O3)
add_compile_options(-fno-strict-aliasing)
# 	if _OPTIONS["OPT_FLAGS"] then
# 		buildoptions {
# 			_OPTIONS["OPT_FLAGS"]
# 		}
# 	end
# end
# 
# configuration { "mingw-clang" }
# 	buildoptions {
# 		"-Xclang -flto-visibility-public-std", -- workround for __imp___ link errors
# 		"-Wno-nonportable-include-path", -- workround for clang 9.0.0 case sensitivity bug when including GL/glext.h
# 	}
# configuration {  }
# 
# if _OPTIONS["ARCHOPTS"] then
# 	buildoptions {
# 		_OPTIONS["ARCHOPTS"]
# 	}
# 	linkoptions {
# 		_OPTIONS["ARCHOPTS"]
# 	}
# end
# 
# if _OPTIONS["ARCHOPTS_C"] then
# 	buildoptions_c {
# 		_OPTIONS["ARCHOPTS_C"]
# 	}
# end
# 
# if _OPTIONS["ARCHOPTS_CXX"] then
# 	buildoptions_cpp {
# 		_OPTIONS["ARCHOPTS_CXX"]
# 	}
# end
# 
# if _OPTIONS["ARCHOPTS_OBJC"] then
# 	buildoptions_objc {
# 		_OPTIONS["ARCHOPTS_OBJC"]
# 	}
# end
# 
# if _OPTIONS["ARCHOPTS_OBJCXX"] then
# 	buildoptions_objcpp {
# 		_OPTIONS["ARCHOPTS_OBJCXX"]
# 	}
# end
# 
# if _OPTIONS["SHLIB"] then
# 	buildoptions {
# 		"-fPIC"
# 	}
# end
# 
# if _OPTIONS["SSE2"]=="1" then
# 	buildoptions {
# 		"-msse",
# 		"-msse2"
# 	}
# end
# 
# if _OPTIONS["SSE3"]=="1" then
# 	buildoptions {
# 		"-msse",
# 		"-msse2",
# 		"-msse3"
# 	}
# end
# 
# 
# if _OPTIONS["OPENMP"]=="1" then
# 	buildoptions {
# 		"-fopenmp",
# 	}
# 	linkoptions {
# 		"-fopenmp"
# 	}
# 	defines {
# 		"USE_OPENMP=1",
# 	}
# 
# else
# 	buildoptions {
add_compile_options(-Wno-unknown-pragmas)
# 	}
# end
# 
# if _OPTIONS["LDOPTS"] then
# 	linkoptions {
# 		_OPTIONS["LDOPTS"]
# 	}
# end
# 
# if _OPTIONS["MAP"] then
# 	if (_OPTIONS["target"] == _OPTIONS["subtarget"]) then
# 		linkoptions {
# 			"-Wl,-Map," .. "../../../../" .. _OPTIONS["target"] .. ".map"
# 		}
# 	else
# 		linkoptions {
# 			"-Wl,-Map," .. "../../../../"  .. _OPTIONS["target"] .. _OPTIONS["subtarget"] .. ".map"
# 		}
# 
# 	end
# end
# 
# 


# add a basic set of warnings
add_compile_options(-Wall)
add_compile_options(-Wcast-align)
add_compile_options(-Wformat-security)
add_compile_options(-Wundef)
add_compile_options(-Wwrite-strings)
add_compile_options(-Wno-conversion)
add_compile_options(-Wno-sign-compare)
add_compile_options(-Wno-error=deprecated-declarations)

# warnings only applicable to C compiles
add_compile_options($<$<COMPILE_LANGUAGE:C>:-Wpointer-arith>)
add_compile_options($<$<COMPILE_LANGUAGE:C>:-Wstrict-prototypes>)

# if _OPTIONS["targetos"]~="freebsd" then
# 	buildoptions_c {
# 		"-Wbad-function-cast",
# 	}
# end
# 
# warnings only applicable to OBJ-C compiles
add_compile_options($<$<COMPILE_LANGUAGE:OBJCXX>:-Wpointer-arith>)

# warnings only applicable to C++ compiles
add_compile_options($<$<COMPILE_LANGUAGE:CXX>:-Woverloaded-virtual>)

# if _OPTIONS["SANITIZE"] then
# 	buildoptions {
# 		"-fsanitize=".. _OPTIONS["SANITIZE"]
# 	}
# 	linkoptions {
# 		"-fsanitize=".. _OPTIONS["SANITIZE"]
# 	}
# 	if string.find(_OPTIONS["SANITIZE"], "address") then
# 		buildoptions {
# 			"-fsanitize-address-use-after-scope"
# 		}
# 		linkoptions {
# 			"-fsanitize-address-use-after-scope"
# 		}
# 	end
# 	if string.find(_OPTIONS["SANITIZE"], "undefined") then
# 		-- 'function' produces errors without delegates by design
# 		-- 'alignment' produces a lot of errors which we are not interested in
# 		buildoptions {
# 			"-fno-sanitize=function",
# 			"-fno-sanitize=alignment"
# 		}
# 		linkoptions {
# 			"-fno-sanitize=function",
# 			"-fno-sanitize=alignment"
# 		}
# 	end
# end
# 
# --ifneq (,$(findstring thread,$(SANITIZE)))
# --CCOMFLAGS += -fPIE
# --endif
# 
# 
if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
  if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS 6)
    message(FATAL_ERROR "Clang version 6.0 or later needed. Found ${CMAKE_CXX_COMPILER_VERSION}.")
  endif()
  add_compile_options(-fdiagnostics-show-note-include-stack)
  add_compile_options(-Wno-cast-align)
  add_compile_options(-Wno-constant-logical-operand)
  add_compile_options(-Wno-extern-c-compat)
  add_compile_options(-Wno-ignored-qualifiers)
  add_compile_options(-Wno-pragma-pack) #  clang 6.0 complains when the packing change lifetime is not contained within a header file.
  add_compile_options(-Wno-tautological-compare)
  add_compile_options(-Wno-unknown-attributes)
  add_compile_options(-Wno-unknown-warning-option)
  add_compile_options(-Wno-unused-value)
  add_compile_options(-Wno-unused-const-variable)

  if((CMAKE_CXX_COMPILER_VERSION VERSION_LESS 7) OR ((CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang") AND (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 10)))
    # clang 6.0 complains that [[maybe_unused]] is ignored for static data members
    add_compile_options(-Wno-error=ignored-attributes)
    add_compile_options(-Wno-error=unused-const-variable)
  endif()
  
  if((CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 10) OR ((CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang") AND (CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 12)))
    # clang 10.0 complains that expressions like 10 ^ 7 look like exponention
    add_compile_options(-Wno-xor-used-as-pow)
  endif()
endif()

if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
  if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS 7)
    message(FATAL_ERROR "GCC version 7.0 or later needed. Found ${CMAKE_CXX_COMPILER_VERSION}.")
  endif()

  add_compile_options($<$<COMPILE_LANGUAGE:CXX>:-Wimplicit-fallthrough>)
	add_compile_options(-Wno-unused-result) # needed for fgets,fread on linux
  # array bounds checking seems to be buggy in 4.8.1 (try it on video/stvvdp1.c and video/model1.c without -Wno-array-bounds)
  add_compile_options(-Wno-array-bounds)
  add_compile_options(-Wno-error=attributes) # GCC fails to recognize some uses of [[maybe_unused]]

  if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 8)
    add_compile_options(-Wno-format-overflow) # try machine/bfm_sc45_helper.cpp in GCC 8.0.1, among others
    add_compile_options(-Wno-stringop-truncation) # ImGui again
    add_compile_options(-Wno-stringop-overflow) # formats/victor9k_dsk.cpp bugs the compiler
    
    add_compile_options($<$<COMPILE_LANGUAGE:CXX>:-Wno-class-memaccess>) # many instances in ImGui and BGFX
  endif()
  if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 10)
    add_compile_options(-Wno-return-local-addr) # sqlite3.c in GCC 10
  endif()
  if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 11)
    add_compile_options(-Wno-nonnull)                # luaengine.cpp lambdas do not need "this" captured but GCC 11.1 erroneously insists
    add_compile_options(-Wno-stringop-overread)      # machine/bbc.cpp in GCC 11.1
    add_compile_options(-Wno-misleading-indentation) # sqlite3.c in GCC 11.1
    add_compile_options(-Wno-maybe-uninitialized)    # expat in GCC 11.1
  endif()
endif()

# if (_OPTIONS["PLATFORM"]=="arm") then
# 	buildoptions {
# 		"-Wno-cast-align",
# 	}
# end
endif()


# local subdir
# if (_OPTIONS["target"] == _OPTIONS["subtarget"]) then
# 	subdir = _OPTIONS["osd"] .. "/" .. _OPTIONS["target"]
# else
# 	subdir = _OPTIONS["osd"] .. "/" .. _OPTIONS["target"] .. _OPTIONS["subtarget"]
# end
# 
# if not toolchain(MAME_BUILD_DIR, subdir) then
# 	return -- no action specified
# end
# 
# configuration { "asmjs" }
# 	buildoptions {
# 		"-std=gnu89",
# 		"-Wno-implicit-function-declaration",
# 		"-s USE_SDL_TTF=2",
# 	}
# 	buildoptions_cpp {
# 		"-std=c++17",
# 		"-s DISABLE_EXCEPTION_CATCHING=2",
# 		"-s EXCEPTION_CATCHING_WHITELIST=\"['_ZN15running_machine17start_all_devicesEv','_ZN12cli_frontend7executeEiPPc','_ZN8chd_file11open_commonEb','_ZN8chd_file13read_metadataEjjRNSt3__212basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE','_ZN8chd_file13read_metadataEjjRNSt3__26vectorIhNS0_9allocatorIhEEEE','_ZNK19netlist_mame_device19base_validity_checkER16validity_checker']\"",
# 	}
# 	linkoptions {
# 		"-Wl,--start-group",
# 		"-r",
# 	}
# 	archivesplit_size "20"
# 

# configuration { "linux-*"}
# 		links {
# 			"dl",
# 			"rt",
# 		}
# 		if _OPTIONS["distro"]=="debian-stable" then
# 			defines
# 			{
# 				"NO_AFFINITY_NP",
# 			}
# 		end
# 

# configuration { "osx* or xcode4" }
# 		links {
# 			"pthread",
# 		}
# 

if (MINGW)
  add_link_options(-static)
endif()

# configuration { "mingw*" }
# 		if _OPTIONS["osd"]=="sdl" then
# 			linkoptions {
# 				"-Wl,--start-group",
# 			}
# 		else
# 			linkoptions {
# 				"-static",
# 			}
# 			flags {
# 				"LinkSupportCircularDependencies",
# 			}
# 		end
# 		links {
# 			"user32",
# 			"winmm",
# 			"advapi32",
# 			"shlwapi",
# 			"wsock32",
# 			"ws2_32",
# 			"psapi",
# 			"iphlpapi",
# 			"shell32",
# 			"userenv",
# 		}
# 
# configuration { "vsllvm" }
# 	defines {
# 		"XML_STATIC",
# 		"WIN32",
# 		"_WIN32",
# 		"_CRT_NONSTDC_NO_DEPRECATE",
# 		"_CRT_SECURE_NO_DEPRECATE",
# 		"_CRT_STDIO_LEGACY_WIDE_SPECIFIERS",
# 	}
# 	includedirs {
# 		MAME_DIR .. "3rdparty/dxsdk/Include"
# 	}
# 

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
  add_compile_definitions(
    XML_STATIC
    WIN32
    _WIN32
    _CRT_SECURE_NO_WARNINGS
    _CRT_NONSTDC_NO_DEPRECATE
    _CRT_SECURE_NO_DEPRECATE
    _CRT_STDIO_LEGACY_WIDE_SPECIFIERS
  )

 # -- Windows Store/Phone projects already link against the available libraries.
# if _OPTIONS["vs"]==nil or not (string.startswith(_OPTIONS["vs"], "winstore8") or string.startswith(_OPTIONS["vs"], "winphone8")) then
# 		links {
# 			"user32",
# 			"winmm",
# 			"advapi32",
# 			"shlwapi",
# 			"wsock32",
# 			"ws2_32",
# 			"psapi",
# 			"iphlpapi",
# 			"shell32",
# 			"userenv",
# 		}
# end
# 
  add_compile_options(/WX)     # Treats all compiler warnings as errors.
  add_compile_options(/w45038) # warning C5038: data member 'member1' will be initialized after data member 'member2'
	add_compile_options(/wd4003) # warning C4003: not enough actual parameters for macro 'xxx'
	add_compile_options(/wd4005) # warning C4005: The macro identifier is defined twice. The compiler uses the second macro definition
	add_compile_options(/wd4018) # warning C4018: 'x' : signed/unsigned mismatch
	add_compile_options(/wd4060) # warning C4060: switch statement contains no 'case' or 'default' labels
	add_compile_options(/wd4065) # warning C4065: switch statement contains 'default' but no 'case' labels
	add_compile_options(/wd4100) # warning C4100: 'xxx' : unreferenced formal parameter
	add_compile_options(/wd4127) # warning C4127: conditional expression is constant
	add_compile_options(/wd4146) # warning C4146: unary minus operator applied to unsigned type, result still unsigned
	add_compile_options(/wd4201) # warning C4201: nonstandard extension used : nameless struct/union
	add_compile_options(/wd4244) # warning C4244: 'argument' : conversion from 'xxx' to 'xxx', possible loss of data
	add_compile_options(/wd4245) # warning C4245: 'conversion' : conversion from 'type1' to 'type2', signed/unsigned mismatch
	add_compile_options(/wd4250) # warning C4250: 'xxx' : inherits 'xxx' via dominance
	add_compile_options(/wd4267) # warning C4267: 'var' : conversion from 'size_t' to 'type', possible loss of data
	add_compile_options(/wd4310) # warning C4310: cast truncates constant value
	add_compile_options(/wd4319) # warning C4319: 'operator' : zero extending 'type' to 'type' of greater size
	add_compile_options(/wd4324) # warning C4324: 'xxx' : structure was padded due to __declspec(align())
	add_compile_options(/wd4334) # warning C4334: '<<': result of 32-bit shift implicitly converted to 64 bits (was 64-bit shift intended?)
	add_compile_options(/wd4389) # warning C4389: 'operator' : signed/unsigned mismatch
	add_compile_options(/wd4456) # warning C4456: declaration of 'xxx' hides previous local declaration
	add_compile_options(/wd4457) # warning C4457: declaration of 'xxx' hides function parameter
	add_compile_options(/wd4458) # warning C4458: declaration of 'xxx' hides class member
	add_compile_options(/wd4459) # warning C4459: declaration of 'xxx' hides global declaration
	add_compile_options(/wd4702) # warning C4702: unreachable code
	add_compile_options(/wd4706) # warning C4706: assignment within conditional expression
	add_compile_options(/wd4804) # warning C4804: '>>': unsafe use of type 'bool' in operation
	add_compile_options(/wd4805) # warning C4805: 'x' : unsafe mix of type 'xxx' and type 'xxx' in operation
	add_compile_options(/wd4996) # warning C4996: 'function': was declared deprecated
endif()



# if _OPTIONS["vs"]=="clangcl" then
# 		buildoptions {
# 			"-Wno-enum-conversion",
# 			"-Wno-ignored-qualifiers",
# 			"-Wno-missing-braces",
# 			"-Wno-missing-field-initializers",
# 			"-Wno-new-returns-null",
# 			"-Wno-nonportable-include-path",
# 			"-Wno-pointer-bool-conversion",
# 			"-Wno-pragma-pack",
# 			"-Wno-switch",
# 			"-Wno-tautological-constant-out-of-range-compare",
# 			"-Wno-tautological-pointer-compare",
# 			"-Wno-unknown-warning-option",
# 			"-Wno-unused-const-variable",
# 			"-Wno-unused-function",
# 			"-Wno-unused-label",
# 			"-Wno-unused-local-typedef",
# 			"-Wno-unused-private-field",
# 			"-Wno-unused-variable",
# 			"-Wno-xor-used-as-pow",
# 			"-Wno-microsoft-cast",
# 		}
# end
# 
# 		linkoptions {
# 			"/ignore:4221", -- LNK4221: This object file does not define any previously undefined public symbols, so it will not be used by any link operation that consumes this library
# 		}
# 		includedirs {
# 			MAME_DIR .. "3rdparty/dxsdk/Include"
# 		}


add_custom_command(
    OUTPUT ${GEN_DIR}/version.cpp
    COMMAND ${CMAKE_COMMAND} -DGEN_DIR=${GEN_DIR} -P ${MAME_DIR}/scripts/cmake/version.cmake
)

# if (_OPTIONS["SOURCES"] ~= nil) then
# 	local str = _OPTIONS["SOURCES"]
# 	local sourceargs = ""
# 	for word in string.gmatch(str, '([^,]+)') do
# 		if (not os.isfile(path.join(MAME_DIR, word))) then
# 			print("File " .. word.. " does not exist")
# 			os.exit()
# 		end
# 		sourceargs = sourceargs .. " " .. word
# 	end
# 	OUT_STR = os.outputof( PYTHON .. " " .. MAME_DIR .. "scripts/build/makedep.py sourcesproject -r " .. MAME_DIR .. " -t " .. _OPTIONS["subtarget"] .. sourceargs )
# 	load(OUT_STR)()
# 	os.outputof( PYTHON .. " " .. MAME_DIR .. "scripts/build/makedep.py sourcesfilter" .. sourceargs .. " > ".. GEN_DIR  .. _OPTIONS["target"] .. "/" .. _OPTIONS["subtarget"] .. ".flt" )
# end
# 


if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/scripts/cmake/osd/${OSD}/osd.cmake)
  message(FATAL_ERROR "Unsupported value '${OSD}' for OSD")
endif()

include(scripts/cmake/osd/modules.cmake)
include(scripts/cmake/osd/${OSD}/cfg.cmake)
include(scripts/cmake/osd/${OSD}/osd.cmake)

# libs
add_project_to_group_and_include(libs utils scripts/cmake/lib/utils.cmake)
if (("NETLIST" IN_LIST MACHINES) OR BUILD_TOOLS)
  add_project_to_group_and_include(libs netlist scripts/cmake/lib/netlist.cmake)
endif()
add_project_to_group_and_include(libs formats scripts/cmake/lib/formats.cmake)

# 3rdparty
include(scripts/cmake/3rdparty.cmake)

# core
add_project_to_group_and_include(core emu scripts/cmake/emu.cmake)
if(NOT STANDALONE)
  add_project_to_group_and_include(core frontend scripts/cmake/mame/frontend.cmake)
endif()

# devices
include(scripts/cmake/devices.cmake)

# drivers
if(NOT STANDALONE)
  cmake_language(CALL createProjects_${TARGET}_${SUBTARGET} ${TARGET} ${SUBTARGET})
endif()

# emulator
include(scripts/cmake/main.cmake)
mainProject(${TARGET} ${SUBTARGET})
 
if (BUILD_TOOLS)
  include(scripts/cmake/tools.cmake)
endif()
 
if (BUILD_TESTS)
  include(scripts/cmake/tests.cmake)
endif()

if (BUILD_BENCHMARKS)
  include(scripts/cmake/benchmarks.cmake)
endif()

generate_has_header(CPUS)
generate_has_header(SOUNDS)
generate_has_header(MACHINES)
generate_has_header(VIDEOS)
generate_has_header(BUSES)
generate_has_header(FORMATS)

dump_mame_options()
