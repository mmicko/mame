# license:BSD-3-Clause
# copyright-holders:MAMEdev Team

##########################################################################
## aueffectutil
##########################################################################

add_executable(aueffectutil)

#linkoptions {
#    "-sectcreate __TEXT __info_plist " .. _MAKE.esc(MAME_DIR) .. "src/tools/aueffectutil-Info.plist",
#}
#
#dependency {
#    { "aueffectutil",  MAME_DIR .. "src/tools/aueffectutil-Info.plist", true  },
#}


target_link_libraries(aueffectutil PRIVATE 
    "-framework AudioUnit"
    "-framework AudioToolbox"
    "-framework CoreAudio"
    "-framework CoreAudioKit"
    "-framework CoreServices"
)

target_sources(aueffectutil PRIVATE
	${MAME_DIR}/src/tools/aueffectutil.mm
)
