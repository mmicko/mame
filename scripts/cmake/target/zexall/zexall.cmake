set(STANDALONE true)

list(APPEND CPUS Z80)

list(APPEND MACHINES Z80DAISY)

macro(standalone _projectname)
    set(MAINPROJECT_SRCS 
		${MAME_DIR}/src/zexall/main.cpp
		${MAME_DIR}/src/zexall/zexall.cpp
		${MAME_DIR}/src/zexall/zexall.h
		${MAME_DIR}/src/zexall/interface.h
    )
    add_executable(${_projectname} ${MAINPROJECT_SRCS})
endmacro()
