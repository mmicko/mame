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
#if (SEPARATE_BIN)
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
#else()
#  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR})
#endif()

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

option(TOOLS "Enable building tools." ON)
option(TESTS "Enable building tests." ON)
option(BENCHMARKS "Enable building benchmarks." ON)


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


option(PROFILE "Enable profiling." OFF)
option(PROFILER "Include the internal profiler." OFF)

option(SYMBOLS "Enable symbols." OFF)
set(SYMLEVEL "1" CACHE STRING "Symbols level.")
set_property(CACHE SYMLEVEL PROPERTY STRINGS "0" "1" "2")

set(OPTIMIZE "3" CACHE STRING "Symbols level.")
set_property(CACHE OPTIMIZE PROPERTY STRINGS "0" "1" "2" "3")

option(MAP "Generate a link map." OFF)

option(NOASM "Disable implementations based on assembler code." OFF)
option(FORCE_DRC_C_BACKEND "Force DRC C backend." OFF)
option(NOWERROR "Do not stop on errors." OFF)
option(DEPRECATED "Generate deprecation warnings during compilation." OFF)

option(SSE2 "SSE2 optimized code and SSE2 code generation." OFF)
option(SSE3 "SSE3 optimized code and SSE3 code generation." OFF)
option(OPENMP "OpenMP optimized code." OFF)
option(SEPARATE_BIN "Use separate bin folders." OFF)
option(SHADOW_CHECK "Shadow checks." OFF)
option(STRIP_SYMBOLS "Symbols stripping." OFF)
option(SHLIB "Generate shared libs." OFF)

# newoption {
# 	trigger = "SOURCES",
# 	description = "List of sources to compile.",
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
# dofile ("extlib.lua")
# 
if(SHLIB)
  set(LIBTYPE SHARED)
else()
	set(LIBTYPE STATIC)
endif()

find_package(PythonInterp 3.6 REQUIRED)

if(NOASM AND (NOT FORCE_DRC_C_BACKEND))
 	set(FORCE_DRC_C_BACKEND ON)
endif()

set(GEN_DIR "${CMAKE_SOURCE_DIR}/build/generated")


if ("${TARGET}" STREQUAL "")
  message(FATAL_ERROR "Target for build must be specified")
endif()
if ("${SUBTARGET}" STREQUAL "")
  message(FATAL_ERROR "Subtarget for build must be specified")
endif()

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

# configuration { "vs20*" }
# 	buildoptions {
if (MSVC)
  if(NOT CMAKE_BUILD_TYPE STREQUAL "Debug") # NoMultiProcessorCompilation
    add_compile_options(/MP)     # enable multi-core compilation
  endif()
  add_compile_options(/bigobj)
  add_compile_options(/W4) # ExtraWarnings
  if(NOT NOWERROR)
    add_compile_options(/WX) # FatalWarnings
  endif()
  add_link_options($<$<CONFIG:Release>:/INCREMENTAL:NO>) # NoIncrementalLink
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


if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/scripts/cmake/target/${TARGET}/${SUBTARGET}.cmake)
  message(FATAL_ERROR "File definition for TARGET=${TARGET} SUBTARGET=${SUBTARGET} does not exist")
endif()
include(scripts/cmake/target/${TARGET}/${SUBTARGET}.cmake)

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

if(PROFILER)
  add_compile_definitions(MAME_PROFILER) # define MAME_PROFILER if we are a profiling build
endif()

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
if (NOASM)
  add_compile_definitions(MAME_NOASM)
endif()
 
if(NOT FORCE_DRC_C_BACKEND AND NOT BIGENDIAN)
  if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    add_compile_definitions(NATIVE_DRC=drcbe_x64)
  elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    add_compile_definitions(NATIVE_DRC=drcbe_x86)
  endif()
endif()

# GCC
if((CMAKE_CXX_COMPILER_ID STREQUAL "GNU") OR (CMAKE_CXX_COMPILER_ID STREQUAL "Clang"))
# this speeds it up a bit by piping between the preprocessor/compiler/assembler
add_compile_options(-pipe)

# add -g if we need symbols, and ensure we have frame pointers
if(SYMBOLS)
  add_compile_options(-g${SYMLEVEL})
  add_compile_options(-fno-omit-frame-pointer)
  add_compile_options(-fno-optimize-sibling-calls)
endif()

# we need to disable some additional implicit optimizations for profiling
if(PROFILE)
  add_compile_options(-mno-omit-leaf-frame-pointer)
endif()

# only show shadow warnings when enabled
if(SHADOW_CHECK)
  add_compile_options(-Wshadow)
endif()

# only show deprecation warnings when enabled
if(NOT DEPRECATED)
  add_compile_options(-Wno-deprecated-declarations)
endif()

# add profiling information for the compiler
if(PROFILE)
  add_compile_options(-pg)
  add_link_options(-pg)
endif()

# add the error warning flag

if(NOT NOWERROR)
  add_compile_options(-Werror)
endif()

# if we are optimizing, include optimization options
add_compile_options(-O${OPTIMIZE})
add_compile_options(-fno-strict-aliasing)
# 
# configuration { "mingw-clang" }
# 	buildoptions {
# 		"-Xclang -flto-visibility-public-std", -- workround for __imp___ link errors
# 		"-Wno-nonportable-include-path", -- workround for clang 9.0.0 case sensitivity bug when including GL/glext.h
# 	}
# configuration {  }
# 
if(SHLIB)
  add_compile_options(-fPIC)
endif()

if(SSE2)
  add_compile_options(-msse -msse2)
endif()

if(SSE3)
  add_compile_options(-msse -msse2 -msse3)
endif()
if(OPENMP)
  add_compile_options(-fopenmp)
  add_link_options(-fopenmp)
  add_compile_definitions(USE_OPENMP=1)
else()
  add_compile_options(-Wno-unknown-pragmas)
endif()

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

message(STATUS "Platform: ${CMAKE_SYSTEM_PROCESSOR}")

if (${CMAKE_SYSTEM_PROCESSOR} STREQUAL "arm")
  add_compile_options(-Wno-cast-align)
endif()

endif()

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
if (("NETLIST" IN_LIST MACHINES) OR TOOLS)
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
 
if (TOOLS)
  include(scripts/cmake/tools.cmake)
endif()
 
if (TESTS)
  include(scripts/cmake/tests.cmake)
endif()

if (BENCHMARKS)
  include(scripts/cmake/benchmarks.cmake)
endif()

generate_has_header(CPUS)
generate_has_header(SOUNDS)
generate_has_header(MACHINES)
generate_has_header(VIDEOS)
generate_has_header(BUSES)
generate_has_header(FORMATS)

dump_mame_options()

############################################################################
##
##   makefile
##
##   Core makefile for building MAME and derivatives
##
############################################################################
#
#
#
############################################################################
##################   BEGIN USER-CONFIGURABLE OPTIONS   #####################
############################################################################
#
## REGENIE = 1
## VERBOSE = 1
## NOWERROR = 1
## IGNORE_GIT = 1
#
## TARGET = mame
## SUBTARGET = tiny
## TOOLS = 1
## TESTS = 1
## BENCHMARKS = 1
## OSD = sdl
#
## NO_OPENGL = 0
## USE_DISPATCH_GL = 0
## MODERN_WIN_API = 0
## DIRECTINPUT = 7
## USE_SDL = 1
## SDL_INI_PATH = .;$HOME/.mame/;ini;
## SDL2_MULTIAPI = 1
## NO_USE_MIDI = 1
## NO_USE_PORTAUDIO = 1
## NO_USE_PULSEAUDIO = 1
## USE_TAPTUN = 1
## USE_PCAP = 1
## USE_QTDEBUG = 1
## NO_X11 = 1
## NO_USE_XINPUT = 1
## NO_USE_XINPUT_WII_LIGHTGUN_HACK = 1
## FORCE_DRC_C_BACKEND = 1
#
## DEBUG = 1
## PROFILER = 1
## SANITIZE =
#
## PTR64 = 1
## BIGENDIAN = 1
## NOASM = 1
#
## OPTIMIZE = 3
## SYMBOLS = 1
## SYMLEVEL = 2
## MAP = 1
## PROFILE = 1
## ARCHOPTS =
## ARCHOPTS_C =
## ARCHOPTS_CXX =
## ARCHOPTS_OBJC =
## ARCHOPTS_OBJCXX =
## OPT_FLAGS =
## LDOPTS =
#
## USE_SYSTEM_LIB_ASIO = 1
## USE_SYSTEM_LIB_EXPAT = 1
## USE_SYSTEM_LIB_ZLIB = 1
## USE_SYSTEM_LIB_JPEG = 1
## USE_SYSTEM_LIB_FLAC = 1
## USE_SYSTEM_LIB_LUA = 1
## USE_SYSTEM_LIB_SQLITE3 = 1
## USE_SYSTEM_LIB_PORTMIDI = 1
## USE_SYSTEM_LIB_PORTAUDIO = 1
## USE_BUNDLED_LIB_SDL2 = 1
## USE_SYSTEM_LIB_UTF8PROC = 1
## USE_SYSTEM_LIB_GLM = 1
## USE_SYSTEM_LIB_RAPIDJSON = 1
## USE_SYSTEM_LIB_PUGIXML = 1
#
## MESA_INSTALL_ROOT = /opt/mesa
## SDL_INSTALL_ROOT = /opt/sdl2
## SDL_FRAMEWORK_PATH = $(HOME)/Library/Frameworks
## USE_LIBSDL = 1
## CYGWIN_BUILD = 1
#
## BUILDDIR = build
## TARGETOS = windows
## CROSS_BUILD = 1
## TOOLCHAIN =
## OVERRIDE_CC = cc
## OVERRIDE_CXX = c++
## OVERRIDE_LD = ld
## OVERRIDE_AR = ar
#
## DEPRECATED = 0
## LTO = 1
## SSE2 = 1
## OPENMP = 1
#
## SEPARATE_BIN = 1
## PYTHON_EXECUTABLE = python3
## SHADOW_CHECK = 1
## STRIP_SYMBOLS = 0
#
## QT_HOME = /usr/lib64/qt48/
#
## SOURCES = src/mame/drivers/asteroid.cpp,src/mame/audio/llander.cpp
#
## FORCE_VERSION_COMPILE = 1
#
## MSBUILD = 1
## IGNORE_BAD_LOCALISATION = 1
## PRECOMPILE = 0
#
## DEBUG_DIR=c:\test\location
## DEBUG_ARGS= -window -video bgfx
#
#ifdef PREFIX_MAKEFILE
#include $(PREFIX_MAKEFILE)
#else
#-include useroptions.mak
#endif
#
############################################################################
###################   END USER-CONFIGURABLE OPTIONS   ######################
############################################################################
#
#
#ifndef MAKETYPE
#MAKETYPE := gmake
#endif
#
#MAKEPARAMS := -R
#
##
## Determine running OS
##
#
#ifeq ($(OS),Windows_NT)
#OS := windows
#GENIEOS := windows
#PLATFORM := x86
#else
#UNAME := $(shell uname -mps)
#UNAME_M := $(shell uname -m)
#UNAME_P := $(shell uname -p)
#GENIEOS := linux
#PLATFORM := unknown
#ifneq ($(filter x86_64,$(UNAME_P)),)
#PLATFORM := x86
#endif
#ifneq ($(filter %86,$(UNAME_P)),)
#PLATFORM := x86
#endif
#ifneq ($(filter alpha,$(UNAME_M)),)
#PLATFORM := alpha
#endif
#ifneq ($(filter alpha,$(UNAME_P)),)
#PLATFORM := alpha
#endif
#ifneq ($(filter arm%,$(UNAME_M)),)
#PLATFORM := arm
#endif
#ifneq ($(filter arm%,$(UNAME_P)),)
#PLATFORM := arm
#endif
#ifneq ($(filter aarch64%,$(UNAME_M)),)
#PLATFORM := arm64
#endif
#ifneq ($(filter arm64%,$(UNAME_M)),)
#PLATFORM := arm64
#endif
#ifneq ($(filter aarch64%,$(UNAME_P)),)
#PLATFORM := arm64
#endif
#ifneq ($(filter powerpc,$(UNAME_P)),)
#PLATFORM := powerpc
#endif
#ifneq ($(filter riscv64%,$(UNAME_M)),)
#PLATFORM := riscv64
#endif
#ifneq ($(filter riscv64%,$(UNAME_P)),)
#PLATFORM := riscv64
#endif
#ifneq ($(filter mips64%,$(UNAME_M)),)
#ifeq ($(shell getconf LONG_BIT),64)
#PLATFORM := mips64
#endif
#endif
#ifeq ($(firstword $(filter Linux,$(UNAME))),Linux)
#OS := linux
#endif
#ifeq ($(firstword $(filter Solaris,$(UNAME))),Solaris)
#OS := solaris
#GENIEOS := solaris
#endif
#ifeq ($(firstword $(filter SunOS,$(UNAME))),SunOS)
#OS := solaris
#GENIEOS := solaris
#endif
#ifeq ($(firstword $(filter FreeBSD,$(UNAME))),FreeBSD)
#OS := freebsd
#GENIEOS := bsd
#endif
#ifeq ($(firstword $(filter GNU/kFreeBSD,$(UNAME))),GNU/kFreeBSD)
#OS := freebsd
#GENIEOS := freebsd
#endif
#ifeq ($(firstword $(filter NetBSD,$(UNAME))),NetBSD)
#OS := netbsd
#GENIEOS := freebsd
#endif
#ifeq ($(firstword $(filter OpenBSD,$(UNAME))),OpenBSD)
#OS := openbsd
#GENIEOS := freebsd
#endif
#ifeq ($(firstword $(filter Darwin,$(UNAME))),Darwin)
#OS := macosx
#GENIEOS := darwin
#endif
#ifeq ($(firstword $(filter Haiku,$(UNAME))),Haiku)
#OS := haiku
#endif
#ifndef OS
#$(error Unable to detect OS from uname -a: $(UNAME))
#endif
#endif
#
#MINGW:=
#ifdef MINGW64
#	MINGW := $(MINGW64)
#else
#	MINGW := $(MINGW32)
#endif
#
##-------------------------------------------------
## specify core target: mame, ldplayer
## specify subtarget: mame, arcade, mess, tiny, etc.
## build scripts will be run from
## scripts/target/$(TARGET)/$(SUBTARGET).lua
##-------------------------------------------------
#
#ifdef PROJECT
#PARAMS += --PROJECT='$(PROJECT)'
#TARGET := $(PROJECT)
#endif
#
#ifndef TARGET
#TARGET := mame
#endif
#
#ifndef SUBTARGET
#SUBTARGET := $(TARGET)
#endif
#
#SUBTARGET_FULL := $(subst -,_,$(SUBTARGET))
#
#
#CONFIG = release
#ifdef DEBUG
#ifneq '$(DEBUG)' '0'
#CONFIG := debug
#endif
#endif
#
#ifdef VERBOSE
#MAKEPARAMS += verbose=1
#else
#SILENT := @
#MAKEPARAMS += --no-print-directory
#endif
#
#ifndef BUILDDIR
#BUILDDIR := build
#endif
#
##-------------------------------------------------
## specify OS target, which further differentiates
## the underlying OS; supported values are:
## win32, unix, macosx
##-------------------------------------------------
#
#ifndef TARGETOS
#
#ifeq ($(OS),windows)
#TARGETOS := windows
#ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
#ARCHITECTURE := _x64
#endif
#ifeq ($(PROCESSOR_ARCHITECTURE),x86)
#ARCHITECTURE := _x64
#ifeq ($(PROCESSOR_ARCHITEW6432),AMD64)
#else
#ARCHITECTURE := _x86
#endif
#endif
#else
#UNAME    := $(shell uname -mps)
#TARGETOS := $(OS)
#
##-------------------------------------------------
## determine the whether -m32, -m64 or nothing
## should be passed to gcc when building genie
##-------------------------------------------------
#
#ifeq ($(ARCHITECTURE),_x86)
#MPARAM := -m32
#else
#ifeq ($(ARCHITECTURE),_x64)
#MPARAM := -m64
#else
#MPARAM :=
#endif
#endif
#
#ARCHITECTURE := _x86
#
#ifeq ($(firstword $(filter x86_64,$(UNAME))),x86_64)
#ARCHITECTURE := _x64
#endif
#ifeq ($(firstword $(filter amd64,$(UNAME))),amd64)
#ARCHITECTURE := _x64
#endif
#ifeq ($(firstword $(filter ppc64,$(UNAME))),ppc64)
#ARCHITECTURE := _x64
#endif
#ifeq ($(firstword $(filter powerpc64,$(UNAME))),powerpc64)
#ARCHITECTURE := _x64
#endif
#ifeq ($(firstword $(filter ppc64le,$(UNAME))),ppc64le)
#ARCHITECTURE := _x64
#endif
#ifeq ($(firstword $(filter s390x,$(UNAME))),s390x)
#ARCHITECTURE := _x64
#endif
#endif
#
#else
#CROSS_BUILD := 1
#endif # TARGET_OS
#
#ifdef PTR64
#ifeq ($(PTR64),1)
#ARCHITECTURE := _x64
#else
#ARCHITECTURE := _x86
#endif
#endif
#
#ifeq ($(OS),windows)
#ifndef MINGW64
#ARCHITECTURE := _x86
#endif
#ifeq ($(ARCHITECTURE),_x64)
#WINDRES  := $(MINGW64)/bin/windres
#else
#WINDRES  := $(MINGW32)/bin/windres
#endif
#else
#ifeq ($(ARCHITECTURE),_x64)
#WINDRES  := $(word 1,$(TOOLCHAIN) x86_64-w64-mingw32-)windres
#else
#WINDRES  := $(word 1,$(TOOLCHAIN) i686-w64-mingw32-)windres
#endif
#endif
#
## Emscripten
#ifeq ($(findstring emcc,$(CC)),emcc)
#TARGETOS := asmjs
#ARCHITECTURE :=
#ifndef NOASM
#	NOASM := 1
#endif
#endif
#
#ifeq ($(findstring ppc,$(UNAME)),ppc)
#ifndef FORCE_DRC_C_BACKEND
#	FORCE_DRC_C_BACKEND := 1
#endif
#endif
#
#ifeq ($(findstring powerpc,$(UNAME)),powerpc)
#ifndef FORCE_DRC_C_BACKEND
#	FORCE_DRC_C_BACKEND := 1
#endif
#endif
#
#ifeq ($(findstring arm,$(UNAME)),arm)
#ARCHITECTURE :=
#ifndef FORCE_DRC_C_BACKEND
#	FORCE_DRC_C_BACKEND := 1
#endif
#endif
#
#ifeq ($(findstring aarch64,$(UNAME)),aarch64)
#ARCHITECTURE :=
#ifndef FORCE_DRC_C_BACKEND
#	FORCE_DRC_C_BACKEND := 1
#endif
#endif
#
#ifeq ($(findstring s390x,$(UNAME)),s390x)
#ifndef FORCE_DRC_C_BACKEND
#	FORCE_DRC_C_BACKEND := 1
#endif
#endif
#
#ifeq ($(findstring riscv64,$(UNAME)),riscv64)
#ifndef FORCE_DRC_C_BACKEND
#	FORCE_DRC_C_BACKEND := 1
#endif
#endif
#
## Autodetect BIGENDIAN
## MacOSX
#ifndef BIGENDIAN
#ifneq (,$(findstring Power,$(UNAME)))
#BIGENDIAN := 1
#endif
## Linux
#ifneq (,$(findstring ppc,$(UNAME)))
#ifneq (,$(findstring ppc64le,$(UNAME)))
#BIGENDIAN := 0
#else
#BIGENDIAN := 1
#endif
#endif
#ifneq (,$(findstring s390x,$(UNAME)))
#BIGENDIAN := 1
#endif
## FreeBSD
#ifneq (,$(findstring powerpc,$(UNAME)))
#ifneq (,$(findstring powerpc64le,$(UNAME)))
#BIGENDIAN := 0
#else
#BIGENDIAN := 1
#endif
#endif
#endif # BIGENDIAN
#
#ifndef PYTHON_EXECUTABLE
#PYTHON := python
#else
#PYTHON := $(PYTHON_EXECUTABLE)
#endif
#
#ifneq ($(TARGETOS),asmjs)
#CC := $(SILENT)gcc
#LD := $(SILENT)g++
#CXX:= $(SILENT)g++
#endif
#
##-------------------------------------------------
## specify OSD layer: windows, sdl, etc.
## build scripts will be run from
## scripts/src/osd/$(OSD).lua
##-------------------------------------------------
#
#ifndef OSD
#
#OSD := sdl
#
#ifeq ($(TARGETOS),windows)
#OSD := windows
#endif
#
#ifeq ($(TARGETOS),linux)
#OSD := sdl
#endif
#
#ifeq ($(TARGETOS),freebsd)
#OSD := sdl
#endif
#
#ifeq ($(TARGETOS),netbsd)
#OSD := sdl
#endif
#
#ifeq ($(TARGETOS),openbsd)
#OSD := sdl
#endif
#
#ifeq ($(TARGETOS),solaris)
#OSD := sdl
#endif
#
#ifeq ($(TARGETOS),macosx)
#OSD := sdl
#endif
#
#ifeq ($(TARGETOS),asmjs)
#OSD := sdl
#endif
#endif
#
##-------------------------------------------------
## which 3rdparty library to build;
##  link against system (common) library otherwise
##-------------------------------------------------
#ifdef USE_SYSTEM_LIB_ASIO
#PARAMS += --with-system-asio='$(USE_SYSTEM_LIB_ASIO)'
#endif
#
#ifdef USE_SYSTEM_LIB_EXPAT
#PARAMS += --with-system-expat='$(USE_SYSTEM_LIB_EXPAT)'
#endif
#
#ifdef USE_SYSTEM_LIB_ZLIB
#PARAMS += --with-system-zlib='$(USE_SYSTEM_LIB_ZLIB)'
#endif
#
#ifdef USE_SYSTEM_LIB_JPEG
#PARAMS += --with-system-jpeg='$(USE_SYSTEM_LIB_JPEG)'
#endif
#
#ifdef USE_SYSTEM_LIB_FLAC
#PARAMS += --with-system-flac='$(USE_SYSTEM_LIB_FLAC)'
#endif
#
#ifdef USE_SYSTEM_LIB_LUA
#PARAMS += --with-system-lua='$(USE_SYSTEM_LIB_LUA)'
#endif
#
#ifdef USE_SYSTEM_LIB_SQLITE3
#PARAMS += --with-system-sqlite3='$(USE_SYSTEM_LIB_SQLITE3)'
#endif
#
#ifdef USE_SYSTEM_LIB_PORTMIDI
#PARAMS += --with-system-portmidi='$(USE_SYSTEM_LIB_PORTMIDI)'
#endif
#
#ifdef USE_SYSTEM_LIB_PORTAUDIO
#PARAMS += --with-system-portaudio='$(USE_SYSTEM_LIB_PORTAUDIO)'
#endif
#
#ifdef USE_SYSTEM_LIB_UTF8PROC
#PARAMS += --with-system-utf8proc='$(USE_SYSTEM_LIB_UTF8PROC)'
#endif
#
#ifdef USE_SYSTEM_LIB_GLM
#PARAMS += --with-system-glm='$(USE_SYSTEM_LIB_GLM)'
#endif
#
#ifdef USE_SYSTEM_LIB_RAPIDJSON
#PARAMS += --with-system-rapidjson='$(USE_SYSTEM_LIB_RAPIDJSON)'
#endif
#
#ifdef USE_SYSTEM_LIB_PUGIXML
#PARAMS += --with-system-pugixml='$(USE_SYSTEM_LIB_PUGIXML)'
#endif
#
## reverse logic for this one
#
#ifdef USE_BUNDLED_LIB_SDL2
#ifneq '$(USE_BUNDLED_LIB_SDL2)' '0'
#PARAMS += --with-bundled-sdl2
#endif
#endif
#
##-------------------------------------------------
## distribution may change things
##-------------------------------------------------
#
#ifeq ($(DISTRO),)
#DISTRO := generic
#else
#ifeq ($(DISTRO),debian-stable)
#else
#$(error DISTRO $(DISTRO) unknown)
#endif
#endif
#
#PARAMS+= --distro=$(DISTRO)
#
#ifdef TOOLCHAIN
#PARAMS += --TOOLCHAIN='$(TOOLCHAIN)'
#endif
#ifdef OVERRIDE_CC
#PARAMS += --CC='$(OVERRIDE_CC)'
#ifndef CROSS_BUILD
#CC := $(OVERRIDE_CC)
#endif
#endif
#ifdef OVERRIDE_CXX
#PARAMS += --CXX='$(OVERRIDE_CXX)'
#ifndef CROSS_BUILD
#CXX := $(OVERRIDE_CXX)
#endif
#endif
#ifdef OVERRIDE_LD
#PARAMS += --LD='$(OVERRIDE_LD)'
#ifndef CROSS_BUILD
#LD := $(OVERRIDE_LD)
#endif
#endif
#ifdef OVERRIDE_AR
#PARAMS += --AR='$(OVERRIDE_AR)'
#ifndef CROSS_BUILD
#AR := $(OVERRIDE_AR)
#endif
#endif
#
##-------------------------------------------------
## sanity check the configuration
##-------------------------------------------------
#
## enable symbols as it is useless without them
#ifdef SANITIZE
#SYMBOLS = 1
#endif
#
## profiler defaults to on for DEBUG builds
#ifdef DEBUG
#ifneq '$(DEBUG)' '0'
#ifndef PROFILER
#PROFILER = 1
#endif
#endif
#endif
#
## allow gprof profiling as well, which overrides the internal PROFILER
## also enable symbols as it is useless without them
#ifdef PROFILE
#PROFILER =
#SYMBOLS = 1
#endif
#
## specify a default optimization level if none explicitly stated
#ifndef OPTIMIZE
#OPTIMIZE = 3
#endif
#
## set the symbols level
#ifdef SYMBOLS
#PARAMS += --SYMBOLS='$(SYMBOLS)'
#ifneq '$(SYMBOLS)' '0'
#ifndef SYMLEVEL
#ifdef SOURCES
#SYMLEVEL = 2
#else
#SYMLEVEL = 1
#endif
#endif
#endif
#endif
#
#ifdef TOOLS
#ifneq '$(TOOLS)' '0'
#PARAMS += --with-tools
#endif
#endif
#
#ifdef TESTS
#ifneq '$(TESTS)' '0'
#PARAMS += --with-tests
#endif
#endif
#
#ifdef BENCHMARKS
#ifneq '$(BENCHMARKS)' '0'
#PARAMS += --with-benchmarks
#endif
#endif
#
#ifdef SYMLEVEL
#PARAMS += --SYMLEVEL='$(SYMLEVEL)'
#endif
#
#ifdef PROFILER
#PARAMS += --PROFILER='$(PROFILER)'
#endif
#
#ifdef PROFILE
#PARAMS += --PROFILE='$(PROFILE)'
#endif
#
#ifdef OPTIMIZE
#PARAMS += --OPTIMIZE=$(OPTIMIZE)
#endif
#
#ifdef SHLIB
#PARAMS += --SHLIB=$(SHLIB)
#endif
#
#ifdef ARCHOPTS
#PARAMS += --ARCHOPTS='$(ARCHOPTS)'
#endif
#
#ifdef ARCHOPTS_C
#PARAMS += --ARCHOPTS_C='$(ARCHOPTS_C)'
#endif
#
#ifdef ARCHOPTS_CXX
#PARAMS += --ARCHOPTS_CXX='$(ARCHOPTS_CXX)'
#endif
#
#ifdef ARCHOPTS_OBJC
#PARAMS += --ARCHOPTS_OBJC='$(ARCHOPTS_OBJC)'
#endif
#
#ifdef ARCHOPTS_OBJCXX
#PARAMS += --ARCHOPTS_OBJCXX='$(ARCHOPTS_OBJCXX)'
#endif
#
#ifdef OPT_FLAGS
#PARAMS += --OPT_FLAGS='$(OPT_FLAGS)'
#endif
#
#ifdef MAP
#PARAMS += --MAP='$(MAP)'
#endif
#
#ifdef NOASM
#TARGET_PARAMS += --NOASM='$(NOASM)'
#endif
#
#ifdef BIGENDIAN
#PARAMS += --BIGENDIAN='$(BIGENDIAN)'
#endif
#
#ifdef FORCE_DRC_C_BACKEND
#PARAMS += --FORCE_DRC_C_BACKEND='$(FORCE_DRC_C_BACKEND)'
#endif
#
#ifdef NOWERROR
#PARAMS += --NOWERROR='$(NOWERROR)'
#endif
#
#ifdef TARGET
#PARAMS += --target='$(TARGET)'
#endif
#
#ifdef SUBTARGET_FULL
#PARAMS += --subtarget='$(SUBTARGET_FULL)'
#endif
#
#ifdef OSD
#TARGET_PARAMS += --osd='$(OSD)'
#endif
#
#ifdef BUILDDIR
#PARAMS += --build-dir='$(BUILDDIR)'
#endif
#
#ifdef TARGETOS
#TARGET_PARAMS += --targetos='$(TARGETOS)'
#endif
#
#ifdef USE_TAPTUN
#PARAMS += --USE_TAPTUN='$(USE_TAPTUN)'
#endif
#
#ifdef USE_PCAP
#PARAMS += --USE_PCAP='$(USE_PCAP)'
#endif
#
#ifdef NO_OPENGL
#PARAMS += --NO_OPENGL='$(NO_OPENGL)'
#endif
#
#ifdef USE_DISPATCH_GL
#PARAMS += --USE_DISPATCH_GL='$(USE_DISPATCH_GL)'
#endif
#
#ifdef NO_USE_MIDI
#PARAMS += --NO_USE_MIDI='$(NO_USE_MIDI)'
#endif
#
#ifdef NO_USE_PORTAUDIO
#PARAMS += --NO_USE_PORTAUDIO='$(NO_USE_PORTAUDIO)'
#endif
#
#ifdef NO_USE_PULSEAUDIO
#PARAMS += --NO_USE_PULSEAUDIO='$(NO_USE_PULSEAUDIO)'
#endif
#
#ifdef USE_QTDEBUG
#PARAMS += --USE_QTDEBUG='$(USE_QTDEBUG)'
#endif
#
#ifdef MODERN_WIN_API
#PARAMS += --MODERN_WIN_API='$(MODERN_WIN_API)'
#endif
#
#ifdef DIRECTINPUT
#PARAMS += --DIRECTINPUT='$(DIRECTINPUT)'
#endif
#
#ifdef USE_SDL
#PARAMS += --USE_SDL='$(USE_SDL)'
#endif
#
#ifdef SDL_INI_PATH
#PARAMS += --SDL_INI_PATH='$(SDL_INI_PATH)'
#endif
#
#ifdef CYGWIN_BUILD
#PARAMS += --CYGWIN_BUILD='$(CYGWIN_BUILD)'
#endif
#
#ifdef MESA_INSTALL_ROOT
#PARAMS += --MESA_INSTALL_ROOT='$(MESA_INSTALL_ROOT)'
#endif
#
#ifdef NO_X11
#PARAMS += --NO_X11='$(NO_X11)'
#endif
#
#ifdef NO_USE_XINPUT
#PARAMS += --NO_USE_XINPUT='$(NO_USE_XINPUT)'
#endif
#
#ifdef NO_USE_XINPUT_WII_LIGHTGUN_HACK
#PARAMS += --NO_USE_XINPUT_WII_LIGHTGUN_HACK='$(NO_USE_XINPUT_WII_LIGHTGUN_HACK)'
#endif
#
#ifdef SDL_LIBVER
#PARAMS += --SDL_LIBVER='$(SDL_LIBVER)'
#endif
#
#ifdef SDL2_MULTIAPI
#PARAMS += --SDL2_MULTIAPI='$(SDL2_MULTIAPI)'
#endif
#
#ifdef SDL_INSTALL_ROOT
#PARAMS += --SDL_INSTALL_ROOT='$(SDL_INSTALL_ROOT)'
#endif
#
#ifdef SDL_FRAMEWORK_PATH
#PARAMS += --SDL_FRAMEWORK_PATH='$(SDL_FRAMEWORK_PATH)'
#endif
#
#ifdef USE_LIBSDL
#PARAMS += --USE_LIBSDL='$(USE_LIBSDL)'
#endif
#
#ifdef LDOPTS
#PARAMS += --LDOPTS='$(LDOPTS)'
#endif
#
#ifdef LTO
#PARAMS += --LTO='$(LTO)'
#endif
#
#ifdef DEPRECATED
#PARAMS += --DEPRECATED='$(DEPRECATED)'
#endif
#
#ifdef SSE2
#PARAMS += --SSE2='$(SSE2)'
#endif
#
#ifdef OPENMP
#PARAMS += --OPENMP='$(OPENMP)'
#endif
#
#ifdef SEPARATE_BIN
#PARAMS += --SEPARATE_BIN='$(SEPARATE_BIN)'
#endif
#
#ifdef PYTHON_EXECUTABLE
#PARAMS += --PYTHON_EXECUTABLE='$(PYTHON_EXECUTABLE)'
#endif
#
#ifdef SHADOW_CHECK
#PARAMS += --SHADOW_CHECK='$(SHADOW_CHECK)'
#endif
#
#ifdef STRIP_SYMBOLS
#PARAMS += --STRIP_SYMBOLS='$(STRIP_SYMBOLS)'
#endif
#
#ifdef QT_HOME
#PARAMS += --QT_HOME='$(QT_HOME)'
#endif
#
#ifdef SOURCES
#PARAMS += --SOURCES='$(SOURCES)'
#endif
#
#ifdef FORCE_VERSION_COMPILE
#PARAMS += --FORCE_VERSION_COMPILE='$(FORCE_VERSION_COMPILE)'
#endif
#
#ifdef PLATFORM
#TARGET_PARAMS += --PLATFORM='$(PLATFORM)'
#endif
#
#ifdef PRECOMPILE
#PARAMS += --precompile='$(PRECOMPILE)'
#endif
#
#ifdef DEBUG_DIR
#PARAMS += --DEBUG_DIR='$(DEBUG_DIR)'
#endif
#
#ifdef DEBUG_ARGS
#PARAMS += --DEBUG_ARGS='$(DEBUG_ARGS)'
#endif
#
#ifdef WEBASSEMBLY
#PARAMS += --WEBASSEMBLY='$(WEBASSEMBLY)'
#endif
#
#ifdef SANITIZE
#PARAMS += --SANITIZE='$(SANITIZE)'
#endif
#
##-------------------------------------------------
## All scripts
##-------------------------------------------------
#
#SCRIPTS = scripts/genie.lua \
#	scripts/src/lib.lua \
#	scripts/src/emu.lua \
#	scripts/src/machine.lua \
#	scripts/src/main.lua \
#	scripts/src/3rdparty.lua \
#	scripts/src/cpu.lua \
#	scripts/src/mame/frontend.lua \
#	scripts/src/osd/modules.lua \
#	$(wildcard scripts/src/osd/$(OSD)*.lua) \
#	scripts/src/sound.lua \
#	scripts/src/tools.lua \
#	scripts/src/tests.lua \
#	scripts/src/benchmarks.lua \
#	scripts/src/video.lua \
#	scripts/src/bus.lua \
#	scripts/src/netlist.lua \
#	scripts/src/formats.lua \
#	scripts/toolchain.lua \
#	scripts/src/osd/modules.lua \
#	$(wildcard src/osd/$(OSD)/$(OSD).mak) \
#	$(wildcard src/$(TARGET)/$(SUBTARGET_FULL).mak)
#
#ifeq ($(SUBTARGET_FULL),mame)
#SCRIPTS += scripts/target/$(TARGET)/arcade.lua
#SCRIPTS += scripts/target/$(TARGET)/mess.lua
#endif
#
#ifndef SOURCES
#ifdef PROJECT
#SCRIPTS += projects/$(PROJECT)/scripts/target/$(TARGET)/$(SUBTARGET_FULL).lua
#else
#SCRIPTS += scripts/target/$(TARGET)/$(SUBTARGET_FULL).lua
#endif
#endif
#
#ifdef REGENIE
#SCRIPTS+= regenie
#endif
#
##-------------------------------------------------
## Dependent stuff
##-------------------------------------------------
#
## extension for executables
#EXE :=
#
#ifeq ($(OS),windows)
#EXE := .exe
#endif
#
#SHELLTYPE := msdos
#ifeq (,$(ComSpec)$(COMSPEC))
#  SHELLTYPE := posix
#endif
#ifeq (/bin,$(findstring /bin,$(SHELL)))
#  SHELLTYPE := posix
#endif
#ifeq (/bin,$(findstring /bin,$(MAKESHELL)))
#  SHELLTYPE := posix
#endif
#
#ifeq (posix,$(SHELLTYPE))
#  MKDIR = $(SILENT) mkdir -p "$(1)"
#  COPY  = $(SILENT) cp -fR "$(1)"/* "$(2)"
#else
#  MKDIR = $(SILENT) mkdir "$(subst /,\\,$(1))" 2> nul || exit 0
#  COPY  = $(SILENT) copy /Y "$(subst /,\\,$(1))" "$(subst /,\\,$(2))" > nul || exit 0
#endif
#
#GENDIR = $(BUILDDIR)/generated
#
## all sources are under the src/ directory
#SRC = src
#
## all 3rd party sources are under the 3rdparty/ directory
#3RDPARTY = 3rdparty
#ifeq ($(SUBTARGET_FULL),mame)
#PROJECT_NAME := $(SUBTARGET_FULL)
#else ifeq ($(SUBTARGET_FULL),mess)
#PROJECT_NAME := $(SUBTARGET_FULL)
#else
#PROJECT_NAME := $(TARGET)$(SUBTARGET_FULL)
#endif
#
#
#ifeq ($(OS),windows)
#ifeq (posix,$(SHELLTYPE))
#GCC_VERSION      := $(shell $(TOOLCHAIN)$(subst @,,$(CC)) -dumpversion 2> /dev/null)
#CLANG_VERSION    := $(shell $(TOOLCHAIN)$(subst @,,$(CC)) --version 2> /dev/null| head -n 1 | grep clang | sed "s/^.*[^0-9]\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*$$/\1/" | head -n 1)
#PYTHON_AVAILABLE := $(shell $(PYTHON) --version > /dev/null 2>&1 && echo python)
#GIT_AVAILABLE    := $(shell git --version > /dev/null 2>&1 && echo git)
#else
#GCC_VERSION      := $(shell $(TOOLCHAIN)$(subst @,,$(CC)) -dumpversion 2> NUL)
#CLANG_VERSION    := $(shell $(TOOLCHAIN)$(subst @,,$(CC)) --version 2> NUL| head -n 1 | grep clang | sed "s/^.*[^0-9]\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*$$/\1/" | head -n 1)
#PYTHON_AVAILABLE := $(shell $(PYTHON) --version > NUL 2>&1 && echo python)
#GIT_AVAILABLE    := $(shell git --version > NUL 2>&1 && echo git)
#endif
#ifdef MSBUILD
#MSBUILD_PARAMS   := /v:minimal /m:$(NUMBER_OF_PROCESSORS)
#ifeq ($(CONFIG),debug)
#MSBUILD_PARAMS += /p:Configuration=Debug
#else
#MSBUILD_PARAMS += /p:Configuration=Release
#endif
#ifeq ($(ARCHITECTURE),_x64)
#MSBUILD_PARAMS += /p:Platform=x64
#else
#MSBUILD_PARAMS += /p:Platform=win32
#endif
#ifeq (posix,$(SHELLTYPE))
#MSBUILD_PARAMS := $(subst /,-,$(MSBUILD_PARAMS))
#endif
#endif
#ifdef FASTBUILD
#FASTBUILD_PARAMS := -j$(NUMBER_OF_PROCESSORS)
#ifeq ($(CONFIG),debug)
#FASTBUILD_TARGET := all-Debug
#else
#FASTBUILD_TARGET := all-Release
#endif
#ifeq ($(ARCHITECTURE),_x64)
#FASTBUILD_PARAMS += $(FASTBUILD_TARGET)-x64
#else
#FASTBUILD_PARAMS += $(FASTBUILD_TARGET)-x32
#endif
#endif
#else
#ifdef OVERRIDE_CC
#GCC_VERSION      := $(shell $(TOOLCHAIN)$(subst @,,$(OVERRIDE_CC)) -dumpversion 2> /dev/null)
#else
#GCC_VERSION      := $(shell $(TOOLCHAIN)$(subst @,,$(CC)) -dumpversion 2> /dev/null)
#endif
#ifeq ($(findstring emcc,$(CC)),emcc)
#CLANG_VERSION    := $(shell $(TOOLCHAIN)$(subst @,,$(CC))  -v  2>&1 >/dev/null | grep 'clang version' | head -n 1 | grep -e 'version [0-9]\+\.[0-9]\+\(\.[0-9]\+\)\?' -o | grep -e '[0-9]\+\.[0-9]\+\(\.[0-9]\+\)\?' -o | tail -n 1)
#else
#CLANG_VERSION    := $(shell $(TOOLCHAIN)$(subst @,,$(CC))  --version  2> /dev/null | head -n 1 | grep -e 'version [0-9]\+\.[0-9]\+\(\.[0-9]\+\)\?' -o | grep -e '[0-9]\+\.[0-9]\+\(\.[0-9]\+\)\?' -o | tail -n 1)
#endif
#PYTHON_AVAILABLE := $(shell $(PYTHON) --version > /dev/null 2>&1 && echo python)
#GIT_AVAILABLE := $(shell git --version > /dev/null 2>&1 && echo git)
#endif
#
#ifeq ($(CLANG_VERSION),)
#$(info GCC $(GCC_VERSION) detected)
#else
#$(info Clang $(CLANG_VERSION) detected)
#ifneq ($(TARGETOS),asmjs)
#ifeq ($(ARCHITECTURE),_x64)
#ARCHITECTURE := _x64_clang
#else
#ifneq ($(filter arm64%,$(UNAME_M)),)
#ARCHITECTURE := _arm64_clang
#else
#ARCHITECTURE := _x86_clang
#endif
#endif
#endif
#endif
#
#ifneq ($(PYTHON_AVAILABLE),python)
#$(error Python is not available in path)
#endif
#
#ifneq ($(GIT_AVAILABLE),git)
#	IGNORE_GIT := 1
#endif
#ifeq ($(wildcard .git/*),)
#	IGNORE_GIT := 1
#endif
#
#ifeq (posix,$(SHELLTYPE))
#OLD_GIT_VERSION := $(shell cat $(GENDIR)/git_desc 2> /dev/null)
#else
#OLD_GIT_VERSION := $(shell cat $(GENDIR)/git_desc 2> NUL)
#endif
#ifneq ($(IGNORE_GIT),1)
#NEW_GIT_VERSION := $(shell git describe --dirty)
#else
#NEW_GIT_VERSION := unknown
#endif
#ifeq ($(NEW_GIT_VERSION),)
#NEW_GIT_VERSION := unknown
#endif
#
#GENIE := 3rdparty/genie/bin/$(GENIEOS)/genie$(EXE)
#
#ifeq ($(TARGET),$(SUBTARGET_FULL))
#FULLTARGET := $(TARGET)
#else
#FULLTARGET := $(TARGET)$(SUBTARGET_FULL)
#endif
#PROJECTDIR := $(BUILDDIR)/projects/$(OSD)/$(FULLTARGET)
#PROJECTDIR_SDL := $(BUILDDIR)/projects/sdl/$(FULLTARGET)
#PROJECTDIR_WIN := $(BUILDDIR)/projects/windows/$(FULLTARGET)
#
#.PHONY: all clean regenie generate FORCE
#all: $(GENIE) $(TARGETOS)$(ARCHITECTURE)
#regenie:
#FORCE:
#
##-------------------------------------------------
## gmake-mingw64-gcc
##-------------------------------------------------
#
#$(PROJECTDIR)/$(MAKETYPE)-mingw64-gcc/Makefile: makefile $(SCRIPTS) $(GENIE)
#ifndef MINGW64
#	$(error MINGW64 is not set)
#endif
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --gcc=mingw64-gcc --gcc_version=$(GCC_VERSION) $(MAKETYPE)
#
#.PHONY: windows_x64
#windows_x64: generate $(PROJECTDIR)/$(MAKETYPE)-mingw64-gcc/Makefile
#ifndef MINGW64
#	$(error MINGW64 is not set)
#endif
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-mingw64-gcc config=$(CONFIG)64 WINDRES=$(WINDRES) precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-mingw64-gcc config=$(CONFIG)64 WINDRES=$(WINDRES)
#
##-------------------------------------------------
## gmake-mingw32-gcc
##-------------------------------------------------
#
#.PHONY: windows
#windows: windows_x86
#
#$(PROJECTDIR)/$(MAKETYPE)-mingw32-gcc/Makefile: makefile $(SCRIPTS) $(GENIE)
#ifndef MINGW32
#	$(error MINGW32 is not set)
#endif
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --gcc=mingw32-gcc --gcc_version=$(GCC_VERSION) $(MAKETYPE)
#
#.PHONY: windows_x86
#windows_x86: generate $(PROJECTDIR)/$(MAKETYPE)-mingw32-gcc/Makefile
#ifndef MINGW32
#	$(error MINGW32 is not set)
#endif
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-mingw32-gcc config=$(CONFIG)32 WINDRES=$(WINDRES) precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-mingw32-gcc config=$(CONFIG)32 WINDRES=$(WINDRES)
#
##-------------------------------------------------
## gmake-mingw-clang
##-------------------------------------------------
#
#$(PROJECTDIR)/$(MAKETYPE)-mingw-clang/Makefile: makefile $(SCRIPTS) $(GENIE)
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --gcc=mingw-clang --gcc_version=$(CLANG_VERSION) $(MAKETYPE)
#
#.PHONY: windows_x64_clang
#windows_x64_clang: generate $(PROJECTDIR)/$(MAKETYPE)-mingw-clang/Makefile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-mingw-clang config=$(CONFIG)64 WINDRES=$(WINDRES) precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-mingw-clang config=$(CONFIG)64 WINDRES=$(WINDRES)
#
#.PHONY: windows_x86_clang
#windows_x86_clang: generate $(PROJECTDIR)/$(MAKETYPE)-mingw-clang/Makefile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-mingw-clang config=$(CONFIG)32 WINDRES=$(WINDRES) precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-mingw-clang config=$(CONFIG)32 WINDRES=$(WINDRES)
#
##-------------------------------------------------
## Visual Studio 2015
##-------------------------------------------------
#
#.PHONY: vs2015
#vs2015: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) vs2015
#ifdef MSBUILD
#	$(SILENT) msbuild.exe $(PROJECTDIR_WIN)/vs2015/$(PROJECT_NAME).sln $(MSBUILD_PARAMS)
#endif
#
#.PHONY: vs2015_intel
#vs2015_intel: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --vs=intel-15 vs2015
#ifdef MSBUILD
#	$(SILENT) msbuild.exe $(PROJECTDIR_WIN)/vs2015-intel/$(PROJECT_NAME).sln $(MSBUILD_PARAMS)
#endif
#
#.PHONY: vs2015_xp
#vs2015_xp: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --vs=vs2015-xp vs2015
#ifdef MSBUILD
#	$(SILENT) msbuild.exe $(PROJECTDIR_WIN)/vs2015-xp/$(PROJECT_NAME).sln $(MSBUILD_PARAMS)
#endif
#
#.PHONY: vs2015_uwp
#vs2015_uwp: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --vs=winstore82 --osd=uwp --NO_USE_MIDI=1 --NO_OPENGL=1 --USE_QTDEBUG=0 --NO_USE_PORTAUDIO=1 --MODERN_WIN_API=1 vs2015
#ifdef MSBUILD
#	$(SILENT) msbuild.exe $(PROJECTDIR_WIN)/vs2015-winstore82/$(PROJECT_NAME).sln $(MSBUILD_PARAMS)
#endif
#
#.PHONY: vs2015_fastbuild
#vs2015_fastbuild: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) vs2015-fastbuild
#ifdef FASTBUILD
#	$(SILENT) fbuild.exe -config $(PROJECTDIR_WIN)/vs2015-fastbuild/ftbuild.bff $(FASTBUILD_PARAMS)
#endif
#
##-------------------------------------------------
## Visual Studio 2017
##-------------------------------------------------
#
#.PHONY: vs2017
#vs2017: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) vs2017
#ifdef MSBUILD
#	$(SILENT) msbuild.exe $(PROJECTDIR_WIN)/vs2017/$(PROJECT_NAME).sln $(MSBUILD_PARAMS)
#endif
#
#.PHONY: vs2017_intel
#vs2017_intel: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --vs=intel-15 vs2017
#ifdef MSBUILD
#	$(SILENT) msbuild.exe $(PROJECTDIR_WIN)/vs2017-intel/$(PROJECT_NAME).sln $(MSBUILD_PARAMS)
#endif
#
#.PHONY: vs2017_xp
#vs2017_xp: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --vs=vs2017-xp vs2017
#ifdef MSBUILD
#	$(SILENT) msbuild.exe $(PROJECTDIR_WIN)/vs2017-xp/$(PROJECT_NAME).sln $(MSBUILD_PARAMS)
#endif
#
#.PHONY: vs2017_uwp
#vs2017_uwp: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --vs=winstore82 --osd=uwp --NO_USE_MIDI=1 --NO_OPENGL=1 --USE_QTDEBUG=0 --NO_USE_PORTAUDIO=1 --MODERN_WIN_API=1 vs2017
#ifdef MSBUILD
#	$(SILENT) msbuild.exe $(PROJECTDIR_WIN)/vs2017-winstore82/$(PROJECT_NAME).sln $(MSBUILD_PARAMS)
#endif
#
#.PHONY: vs2017_fastbuild
#vs2017_fastbuild: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) vs2017-fastbuild
#ifdef FASTBUILD
#	$(SILENT) fbuild.exe -config $(PROJECTDIR_WIN)/vs2017-fastbuild/ftbuild.bff $(FASTBUILD_PARAMS)
#endif
#
##-------------------------------------------------
## Visual Studio 2019
##-------------------------------------------------
#
#.PHONY: vs2019
#vs2019: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) vs2019
#ifdef MSBUILD
#	$(SILENT) msbuild.exe $(PROJECTDIR_WIN)/vs2019/$(PROJECT_NAME).sln $(MSBUILD_PARAMS)
#endif
#
#.PHONY: vs2019_clang
#vs2019_clang: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --vs=clangcl --NO_USE_PORTAUDIO=1 vs2019
#ifdef MSBUILD
#	$(SILENT) msbuild.exe $(PROJECTDIR_WIN)/vs2019-clang/$(PROJECT_NAME).sln $(MSBUILD_PARAMS)
#endif
#
#.PHONY: vs2019_intel
#vs2019_intel: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --vs=intel-15 vs2019
#ifdef MSBUILD
#	$(SILENT) msbuild.exe $(PROJECTDIR_WIN)/vs2019-intel/$(PROJECT_NAME).sln $(MSBUILD_PARAMS)
#endif
#
#.PHONY: vs2019_uwp
#vs2019_uwp: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --vs=winstore82 --osd=uwp --NO_USE_MIDI=1 --NO_OPENGL=1 --USE_QTDEBUG=0 --NO_USE_PORTAUDIO=1 --MODERN_WIN_API=1 vs2019
#ifdef MSBUILD
#	$(SILENT) msbuild.exe $(PROJECTDIR_WIN)/vs2019-winstore82/$(PROJECT_NAME).sln $(MSBUILD_PARAMS)
#endif
#
#.PHONY: vs2019_fastbuild
#vs2019_fastbuild: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) vs2019-fastbuild
#ifdef FASTBUILD
#	$(SILENT) fbuild.exe -config $(PROJECTDIR_WIN)/vs2019-fastbuild/ftbuild.bff $(FASTBUILD_PARAMS)
#endif
#
##-------------------------------------------------
## Visual Studio LLVM
##-------------------------------------------------
#
#.PHONY: vsllvm
#vsllvm: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) vsllvm
#ifdef MSBUILD
#	$(SILENT) msbuild.exe $(PROJECTDIR_WIN)/vsllvm/$(PROJECT_NAME).sln $(MSBUILD_PARAMS)
#endif
#
##-------------------------------------------------
## android-ndk
##-------------------------------------------------
#
#.PHONY: android-ndk
#android-ndk:
#ifndef ANDROID_NDK_LLVM
#	$(error ANDROID_NDK_LLVM is not set)
#endif
#ifndef ANDROID_NDK_ROOT
#	$(error ANDROID_NDK_ROOT is not set)
#endif
#	$(eval CLANG_VERSION := $(shell $(ANDROID_NDK_LLVM)/bin/clang -dumpversion 2> /dev/null))
#
##-------------------------------------------------
## android-arm
##-------------------------------------------------
#
#$(PROJECTDIR_SDL)/$(MAKETYPE)-android-arm/Makefile: makefile $(SCRIPTS) $(GENIE)
#ifndef ANDROID_NDK_ARM
#	$(error ANDROID_NDK_ARM is not set)
#endif
#	$(SILENT) $(GENIE) $(PARAMS) --gcc=android-arm --gcc_version=$(CLANG_VERSION) --osd=sdl --targetos=android --PLATFORM=arm --NO_USE_MIDI=1 --NO_OPENGL=1 --USE_QTDEBUG=0 --NO_X11=1 --USE_TAPTUN=0 --USE_PCAP=0 --NOASM=1 $(MAKETYPE)
#
#.PHONY: android-arm
#android-arm: android-ndk generate $(PROJECTDIR_SDL)/$(MAKETYPE)-android-arm/Makefile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR_SDL)/$(MAKETYPE)-android-arm config=$(CONFIG) precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR_SDL)/$(MAKETYPE)-android-arm config=$(CONFIG)
#
##-------------------------------------------------
## android-arm64
##-------------------------------------------------
#
#$(PROJECTDIR_SDL)/$(MAKETYPE)-android-arm64/Makefile: makefile $(SCRIPTS) $(GENIE)
#ifndef ANDROID_NDK_ARM64
#	$(error ANDROID_NDK_ARM64 is not set)
#endif
#	$(SILENT) $(GENIE) $(PARAMS) --gcc=android-arm64 --gcc_version=$(CLANG_VERSION) --osd=sdl --targetos=android --PLATFORM=arm64 --NO_USE_MIDI=1 --NO_OPENGL=1 --USE_QTDEBUG=0 --NO_X11=1 --USE_TAPTUN=0 --USE_PCAP=0 --NOASM=1 $(MAKETYPE)
#
#.PHONY: android-arm64
#android-arm64: android-ndk generate $(PROJECTDIR_SDL)/$(MAKETYPE)-android-arm64/Makefile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR_SDL)/$(MAKETYPE)-android-arm64 config=$(CONFIG) precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR_SDL)/$(MAKETYPE)-android-arm64 config=$(CONFIG)
#
##-------------------------------------------------
## android-x86
##-------------------------------------------------
#
#$(PROJECTDIR_SDL)/$(MAKETYPE)-android-x86/Makefile: makefile $(SCRIPTS) $(GENIE)
#ifndef ANDROID_NDK_X86
#	$(error ANDROID_NDK_X86 is not set)
#endif
#	$(SILENT) $(GENIE) $(PARAMS) --gcc=android-x86 --gcc_version=$(CLANG_VERSION) --osd=sdl --targetos=android --PLATFORM=x86 --NO_USE_MIDI=1 --NO_OPENGL=1 --USE_QTDEBUG=0 --NO_X11=1 --USE_TAPTUN=0 --USE_PCAP=0 $(MAKETYPE)
#
#.PHONY: android-x86
#android-x86: android-ndk generate $(PROJECTDIR_SDL)/$(MAKETYPE)-android-x86/Makefile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR_SDL)/$(MAKETYPE)-android-x86 config=$(CONFIG) precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR_SDL)/$(MAKETYPE)-android-x86 config=$(CONFIG)
#
##-------------------------------------------------
## android-x64
##-------------------------------------------------
#
#$(PROJECTDIR_SDL)/$(MAKETYPE)-android-x64/Makefile: makefile $(SCRIPTS) $(GENIE)
#ifndef ANDROID_NDK_X64
#	$(error ANDROID_NDK_X64 is not set)
#endif
#	$(SILENT) $(GENIE) $(PARAMS) --gcc=android-x64 --gcc_version=$(CLANG_VERSION) --osd=sdl --targetos=android --PLATFORM=x64 --NO_USE_MIDI=1 --NO_OPENGL=1 --USE_QTDEBUG=0 --NO_X11=1 --USE_TAPTUN=0 --USE_PCAP=0 $(MAKETYPE)
#
#.PHONY: android-x64
#android-x64: android-ndk generate $(PROJECTDIR_SDL)/$(MAKETYPE)-android-x64/Makefile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR_SDL)/$(MAKETYPE)-android-x64 config=$(CONFIG) precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR_SDL)/$(MAKETYPE)-android-x64 config=$(CONFIG)
#
##-------------------------------------------------
## asmjs / Emscripten
##-------------------------------------------------
#
#$(PROJECTDIR)/$(MAKETYPE)-asmjs/Makefile: makefile $(SCRIPTS) $(GENIE)
#ifndef EMSCRIPTEN
#	$(error EMSCRIPTEN is not set)
#endif
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --gcc=asmjs --gcc_version=$(CLANG_VERSION) $(MAKETYPE)
#
#.PHONY: asmjs
#asmjs: generate $(PROJECTDIR)/$(MAKETYPE)-asmjs/Makefile
#ifndef EMSCRIPTEN
#	$(error EMSCRIPTEN is not set)
#endif
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-asmjs config=$(CONFIG) precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-asmjs config=$(CONFIG)
#
##-------------------------------------------------
## gmake-linux
##-------------------------------------------------
#
#$(PROJECTDIR)/$(MAKETYPE)-linux/Makefile: makefile $(SCRIPTS) $(GENIE)
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --gcc=linux-gcc --gcc_version=$(GCC_VERSION) $(MAKETYPE)
#
#.PHONY: linux_x64
#linux_x64: generate $(PROJECTDIR)/$(MAKETYPE)-linux/Makefile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-linux config=$(CONFIG)64 precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-linux config=$(CONFIG)64
#
#.PHONY: linux_x86
#linux_x86: generate $(PROJECTDIR)/$(MAKETYPE)-linux/Makefile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-linux config=$(CONFIG)32 precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-linux config=$(CONFIG)32
#
#.PHONY: linux
#linux: generate $(PROJECTDIR)/$(MAKETYPE)-linux/Makefile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-linux config=$(CONFIG) precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-linux config=$(CONFIG)
#
##-------------------------------------------------
## gmake-linux-clang
##-------------------------------------------------
#
#$(PROJECTDIR)/$(MAKETYPE)-linux-clang/Makefile: makefile $(SCRIPTS) $(GENIE)
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --gcc=linux-clang --gcc_version=$(CLANG_VERSION) $(MAKETYPE)
#
#.PHONY: linux_x64_clang
#linux_x64_clang: generate $(PROJECTDIR)/$(MAKETYPE)-linux-clang/Makefile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-linux-clang config=$(CONFIG)64 precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-linux-clang config=$(CONFIG)64
#
#.PHONY: linux_x86_clang
#linux_x86_clang: generate $(PROJECTDIR)/$(MAKETYPE)-linux-clang/Makefile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-linux-clang config=$(CONFIG)32 precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-linux-clang config=$(CONFIG)32
#
##-------------------------------------------------
## gmake-osx
##-------------------------------------------------
#
#$(PROJECTDIR)/$(MAKETYPE)-osx/Makefile: makefile $(SCRIPTS) $(GENIE)
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --gcc=osx --gcc_version=$(GCC_VERSION) $(MAKETYPE)
#
#.PHONY: macosx_x64
#macosx_x64: generate $(PROJECTDIR)/$(MAKETYPE)-osx/Makefile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-osx config=$(CONFIG)64 precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-osx config=$(CONFIG)64
#
#.PHONY: macosx
#macosx: macosx_x86
#
#.PHONY: macosx_x86
#macosx_x86: generate $(PROJECTDIR)/$(MAKETYPE)-osx/Makefile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-osx config=$(CONFIG)32 precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-osx config=$(CONFIG)32
#
##-------------------------------------------------
## gmake-osx-clang
##-------------------------------------------------
#
#$(PROJECTDIR)/$(MAKETYPE)-osx-clang/Makefile: makefile $(SCRIPTS) $(GENIE)
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --gcc=osx-clang --gcc_version=$(CLANG_VERSION) $(MAKETYPE)
#
#.PHONY: macosx_x64_clang
#macosx_x64_clang: generate $(PROJECTDIR)/$(MAKETYPE)-osx-clang/Makefile
#	$(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-osx-clang config=$(CONFIG)64 precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-osx-clang config=$(CONFIG)64
#
#.PHONY: macosx_arm64_clang
#macosx_arm64_clang: generate $(PROJECTDIR)/$(MAKETYPE)-osx-clang/Makefile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-osx-clang config=$(CONFIG)64 precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-osx-clang config=$(CONFIG)64
#
#.PHONY: macosx_x86_clang
#macosx_x86_clang: generate $(PROJECTDIR)/$(MAKETYPE)-osx-clang/Makefile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-osx-clang config=$(CONFIG)32 precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-osx-clang config=$(CONFIG)32
#
#.PHONY: xcode4
#xcode4: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --targetos=macosx --xcode=osx xcode4
#
#.PHONY: xcode4-ios
#xcode4-ios: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --targetos=macosx --xcode=ios xcode4
#
##-------------------------------------------------
## gmake-solaris
##-------------------------------------------------
#
#ifndef CLANG_VERSION
#$(PROJECTDIR)/$(MAKETYPE)-solaris/Makefile: makefile $(SCRIPTS) $(GENIE)
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --gcc=solaris --gcc_version=$(GCC_VERSION) $(MAKETYPE)
#endif
#.PHONY: solaris_x64
#solaris_x64: generate $(PROJECTDIR)/$(MAKETYPE)-solaris/Makefile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-solaris config=$(CONFIG)64 precompile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-solaris config=$(CONFIG)64
#
#.PHONY: solaris
#solaris: solaris_x86
#
#.PHONY: solaris_x86
#solaris_x86: generate $(PROJECTDIR)/$(MAKETYPE)-solaris/Makefile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-solaris config=$(CONFIG)32 precompile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-solaris config=$(CONFIG)32
#
##-------------------------------------------------
## gmake-solaris-clang
##-------------------------------------------------
#
#ifdef CLANG_VERSION
#$(PROJECTDIR)/$(MAKETYPE)-solaris/Makefile: makefile $(SCRIPTS) $(GENIE)
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --gcc=solaris --gcc_version=$(CLANG_VERSION) $(MAKETYPE)
#endif
#.PHONY: solaris_x64_clang
#solaris_x64_clang: generate $(PROJECTDIR)/$(MAKETYPE)-solaris/Makefile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-solaris config=$(CONFIG)64 precompile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-solaris config=$(CONFIG)64
#
#.PHONY: solaris_clang
#solaris_clang: solaris_x86_clang
#
#.PHONY: solaris_x86_clang
#solaris_x86_clang: generate $(PROJECTDIR)/$(MAKETYPE)-solaris/Makefile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-solaris config=$(CONFIG)32 precompile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-solaris config=$(CONFIG)32
#
##-------------------------------------------------
## gmake-freebsd
##-------------------------------------------------
#
#$(PROJECTDIR)/$(MAKETYPE)-freebsd/Makefile: makefile $(SCRIPTS) $(GENIE)
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --gcc=freebsd --gcc_version=$(GCC_VERSION) $(MAKETYPE)
#
#.PHONY: freebsd_x64
#freebsd_x64: generate $(PROJECTDIR)/$(MAKETYPE)-freebsd/Makefile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-freebsd config=$(CONFIG)64 precompile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-freebsd config=$(CONFIG)64
#
#.PHONY: freebsd
#freebsd: freebsd_x86
#
#.PHONY: freebsd_x86
#freebsd_x86: generate $(PROJECTDIR)/$(MAKETYPE)-freebsd/Makefile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-freebsd config=$(CONFIG)32 precompile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-freebsd config=$(CONFIG)32
#
##-------------------------------------------------
## gmake-freebsd-clang
##-------------------------------------------------
#
#$(PROJECTDIR)/$(MAKETYPE)-freebsd-clang/Makefile: makefile $(SCRIPTS) $(GENIE)
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --gcc=freebsd-clang --gcc_version=$(CLANG_VERSION) $(MAKETYPE)
#
#.PHONY: freebsd_x64_clang
#freebsd_x64_clang: generate $(PROJECTDIR)/$(MAKETYPE)-freebsd-clang/Makefile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-freebsd-clang config=$(CONFIG)64 precompile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-freebsd-clang config=$(CONFIG)64
#
#.PHONY: freebsd_x86_clang
#freebsd_x86_clang: generate $(PROJECTDIR)/$(MAKETYPE)-freebsd-clang/Makefile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-freebsd-clang config=$(CONFIG)32 precompile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-freebsd-clang config=$(CONFIG)32
#
##-------------------------------------------------
## gmake-netbsd
##-------------------------------------------------
#
#$(PROJECTDIR)/$(MAKETYPE)-netbsd/Makefile: makefile $(SCRIPTS) $(GENIE)
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --gcc=netbsd --gcc_version=$(GCC_VERSION) $(MAKETYPE)
#
#.PHONY: netbsd_x64
#netbsd_x64: generate $(PROJECTDIR)/$(MAKETYPE)-netbsd/Makefile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-netbsd config=$(CONFIG)64 precompile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-netbsd config=$(CONFIG)64
#
#.PHONY: netbsd
#netbsd: netbsd_x86
#
#.PHONY: netbsd_x86
#netbsd_x86: generate $(PROJECTDIR)/$(MAKETYPE)-netbsd/Makefile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-netbsd config=$(CONFIG)32 precompile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-netbsd config=$(CONFIG)32
#
##-------------------------------------------------
## gmake-netbsd-clang
##-------------------------------------------------
#
#$(PROJECTDIR)/$(MAKETYPE)-netbsd-clang/Makefile: makefile $(SCRIPTS) $(GENIE)
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --gcc=netbsd-clang --gcc_version=$(CLANG_VERSION) $(MAKETYPE)
#
#.PHONY: netbsd_x64_clang
#netbsd_x64_clang: generate $(PROJECTDIR)/$(MAKETYPE)-netbsd-clang/Makefile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-netbsd-clang config=$(CONFIG)64 precompile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-netbsd-clang config=$(CONFIG)64
#
#.PHONY: netbsd_x86_clang
#netbsd_x86_clang: generate $(PROJECTDIR)/$(MAKETYPE)-netbsd-clang/Makefile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-netbsd-clang config=$(CONFIG)32 precompile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-netbsd-clang config=$(CONFIG)32
#
##-------------------------------------------------
## gmake-openbsd
##-------------------------------------------------
#
#$(PROJECTDIR)/$(MAKETYPE)-openbsd/Makefile: makefile $(SCRIPTS) $(GENIE)
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --gcc=openbsd --gcc_version=$(GCC_VERSION) $(MAKETYPE)
#
#.PHONY: openbsd_x64
#openbsd_x64: generate $(PROJECTDIR)/$(MAKETYPE)-openbsd/Makefile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-openbsd config=$(CONFIG)64 precompile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-openbsd config=$(CONFIG)64
#
#.PHONY: openbsd
#openbsd: openbsd_x86
#
#.PHONY: openbsd_x86
#openbsd_x86: generate $(PROJECTDIR)/$(MAKETYPE)-openbsd/Makefile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-openbsd config=$(CONFIG)32 precompile
#	$(SILENT) $(MAKE) -C $(PROJECTDIR)/$(MAKETYPE)-openbsd config=$(CONFIG)32
#
##-------------------------------------------------
## gmake-steamlink
##-------------------------------------------------
#
#$(PROJECTDIR)/$(MAKETYPE)-steamlink/Makefile: makefile $(SCRIPTS) $(GENIE)
#ifndef MARVELL_SDK_PATH
#	$(error MARVELL_SDK_PATH is not set)
#endif
#ifndef MARVELL_ROOTFS
#	$(error MARVELL_ROOTFS is not set)
#endif
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) --gcc=steamlink --gcc_version=$(GCC_VERSION) --NO_OPENGL=1 --NO_USE_MIDI=1 --NO_X11=1 --NOASM=1 --SDL_INSTALL_ROOT=$(MARVELL_ROOTFS)/usr  $(MAKETYPE)
#
#.PHONY: steamlink
#steamlink: generate $(PROJECTDIR)/$(MAKETYPE)-steamlink/Makefile
#ifndef MARVELL_SDK_PATH
#	$(error MARVELL_SDK_PATH is not set)
#endif
#ifndef MARVELL_ROOTFS
#	$(error MARVELL_ROOTFS is not set)
#endif
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-steamlink config=$(CONFIG) precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR)/$(MAKETYPE)-steamlink config=$(CONFIG)
#
##-------------------------------------------------
## gmake-rpi
##-------------------------------------------------
#
#$(PROJECTDIR_SDL)/$(MAKETYPE)-rpi/Makefile: makefile $(SCRIPTS) $(GENIE)
#ifndef RASPBERRY_SDK_PATH
#	$(error RASPBERRY_SDK_PATH is not set)
#endif
#ifndef RASPBERRY_SYSROOT
#	$(error RASPBERRY_SYSROOT is not set)
#endif
#	$(SILENT) $(GENIE) $(PARAMS) --gcc=rpi --gcc_version=4.9.2 --osd=sdl --targetos=rpi --targetos=rpi --NO_USE_MIDI=1 --PLATFORM=arm --NOASM=1 --USE_QTDEBUG=0 --SDL_INSTALL_ROOT=$(RASPBERRY_SYSROOT)/usr  $(MAKETYPE)
#
#.PHONY: rpi
#rpi: generate $(PROJECTDIR_SDL)/$(MAKETYPE)-rpi/Makefile
#ifndef RASPBERRY_SDK_PATH
#	$(error RASPBERRY_SDK_PATH is not set)
#endif
#ifndef RASPBERRY_SYSROOT
#	$(error RASPBERRY_SYSROOT is not set)
#endif
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR_SDL)/$(MAKETYPE)-rpi config=$(CONFIG) precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR_SDL)/$(MAKETYPE)-rpi config=$(CONFIG)
#
##-------------------------------------------------
## gmake-ci20
##-------------------------------------------------
#
#$(PROJECTDIR_SDL)/$(MAKETYPE)-ci20/Makefile: makefile $(SCRIPTS) $(GENIE)
#ifndef MIPS_LINUXGNU_ROOT
#	$(error MIPS_LINUXGNU_ROOT is not set)
#endif
#ifndef CI20_SYSROOT
#	$(error CI20_SYSROOT is not set)
#endif
#	$(SILENT) $(GENIE) $(PARAMS) --gcc=ci20 --gcc_version=4.9.2 --osd=sdl --targetos=ci20 --targetos=ci20 --NO_USE_MIDI=1  --PLATFORM=arm --NOASM=1 --USE_QTDEBUG=0 --SDL_INSTALL_ROOT=$(RASPBERRY_SYSROOT)/usr  $(MAKETYPE)
#
#.PHONY: ci20
#ci20: generate $(PROJECTDIR_SDL)/$(MAKETYPE)-ci20/Makefile
#ifndef MIPS_LINUXGNU_ROOT
#	$(error MIPS_LINUXGNU_ROOT is not set)
#endif
#ifndef CI20_SYSROOT
#	$(error CI20_SYSROOT is not set)
#endif
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR_SDL)/$(MAKETYPE)-ci20 config=$(CONFIG) precompile
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C $(PROJECTDIR_SDL)/$(MAKETYPE)-ci20 config=$(CONFIG)
#
##-------------------------------------------------
## cmake
##-------------------------------------------------
#
#.PHONY: cmake
#cmake: generate
#	$(SILENT) $(GENIE) $(PARAMS) $(TARGET_PARAMS) cmake
#ifneq (posix,$(SHELLTYPE))
#	$(SILENT)echo cmake_minimum_required(VERSION 2.8.4) > CMakeLists.txt
#	$(SILENT)echo add_subdirectory($(PROJECTDIR)/cmake) >> CMakeLists.txt
#else
#	$(SILENT)echo "cmake_minimum_required(VERSION 2.8.4)" > CMakeLists.txt
#	$(SILENT)echo "add_subdirectory($(PROJECTDIR)/cmake)" >> CMakeLists.txt
#endif
#
##-------------------------------------------------
## Clean/bootstrap
##-------------------------------------------------
#
#GENIE_SRC=$(wildcard 3rdparty/genie/src/host/*.c)
#
#$(GENIE): $(GENIE_SRC)
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C 3rdparty/genie/build/gmake.$(GENIEOS) -f genie.make MPARAM=$(MPARAM)
#
#3rdparty/genie/src/hosts/%.c:
#
#.PHONY: genieclean
#genieclean:
#	$(SILENT) $(MAKE) $(MAKEPARAMS) -C 3rdparty/genie/build/gmake.$(GENIEOS) -f genie.make MPARAM=$(MPARAM) clean
#
#clean: genieclean
#	@echo Cleaning...
#	-@rm -rf $(BUILDDIR)
#	-@rm -rf 3rdparty/bgfx/.build
#
#GEN_FOLDERS := $(GENDIR)/$(TARGET)/layout/ $(GENDIR)/$(TARGET)/$(SUBTARGET_FULL)/ $(GENDIR)/mame/drivers/ $(GENDIR)/mame/machine/
#
#rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))
#LAYOUTS=$(wildcard $(SRC)/$(TARGET)/layout/*.lay)
#
#ifneq (,$(wildcard src/osd/$(OSD)/$(OSD).mak))
#include src/osd/$(OSD)/$(OSD).mak
#endif
#
#ifneq (,$(wildcard src/$(TARGET)/$(TARGET).mak))
#include src/$(TARGET)/$(TARGET).mak
#endif
#
#$(GEN_FOLDERS):
#	-$(call MKDIR,$@)
#
#genie: $(GENIE)
#
#generate: \
#		genie \
#		$(GEN_FOLDERS) \
#		$(GENDIR)/version.cpp \
#		$(patsubst %.po,%.mo,$(call rwildcard, language/, *.po)) \
#		$(patsubst $(SRC)/%.lay,$(GENDIR)/%.lh,$(LAYOUTS)) \
#		$(GENDIR)/includes/SDL2
#
#$(GENDIR)/includes/SDL2:
#	-$(call MKDIR,$@)
#	-$(call COPY,3rdparty/SDL2/include,$(GENDIR)/includes/SDL2)
#
#ifneq ($(NEW_GIT_VERSION),$(OLD_GIT_VERSION))
#stale:
#
#.PHONY: stale
#
#$(GENDIR)/git_desc: stale | $(GEN_FOLDERS)
#	@echo $(NEW_GIT_VERSION) > $@
#endif
#
#ifeq (posix,$(SHELLTYPE))
#$(GENDIR)/version.cpp: makefile $(GENDIR)/git_desc | $(GEN_FOLDERS)
#	@echo '#define BARE_BUILD_VERSION "0.232"' > $@
#	@echo 'extern const char bare_build_version[];' >> $@
#	@echo 'extern const char build_version[];' >> $@
#	@echo 'const char bare_build_version[] = BARE_BUILD_VERSION;' >> $@
#	@echo 'const char build_version[] = BARE_BUILD_VERSION " ($(NEW_GIT_VERSION))";' >> $@
#else
#$(GENDIR)/version.cpp: makefile $(GENDIR)/git_desc | $(GEN_FOLDERS)
#	@echo #define BARE_BUILD_VERSION "0.232" > $@
#	@echo extern const char bare_build_version[]; >> $@
#	@echo extern const char build_version[]; >> $@
#	@echo const char bare_build_version[] = BARE_BUILD_VERSION; >> $@
#	@echo const char build_version[] = BARE_BUILD_VERSION " ($(NEW_GIT_VERSION))"; >> $@
#endif
#
#
#$(GENDIR)/%.lh: $(SRC)/%.lay scripts/build/complay.py | $(GEN_FOLDERS)
#	@echo Compressing $<...
#	$(SILENT)$(PYTHON) scripts/build/complay.py $< $@ layout_$(basename $(notdir $<))
#
#%.mo: %.po
#	@echo Converting translation $<...
#ifdef IGNORE_BAD_LOCALISATION
#	$(SILENT)$(PYTHON) scripts/build/msgfmt.py --output-file $@ $< || exit 0
#else
#	$(SILENT)$(PYTHON) scripts/build/msgfmt.py --output-file $@ $<
#endif
#
##-------------------------------------------------
## Regression tests
##-------------------------------------------------
#
#include regtests/regtests.mak
#
#.PHONY: tests
#
#tests: $(REGTESTS)
#
##-------------------------------------------------
## Source cleanup
##-------------------------------------------------
#
#.PHONY: cleansrc
#
## FIXME: make this work with SEPARATE_BIN
#cleansrc:
#	@echo Cleaning up tabs/spaces/end of lines....
#ifeq (posix,$(SHELLTYPE))
#	$(SILENT) find src -name \*.c -exec ./srcclean {} \; >&2
#	$(SILENT) find src -name \*.cpp -exec ./srcclean {} \; >&2
#	$(SILENT) find src -name \*.h -exec ./srcclean {} \; >&2
#	$(SILENT) find src -name \*.hpp -exec ./srcclean {} \; >&2
#	$(SILENT) find src -name \*.hxx -exec ./srcclean {} \; >&2
#	$(SILENT) find src -name \*.ipp -exec ./srcclean {} \; >&2
#	$(SILENT) find src -name \*.lay -exec ./srcclean {} \; >&2
#	$(SILENT) find src -name \*.lst -exec ./srcclean {} \; >&2
#	$(SILENT) find src -name \*.mak -exec ./srcclean {} \; >&2
#	$(SILENT) find src -name \*.mm -exec ./srcclean {} \; >&2
#	$(SILENT) find hash -name \*.hsi -exec ./srcclean {} \; >&2
#	$(SILENT) find hash -name \*.xml -exec ./srcclean {} \; >&2
#	$(SILENT) find plugins -name \*.lua -exec ./srcclean {} \; >&2
#	$(SILENT) find scripts -name \*.lua -exec ./srcclean {} \; >&2
#else
#	$(shell for /r src %%i in (*.c) do srcclean %%i >&2 )
#	$(shell for /r src %%i in (*.cpp) do srcclean %%i >&2 )
#	$(shell for /r src %%i in (*.h) do srcclean %%i >&2 )
#	$(shell for /r src %%i in (*.hpp) do srcclean %%i >&2 )
#	$(shell for /r src %%i in (*.hxx) do srcclean %%i >&2 )
#	$(shell for /r src %%i in (*.ipp) do srcclean %%i >&2 )
#	$(shell for /r src %%i in (*.lay) do srcclean %%i >&2 )
#	$(shell for /r src %%i in (*.lst) do srcclean %%i >&2 )
#	$(shell for /r src %%i in (*.mak) do srcclean %%i >&2 )
#	$(shell for /r src %%i in (*.mm) do srcclean %%i >&2 )
#	$(shell for /r hash %%i in (*.hsi) do srcclean %%i >&2 )
#	$(shell for /r hash %%i in (*.xml) do srcclean %%i >&2 )
#	$(shell for /r plugins %%i in (*.lua) do srcclean %%i >&2 )
#	$(shell for /r scripts %%i in (*.lua) do srcclean %%i >&2 )
#endif
#
##-------------------------------------------------
## Doxygen documentation
##-------------------------------------------------
#
#.PHONY: doxygen
#
#doxygen:
#	@echo Generate Doxygen documentation
#	doxygen doxygen/doxygen.config
#
##-------------------------------------------------
## CppCheck analysis
##-------------------------------------------------
#
#.PHONY: cppcheck
#
#CPPCHECK_PARAMS  = -Isrc/osd
#CPPCHECK_PARAMS += -Isrc/emu
#CPPCHECK_PARAMS += -Isrc/lib
#CPPCHECK_PARAMS += -Isrc/lib/util
#CPPCHECK_PARAMS += -Isrc/mame
#CPPCHECK_PARAMS += -Isrc/osd/modules/render
#CPPCHECK_PARAMS += -Isrc/osd/windows
#CPPCHECK_PARAMS += -I3rdparty
#ifndef USE_SYSTEM_LIB_LUA
#CPPCHECK_PARAMS += -I3rdparty/lua/src
#endif
#ifndef USE_SYSTEM_LIB_ZLIB
#CPPCHECK_PARAMS += -I3rdparty/zlib
#endif
#CPPCHECK_PARAMS += -I3rdparty/bgfx/include
#CPPCHECK_PARAMS += -I3rdparty/bx/include
#CPPCHECK_PARAMS += -I$(BUILDDIR)/generated/emu
#CPPCHECK_PARAMS += -I$(BUILDDIR)/generated/emu/layout
#CPPCHECK_PARAMS += -I$(BUILDDIR)/generated/mame/layout
#CPPCHECK_PARAMS += -DX64_WINDOWS_ABI
#CPPCHECK_PARAMS += -DPTR64=1
#CPPCHECK_PARAMS += -DMAME_DEBUG
#CPPCHECK_PARAMS += -DMAME_PROFILER
#CPPCHECK_PARAMS += -DCRLF=3
#CPPCHECK_PARAMS += -DLSB_FIRST
#ifndef USE_SYSTEM_LIB_FLAC
#CPPCHECK_PARAMS += -DFLAC__NO_DLL
#endif
#CPPCHECK_PARAMS += -DNATIVE_DRC=drcbe_x64
#CPPCHECK_PARAMS += -DLUA_COMPAT_APIINTCASTS
#CPPCHECK_PARAMS += -DWIN32
#CPPCHECK_PARAMS += -D__GNUC__
#CPPCHECK_PARAMS += -D__x86_64__
#ifndef VERBOSE
#CPPCHECK_PARAMS += --quiet
#endif
#
#cppcheck:
#	@echo Generate CppCheck analysis report
#	cppcheck --enable=all src/ $(CPPCHECK_PARAMS) -j9
#
##-------------------------------------------------
## BGFX shaders
##
## to build all just use : make shaders
##
## to build specific chain use for example : make shaders CHAIN=eagle
## data for chain is taken from src/osd/modules/render/bgfx/shaders/chains/
## subfolder named in CHAIN
## NOTE: shaders can be only built on Windows for now
## due to restrictions of way how hlsl shaders are compiled
##-------------------------------------------------
#
#.PHONY: shaders bgfx-tools
#
#bgfx-tools:
#	$(SILENT) $(MAKE) -C 3rdparty/bgfx -f makefile shaderc CC="$(CC)" CXX="$(CXX)" MINGW="$(MINGW)" SILENT="$(SILENT)"
#
#shaders: bgfx-tools
#	-$(call MKDIR,build/shaders/dx11)
#	-$(call MKDIR,build/shaders/dx9)
#	-$(call MKDIR,build/shaders/pssl)
#	-$(call MKDIR,build/shaders/metal)
#	-$(call MKDIR,build/shaders/essl)
#	-$(call MKDIR,build/shaders/glsl)
#	-$(call MKDIR,build/shaders/spirv)
#	$(SILENT) $(MAKE) -C $(SRC)/osd/modules/render/bgfx/shaders rebuild CHAIN="$(CHAIN)" SILENT="$(SILENT)"
#
##-------------------------------------------------
## Translation
##-------------------------------------------------
#
#.PHONY: translation
#
#$(GENDIR)/mame.pot: FORCE
#	$(SILENT) echo Generating mame.pot
#	$(SILENT) find src -iname "*.cpp" -print0 | xargs -0 xgettext --from-code=UTF-8 -k_ -k__ -o $@
#	$(SILENT) find plugins -iname "*.lua" -print0 | xargs -0 xgettext --from-code=UTF-8 -k_ -k__ -j -o $@
#
#translation: $(GENDIR)/mame.pot
#	$(SILENT) find language -name "*.po" -print0 | xargs -0 -n 1 -I %% msgmerge -U -N %% $<
#	$(SILENT) find language -name "*.po" -print0 | xargs -0 -n 1 -I %% msgattrib --clear-fuzzy --empty %% -o %%
