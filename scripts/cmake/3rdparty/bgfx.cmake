set(BGFX_SRCS
	${MAME_DIR}/3rdparty/bgfx/src/bgfx.cpp
	${MAME_DIR}/3rdparty/bgfx/src/debug_renderdoc.cpp
	${MAME_DIR}/3rdparty/bgfx/src/dxgi.cpp
	${MAME_DIR}/3rdparty/bgfx/src/glcontext_egl.cpp
	${MAME_DIR}/3rdparty/bgfx/src/glcontext_glx.cpp
	${MAME_DIR}/3rdparty/bgfx/src/glcontext_html5.cpp
	${MAME_DIR}/3rdparty/bgfx/src/glcontext_wgl.cpp
	${MAME_DIR}/3rdparty/bgfx/src/nvapi.cpp
	${MAME_DIR}/3rdparty/bgfx/src/renderer_d3d11.cpp
	${MAME_DIR}/3rdparty/bgfx/src/renderer_d3d12.cpp
	${MAME_DIR}/3rdparty/bgfx/src/renderer_d3d9.cpp
	${MAME_DIR}/3rdparty/bgfx/src/renderer_gl.cpp
	${MAME_DIR}/3rdparty/bgfx/src/renderer_gnm.cpp
	${MAME_DIR}/3rdparty/bgfx/src/renderer_noop.cpp
	${MAME_DIR}/3rdparty/bgfx/src/renderer_nvn.cpp
	${MAME_DIR}/3rdparty/bgfx/src/renderer_vk.cpp
	${MAME_DIR}/3rdparty/bgfx/src/shader.cpp
	${MAME_DIR}/3rdparty/bgfx/src/shader_dx9bc.cpp
	${MAME_DIR}/3rdparty/bgfx/src/shader_dxbc.cpp
	${MAME_DIR}/3rdparty/bgfx/src/shader_spirv.cpp
	${MAME_DIR}/3rdparty/bgfx/src/topology.cpp
	${MAME_DIR}/3rdparty/bgfx/src/vertexdecl.cpp
	${MAME_DIR}/3rdparty/bgfx/examples/common/imgui/imgui.cpp
	${MAME_DIR}/3rdparty/bgfx/examples/common/nanovg/nanovg.cpp
	${MAME_DIR}/3rdparty/bgfx/examples/common/nanovg/nanovg_bgfx.cpp
	${MAME_DIR}/3rdparty/bgfx/3rdparty/dear-imgui/imgui.cpp
	${MAME_DIR}/3rdparty/bgfx/3rdparty/dear-imgui/imgui_draw.cpp
	${MAME_DIR}/3rdparty/bgfx/3rdparty/dear-imgui/imgui_widgets.cpp
)

if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
	set(BGFX_MACOSX_SRCS
		${MAME_DIR}/3rdparty/bgfx/src/glcontext_eagl.mm
		${MAME_DIR}/3rdparty/bgfx/src/glcontext_nsgl.mm
		${MAME_DIR}/3rdparty/bgfx/src/renderer_mtl.mm
	)
endif()

add_library(bgfx ${LIBTYPE} ${BGFX_SRCS} ${BGFX_MACOSX_SRCS})

target_link_libraries(bgfx PRIVATE bx bimg)

target_compile_definitions(bgfx PRIVATE
	BGFX_CONFIG_MAX_FRAME_BUFFERS=128
	IMGUI_DISABLE_OBSOLETE_FUNCTIONS
)

target_include_directories(bgfx 
	PUBLIC
		${MAME_DIR}/3rdparty/bgfx/include	
	PRIVATE
		${MAME_DIR}/3rdparty/bgfx/3rdparty
		${MAME_DIR}/3rdparty/bgfx/3rdparty/khronos
		${MAME_DIR}/3rdparty/bgfx/3rdparty/dxsdk/include
)

if((CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang") AND (CMAKE_CXX_COMPILER_VERSION VERSION_LESS 8))
	target_compile_definitions(bgfx PRIVATE TARGET_OS_OSX=1)
endif()

if(CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang")
	target_compile_definitions(bgfx PRIVATE BGFX_CONFIG_MULTITHREADED=0)
	target_compile_options(bgfx PRIVATE -x objective-c++)
	target_compile_options(bgfx PRIVATE -Wno-unused-variable)
endif()
