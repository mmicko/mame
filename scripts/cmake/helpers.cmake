if(MSVC)
	set_property(GLOBAL PROPERTY USE_FOLDERS ON)
endif()

function(add_project_to_group folder target)
	if(MSVC)
		set(SOURCE_GROUP_DELIMITER "/")
		set(last_dir "")
		set(files "")

		get_target_property(sources ${target} SOURCES)

		foreach(file ${sources})
			file(RELATIVE_PATH relative_file "${PROJECT_SOURCE_DIR}" ${file})
			get_filename_component(dir "${relative_file}" PATH)
			if(NOT "${dir}" STREQUAL "${last_dir}")
				if(files)
					source_group("${last_dir}" FILES ${files})
				endif()
				set(files "")
			endif()
			set(files ${files} ${file})
			set(last_dir "${dir}")
		endforeach()

		if(files)
			source_group("${last_dir}" FILES ${files})
		endif()
		set_target_properties(${target} PROPERTIES FOLDER ${folder})
	endif()
endfunction()

function(add_project_to_group_and_include folder target include_file)
	include(${include_file})
	add_project_to_group(${folder} ${target})
endfunction()

function(generate_has_header var)
	string(TOLOWER ${var} name)
	set(fname ${GEN_DIR}/has_${name}.h)

	set(GENERATED_HEADER "")
	string(APPEND GENERATED_HEADER "// Generated file, edition is futile\n")
	string(APPEND GENERATED_HEADER "\n")
	string(APPEND GENERATED_HEADER "#ifndef GENERATED_HAS_" ${var} "_H\n")
	string(APPEND GENERATED_HEADER "#define GENERATED_HAS_" ${var} "_H\n")
	string(APPEND GENERATED_HEADER "\n")
	foreach(item IN ITEMS ${${var}})
		string(APPEND GENERATED_HEADER "#define HAS_" ${var} "_" ${item} "\n")
	endforeach()
	string(APPEND GENERATED_HEADER "\n")
	string(APPEND GENERATED_HEADER "#endif\n")

	if(EXISTS ${fname})
		file(READ ${fname} GENERATED_HEADER_CURRENT)
	else()
		set(GENERATED_HEADER_CURRENT "")
	endif()

	if (NOT "${GENERATED_HEADER}" STREQUAL "${GENERATED_HEADER_CURRENT}")
		file(WRITE ${fname} "${GENERATED_HEADER}")
	endif()
endfunction()

function(layoutbuildtask _folder _name)
    add_custom_command(
		COMMAND ${CMAKE_COMMAND} -E make_directory ${GEN_DIR}/${_folder}
		COMMAND ${PYTHON_EXECUTABLE} ${MAME_DIR}/scripts/build/complay.py ${MAME_DIR}/src/${_folder}/${_name}.lay ${GEN_DIR}/${_folder}/${_name}.lh layout_${_name}
		DEPENDS ${MAME_DIR}/scripts/build/complay.py ${MAME_DIR}/src/${_folder}/${_name}.lay
		OUTPUT ${GEN_DIR}/${_folder}/${_name}.lh 
		COMMENT "Compressing src/${_folder}/${_name}.lay..."
	)
endfunction()

function(translationbuildtask _language)
    add_custom_command(
		COMMAND ${PYTHON_EXECUTABLE} ${MAME_DIR}/scripts/build/msgfmt.py --output-file ${MAME_DIR}/language/${_language}/strings.mo ${MAME_DIR}/language/${_language}/strings.po
		DEPENDS ${MAME_DIR}/scripts/build/msgfmt.py ${MAME_DIR}/language/${_language}/strings.po
		OUTPUT ${MAME_DIR}/language/${_language}/strings.mo
		COMMENT "Converting translation language/${_language}/strings.po..."
	)
endfunction()

macro(addprojectflags _project)
	if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
		target_compile_options(${_project} PRIVATE -Wsuggest-override)
		target_compile_options(${_project} PRIVATE -flifetime-dse=1)
	endif()
endmacro()

function(dump_mame_options)
    get_cmake_property(_variableNames VARIABLES)
    list (SORT _variableNames)
	message(STATUS "Compile parameters:")
	message(STATUS "===========================================================")
	if(CMAKE_SIZEOF_VOID_P EQUAL 8)
	message(STATUS "OS                  : ${CMAKE_SYSTEM_NAME} (64 bit)")
	elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
	message(STATUS "OS                  : ${CMAKE_SYSTEM_NAME} (32 bit)")
	endif()
	message(STATUS "Platform            : ${CMAKE_SYSTEM_PROCESSOR}")
	message(STATUS "Compiler type       : ${CMAKE_CXX_COMPILER_ID}")
	message(STATUS "C Compiler          : ${CMAKE_C_COMPILER}")
	message(STATUS "C++ Compiler        : ${CMAKE_CXX_COMPILER}")
	message(STATUS "Build configuration : ${CMAKE_BUILD_TYPE}")
	message(STATUS "Generator           : ${CMAKE_GENERATOR}")
	message(STATUS "===========================================================")
	message(STATUS "Target              : ${TARGET}")
	message(STATUS "Subtarget           : ${SUBTARGET}")
	message(STATUS "OSD                 : ${OSD}")
	message(STATUS "===========================================================")	
	if(NOT SOURCES STREQUAL "")
		string(REPLACE "," ";" SOURCES_LIST ${SOURCES})
		set(_is_first true)
		foreach(_source ${SOURCES_LIST})
			if(${_is_first})
				message(STATUS "Sources to build    : ${_source}")
			else()
				message(STATUS "                      ${_source}")
			endif()
			set(_is_first false)
		endforeach()
	message(STATUS "===========================================================")
	endif()
    foreach (_variableName ${_variableNames})
        get_property(result CACHE ${_variableName} PROPERTY TYPE)
        string(FIND "${_variableName}" "CMAKE_" out)
        if(NOT("${out}" EQUAL 0))
          if((${result} MATCHES "BOOL") OR (${result} MATCHES "STRING"))
            message(STATUS "${_variableName}=${${_variableName}}")
          endif()
        endif()
    endforeach()
    message(STATUS "===========================================================")
endfunction()

macro(set_option option value)
  set(${option} ${value} CACHE BOOL INTERNAL FORCE)
endmacro()

macro(subdir_list _result _curdir)
  file(GLOB children RELATIVE ${_curdir} ${_curdir}/*)
  set(dirlist "")
  foreach(child ${children})
    if(IS_DIRECTORY ${_curdir}/${child})
      list(APPEND dirlist ${child})
    endif()
	endforeach()
  set(${_result} ${dirlist})
endmacro()

macro(precompiledheaders _project)
	if(PRECOMPILE)
		if(${CMAKE_GENERATOR} MATCHES "Makefiles")
			# Precompile works fine with CMake but for Makefiles it also add comments in flags.make
			# this creates a problem since after adding new file to library using precompile header
			# all needs to be recompiled even if there is not need. For MAME this is no go.
			# Patch is here until it is resolved upstream
			set(PCH_EXTENSION "pch")
			if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
				set(PCH_EXTENSION "gch")
			endif()
			add_dependencies(${_project} precompile)
			target_compile_options(${_project} PRIVATE -include ${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/precompile.dir/cmake_pch.hxx)
			get_target_property(MY_PROJECT_SOURCES ${_project} SOURCES)
			set_source_files_properties(${MY_PROJECT_SOURCES} PROPERTIES OBJECT_DEPENDS "${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/precompile.dir/cmake_pch.hxx;${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/precompile.dir/cmake_pch.hxx.${PCH_EXTENSION}")
		else()
			target_precompile_headers(${_project} REUSE_FROM precompile)
		endif()
	endif()
endmacro()

macro(precompiledheaders_novs _project)
	if(NOT MSVC)
		precompiledheaders(${_project})
	endif()
endmacro()