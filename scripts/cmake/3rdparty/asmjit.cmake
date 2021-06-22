set(ASMJIT_SRCS
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/asmjit.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/api-build_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/api-config.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/arch.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/arch.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/assembler.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/assembler.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/builder.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/builder.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/callconv.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/callconv.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/codebuffer.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/codebufferwriter_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/codeholder.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/codeholder.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/compiler.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/compiler.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/constpool.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/constpool.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/cpuinfo.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/cpuinfo.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/datatypes.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/emitter.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/emitter.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/emitterutils.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/emitterutils_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/environment.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/environment.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/errorhandler.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/errorhandler.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/features.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/formatter.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/formatter.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/func.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/func.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/globals.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/globals.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/inst.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/inst.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/jitallocator.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/jitallocator.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/jitruntime.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/jitruntime.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/logger.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/logger.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/misc_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/operand.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/operand.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/osutils.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/osutils.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/osutils_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/raassignment_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/rabuilders_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/radefs_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/ralocal.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/ralocal_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/rapass.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/rapass_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/rastack.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/rastack_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/string.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/string.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/support.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/support.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/target.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/target.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/type.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/type.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/virtmem.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/virtmem.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/zone.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/zone.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/zonehash.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/zonehash.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/zonelist.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/zonelist.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/zonestack.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/zonestack.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/zonestring.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/zonetree.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/zonetree.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/zonevector.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/core/zonevector.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86archdata.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86archdata_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86assembler.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86assembler.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86builder.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86builder.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86callconv.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86callconv_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86compiler.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86compiler.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86emitter.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86features.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86features.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86formatter.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86formatter_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86globals.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86instapi.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86instapi_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86instdb.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86instdb.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86instdb_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86internal.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86internal_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86opcode_p.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86operand.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86operand.h
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86rapass.cpp
	${MAME_DIR}/3rdparty/asmjit/src/asmjit/x86/x86rapass_p.h
)

add_library(asmjit ${LIBTYPE} ${ASMJIT_SRCS})

if((CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang") AND (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 8))
	target_compile_definitions(asmjit PRIVATE TARGET_OS_OSX=1)
endif()