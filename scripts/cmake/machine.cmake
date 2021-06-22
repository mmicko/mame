## license:BSD-3-Clause
## copyright-holders:MAMEdev Team

###########################################################################
##
##   machine.lua
##
##   Rules for building machine cores
##
############################################################################

set(MACHINE_SRCS
	${MAME_DIR}/src/devices/machine/bcreader.cpp
	${MAME_DIR}/src/devices/machine/bcreader.h
	${MAME_DIR}/src/devices/machine/buffer.cpp
	${MAME_DIR}/src/devices/machine/buffer.h
	${MAME_DIR}/src/devices/machine/clock.cpp
	${MAME_DIR}/src/devices/machine/clock.h
	${MAME_DIR}/src/devices/machine/keyboard.cpp
	${MAME_DIR}/src/devices/machine/keyboard.h
	${MAME_DIR}/src/devices/machine/keyboard.ipp
	${MAME_DIR}/src/devices/machine/laserdsc.cpp
	${MAME_DIR}/src/devices/machine/laserdsc.h
	${MAME_DIR}/src/devices/machine/nvram.cpp
	${MAME_DIR}/src/devices/machine/nvram.h
	${MAME_DIR}/src/devices/machine/ram.cpp
	${MAME_DIR}/src/devices/machine/ram.h
	${MAME_DIR}/src/devices/machine/legscsi.cpp
	${MAME_DIR}/src/devices/machine/legscsi.h
	${MAME_DIR}/src/devices/machine/sdlc.cpp
	${MAME_DIR}/src/devices/machine/sdlc.h
	${MAME_DIR}/src/devices/machine/terminal.cpp
	${MAME_DIR}/src/devices/machine/terminal.h
	${MAME_DIR}/src/devices/machine/timer.cpp
	${MAME_DIR}/src/devices/machine/timer.h

	${MAME_DIR}/src/devices/imagedev/bitbngr.cpp
	${MAME_DIR}/src/devices/imagedev/bitbngr.h
	${MAME_DIR}/src/devices/imagedev/cassette.cpp
	${MAME_DIR}/src/devices/imagedev/cassette.h
	${MAME_DIR}/src/devices/imagedev/chd_cd.cpp
	${MAME_DIR}/src/devices/imagedev/chd_cd.h
	${MAME_DIR}/src/devices/imagedev/diablo.cpp
	${MAME_DIR}/src/devices/imagedev/diablo.h
	${MAME_DIR}/src/devices/imagedev/flopdrv.cpp
	${MAME_DIR}/src/devices/imagedev/flopdrv.h
	${MAME_DIR}/src/devices/imagedev/floppy.cpp
	${MAME_DIR}/src/devices/imagedev/floppy.h
	${MAME_DIR}/src/devices/imagedev/harddriv.cpp
	${MAME_DIR}/src/devices/imagedev/harddriv.h
	${MAME_DIR}/src/devices/imagedev/mfmhd.cpp
	${MAME_DIR}/src/devices/imagedev/mfmhd.h
	${MAME_DIR}/src/devices/imagedev/microdrv.cpp
	${MAME_DIR}/src/devices/imagedev/microdrv.h
	${MAME_DIR}/src/devices/imagedev/midiin.cpp
	${MAME_DIR}/src/devices/imagedev/midiin.h
	${MAME_DIR}/src/devices/imagedev/midiout.cpp
	${MAME_DIR}/src/devices/imagedev/midiout.h
	${MAME_DIR}/src/devices/imagedev/picture.cpp
	${MAME_DIR}/src/devices/imagedev/picture.h
	${MAME_DIR}/src/devices/imagedev/printer.cpp
	${MAME_DIR}/src/devices/imagedev/printer.h
	${MAME_DIR}/src/devices/imagedev/snapquik.cpp
	${MAME_DIR}/src/devices/imagedev/snapquik.h
	${MAME_DIR}/src/devices/imagedev/wafadrive.cpp
	${MAME_DIR}/src/devices/imagedev/wafadrive.h
	${MAME_DIR}/src/devices/imagedev/avivideo.cpp
	${MAME_DIR}/src/devices/imagedev/avivideo.h
)


##################################################
##
##@src/devices/machine/acorn_ioc.h,MACHINES["ACORN_IOC"] = true
##################################################

if("ACORN_IOC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/acorn_ioc.cpp
		${MAME_DIR}/src/devices/machine/acorn_ioc.h
	)
endif()

##################################################
##
##@src/devices/machine/acorn_memc.h,MACHINES["ACORN_MEMC"] = true
##################################################

if("ACORN_MEMC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/acorn_memc.cpp
		${MAME_DIR}/src/devices/machine/acorn_memc.h
	)
endif()

##################################################
##
##@src/devices/machine/acorn_vidc.h,MACHINES["ACORN_VIDC"] = true
##################################################

if("ACORN_VIDC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/acorn_vidc.cpp
		${MAME_DIR}/src/devices/machine/acorn_vidc.h
	)
endif()

###################################################
##
##@src/devices/machine/akiko.h,MACHINES["AKIKO"] = true
###################################################

if("AKIKO" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/akiko.cpp
		${MAME_DIR}/src/devices/machine/akiko.h
	)
endif()

###################################################
##
##@src/devices/machine/am2901b.h,MACHINES["AM2901B"] = true
###################################################

if("AM2901B" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/am2901b.cpp
		${MAME_DIR}/src/devices/machine/am2901b.h
	)
endif()

##################################################
##
##@src/devices/machine/arm_iomd.h,MACHINES["ARM_IOMD"] = true
##################################################

if("ARM_IOMD" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/arm_iomd.cpp
		${MAME_DIR}/src/devices/machine/arm_iomd.h
	)
endif()

###################################################
##
##@src/devices/machine/autoconfig.h,MACHINES["AUTOCONFIG"] = true
###################################################

if("AUTOCONFIG" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/autoconfig.cpp
		${MAME_DIR}/src/devices/machine/autoconfig.h
	)
endif()


###################################################
##
##@src/devices/machine/cop452.h,MACHINES["COP452"] = true
###################################################

if("COP452" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/cop452.cpp
		${MAME_DIR}/src/devices/machine/cop452.h
	)
endif()


###################################################
##
##@src/devices/machine/cr511b.h,MACHINES["CR511B"] = true
###################################################

if("CR511B" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/cr511b.cpp
		${MAME_DIR}/src/devices/machine/cr511b.h
	)
endif()


###################################################
##
##@src/devices/machine/dmac.h,MACHINES["DMAC"] = true
###################################################

if("DMAC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/dmac.cpp
		${MAME_DIR}/src/devices/machine/dmac.h
	)
endif()


###################################################
##
##@src/devices/machine/gayle.h,MACHINES["GAYLE"] = true
###################################################

if("GAYLE" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/gayle.cpp
		${MAME_DIR}/src/devices/machine/gayle.h
	)
endif()


###################################################
##
##@src/devices/machine/40105.h,MACHINES["CMOS40105"] = true
###################################################

if("CMOS40105" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/40105.cpp
		${MAME_DIR}/src/devices/machine/40105.h
	)
endif()


###################################################
##
##@src/devices/machine/53c7xx.h,MACHINES["NCR53C7XX"] = true
###################################################

if("NCR53C7XX" IN_LIST MACHINES)
	list(APPEND MACHINES "NSCSI")
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/53c7xx.cpp
		${MAME_DIR}/src/devices/machine/53c7xx.h
	)
endif()

###################################################
##
##@src/devices/machine/ncr5385.h,MACHINES["NCR5385"] = true
###################################################

if("NCR5385" IN_LIST MACHINES)
	list(APPEND MACHINES "NSCSI")
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ncr5385.cpp
		${MAME_DIR}/src/devices/machine/ncr5385.h
	)
endif()

###################################################
##
##@src/devices/machine/53c810.h,MACHINES["LSI53C810"] = true
###################################################

if("LSI53C810" IN_LIST MACHINES)
	list(APPEND MACHINES "SCSI")
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/53c810.cpp
		${MAME_DIR}/src/devices/machine/53c810.h
	)
endif()

###################################################
##
##@src/devices/machine/2812fifo.h,MACHINES["2812FIFO"] = true
###################################################

if("2812FIFO" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/2812fifo.cpp
		${MAME_DIR}/src/devices/machine/2812fifo.h
	)
endif()

###################################################
##
##@src/devices/machine/6522via.h,MACHINES["6522VIA"] = true
###################################################

if("6522VIA" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/6522via.cpp
		${MAME_DIR}/src/devices/machine/6522via.h
	)
endif()

###################################################
##
##@src/devices/machine/6525tpi.h,MACHINES["TPI6525"] = true
###################################################

if("TPI6525" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/6525tpi.cpp
		${MAME_DIR}/src/devices/machine/6525tpi.h
	)
endif()

###################################################
##
##@src/devices/machine/6532riot.h,MACHINES["RIOT6532"] = true
###################################################

if("RIOT6532" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/6532riot.cpp
		${MAME_DIR}/src/devices/machine/6532riot.h
	)
endif()

###################################################
##
##@src/devices/machine/6821pia.h,MACHINES["6821PIA"] = true
###################################################

if("6821PIA" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/6821pia.cpp
		${MAME_DIR}/src/devices/machine/6821pia.h
	)
endif()

###################################################
##
##@src/devices/machine/6840ptm.h,MACHINES["6840PTM"] = true
###################################################

if("6840PTM" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/6840ptm.cpp
		${MAME_DIR}/src/devices/machine/6840ptm.h
	)
endif()

###################################################
##
##@src/devices/machine/6850acia.h,MACHINES["ACIA6850"] = true
###################################################

if("ACIA6850" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/6850acia.cpp
		${MAME_DIR}/src/devices/machine/6850acia.h
	)
endif()

###################################################
##
##@src/devices/machine/68153bim.h,MACHINES["BIM68153"] = true
###################################################

if("BIM68153" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/68153bim.cpp
		${MAME_DIR}/src/devices/machine/68153bim.h
	)
endif()

###################################################
##
##@src/devices/machine/68230pit.h,MACHINES["PIT68230"] = true
###################################################

if("PIT68230" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/68230pit.cpp
		${MAME_DIR}/src/devices/machine/68230pit.h
	)
endif()

###################################################
##
##@src/devices/machine/68561mpcc.h,MACHINES["MPCC68561"] = true
###################################################

if("MPCC68561" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/68561mpcc.cpp
		${MAME_DIR}/src/devices/machine/68561mpcc.h
	)
endif()

###################################################
##
##@src/devices/machine/mc68681.h,MACHINES["68681"] = true
###################################################

if("68681" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mc68681.cpp
		${MAME_DIR}/src/devices/machine/mc68681.h
	)
endif()

###################################################
##
##@src/devices/machine/7200fifo.h,MACHINES["7200FIFO"] = true
###################################################

if("7200FIFO" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/7200fifo.cpp
		${MAME_DIR}/src/devices/machine/7200fifo.h
	)
endif()

###################################################
##
##@src/devices/machine/7400.h,MACHINES["TTL7400"] = true
###################################################

if("TTL7400" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/7400.cpp
		${MAME_DIR}/src/devices/machine/7400.h
	)
endif()

###################################################
##
##@src/devices/machine/7404.h,MACHINES["TTL7404"] = true
###################################################

if("TTL7404" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/7404.cpp
		${MAME_DIR}/src/devices/machine/7404.h
	)
endif()

###################################################
##
##@src/devices/machine/74123.h,MACHINES["TTL74123"] = true
###################################################

if("TTL74123" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/74123.cpp
		${MAME_DIR}/src/devices/machine/74123.h
		${MAME_DIR}/src/devices/machine/rescap.h
	)
endif()

###################################################
##
##@src/devices/machine/74145.h,MACHINES["TTL74145"] = true
###################################################

if("TTL74145" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/74145.cpp
		${MAME_DIR}/src/devices/machine/74145.h
	)
endif()

###################################################
##
##@src/devices/machine/74148.h,MACHINES["TTL74148"] = true
###################################################

if("TTL74148" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/74148.cpp
		${MAME_DIR}/src/devices/machine/74148.h
	)
endif()

###################################################
##
##@src/devices/machine/74153.h,MACHINES["TTL74153"] = true
###################################################

if("TTL74153" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/74153.cpp
		${MAME_DIR}/src/devices/machine/74153.h
	)
endif()

###################################################
##
##@src/devices/machine/74157.h,MACHINES["TTL74157"] = true
###################################################

if("TTL74157" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/74157.cpp
		${MAME_DIR}/src/devices/machine/74157.h
	)
endif()

###################################################
##
##@src/devices/machine/74161.h,MACHINES["TTL74161"] = true
###################################################

if("TTL74161" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/74161.cpp
		${MAME_DIR}/src/devices/machine/74161.h
	)
endif()

###################################################
##
##@src/devices/machine/74165.h,MACHINES["TTL74165"] = true
###################################################

if("TTL74165" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/74165.cpp
		${MAME_DIR}/src/devices/machine/74165.h
	)
endif()

###################################################
##
##@src/devices/machine/74166.h,MACHINES["TTL74166"] = true
###################################################

if("TTL74166" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/74166.cpp
		${MAME_DIR}/src/devices/machine/74166.h
	)
endif()

###################################################
##
##@src/devices/machine/74175.h,MACHINES["TTL74175"] = true
###################################################

if("TTL74175" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/74175.cpp
		${MAME_DIR}/src/devices/machine/74175.h
	)
endif()

###################################################
##
##@src/devices/machine/74181.h,MACHINES["TTL74181"] = true
###################################################

if("TTL74181" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/74181.cpp
		${MAME_DIR}/src/devices/machine/74181.h
	)
endif()

###################################################
##
##@src/devices/machine/74259.h,MACHINES["TTL74259"] = true
###################################################

if("TTL74259" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/74259.cpp
		${MAME_DIR}/src/devices/machine/74259.h
	)
endif()

###################################################
##
##@src/devices/machine/74381.h,MACHINES["TTL74381"] = true
###################################################

if("TTL74381" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/74381.cpp
		${MAME_DIR}/src/devices/machine/74381.h
	)
endif()

###################################################
##
##@src/devices/machine/74543.h,MACHINES["TTL74543"] = true
###################################################

if("TTL74543" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/74543.cpp
		${MAME_DIR}/src/devices/machine/74543.h
	)
endif()

###################################################
##
##@src/devices/machine/7474.h,MACHINES["TTL7474"] = true
###################################################

if("TTL7474" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/7474.cpp
		${MAME_DIR}/src/devices/machine/7474.h
	)
endif()

###################################################
##
##@src/devices/machine/82s129.h,MACHINES["PROM82S129"] = true
###################################################

if("PROM82S129" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/82s129.cpp
		${MAME_DIR}/src/devices/machine/82s129.h
	)
endif()

###################################################
##
##@src/devices/machine/8042kbdc.h,MACHINES["KBDC8042"] = true
###################################################

if("KBDC8042" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/8042kbdc.cpp
		${MAME_DIR}/src/devices/machine/8042kbdc.h
	)
endif()

###################################################
##
##@src/devices/machine/8530scc.h,MACHINES["8530SCC"] = true
###################################################

if("8530SCC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/8530scc.cpp
		${MAME_DIR}/src/devices/machine/8530scc.h
	)
endif()

###################################################
##
##@src/devices/machine/adc0804.h,MACHINES["ADC0804"] = true
###################################################

if("ADC0804" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/adc0804.cpp
		${MAME_DIR}/src/devices/machine/adc0804.h
	)
endif()

###################################################
##
##@src/devices/machine/adc0808.h,MACHINES["ADC0808"] = true
###################################################

if("ADC0808" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/adc0808.cpp
		${MAME_DIR}/src/devices/machine/adc0808.h
	)
endif()

###################################################
##
##@src/devices/machine/adc083x.h,MACHINES["ADC083X"] = true
###################################################

if("ADC083X" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/adc083x.cpp
		${MAME_DIR}/src/devices/machine/adc083x.h
	)
endif()

###################################################
##
##@src/devices/machine/adc1038.h,MACHINES["ADC1038"] = true
###################################################

if("ADC1038" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/adc1038.cpp
		${MAME_DIR}/src/devices/machine/adc1038.h
	)
endif()

###################################################
##
##@src/devices/machine/adc1213x.h,MACHINES["ADC1213X"] = true
###################################################

if("ADC1213X" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/adc1213x.cpp
		${MAME_DIR}/src/devices/machine/adc1213x.h
	)
endif()

###################################################
##
##@src/devices/machine/aicartc.h,MACHINES["AICARTC"] = true
###################################################

if("AICARTC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/aicartc.cpp
		${MAME_DIR}/src/devices/machine/aicartc.h
	)
endif()

###################################################
##
##@src/devices/machine/am25s55x.h,MACHINES["AM25S55X"] = true
###################################################

if("AM25S55X" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/am25s55x.cpp
		${MAME_DIR}/src/devices/machine/am25s55x.h
	)
endif()

###################################################
##
##@src/devices/machine/am2847.h,MACHINES["AM2847"] = true
###################################################

if("AM2847" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/am2847.cpp
		${MAME_DIR}/src/devices/machine/am2847.h
	)
endif()

###################################################
##
##@src/devices/machine/am2910.h,MACHINES["AM2910"] = true
###################################################

if("AM2910" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/am2910.cpp
		${MAME_DIR}/src/devices/machine/am2910.h
	)
endif()

###################################################
##
##@src/devices/machine/am53cf96.h,MACHINES["AM53CF96"] = true
###################################################

if("AM53CF96" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/am53cf96.cpp
		${MAME_DIR}/src/devices/machine/am53cf96.h
	)
endif()

###################################################
##
##@src/devices/machine/am79c30.h,MACHINES["AM79C30"] = true
###################################################

if("AM79C30" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/am79c30.cpp
		${MAME_DIR}/src/devices/machine/am79c30.h
	)
endif()

###################################################
##
##@src/devices/machine/am79c90.h,MACHINES["AM79C90"] = true
###################################################

if("AM79C90" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/am79c90.cpp
		${MAME_DIR}/src/devices/machine/am79c90.h
	)
endif()

###################################################
##
##@src/devices/machine/am9513.h,MACHINES["AM9513"] = true
###################################################

if("AM9513" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/am9513.cpp
		${MAME_DIR}/src/devices/machine/am9513.h
	)
endif()

###################################################
##
##@src/devices/machine/am9517a.h,MACHINES["AM9517A"] = true
###################################################

if("AM9517A" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/am9517a.cpp
		${MAME_DIR}/src/devices/machine/am9517a.h
	)
endif()

###################################################
##
##@src/devices/machine/am9519.h,MACHINES["AM9519"] = true
###################################################

if("AM9519" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/am9519.cpp
		${MAME_DIR}/src/devices/machine/am9519.h
	)
endif()

###################################################
##
##@src/devices/machine/amigafdc.h,MACHINES["AMIGAFDC"] = true
###################################################

if("AMIGAFDC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/amigafdc.cpp
		${MAME_DIR}/src/devices/machine/amigafdc.h
	)
endif()

###################################################
##
##@src/devices/machine/at28c16.h,MACHINES["AT28C16"] = true
###################################################

if("AT28C16" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/at28c16.cpp
		${MAME_DIR}/src/devices/machine/at28c16.h
	)
endif()

###################################################
##
##@src/devices/machine/at28c64b.h,MACHINES["AT28C64B"] = true
###################################################

if("AT28C64B" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/at28c64b.cpp
		${MAME_DIR}/src/devices/machine/at28c64b.h
	)
endif()

###################################################
##
##@src/devices/machine/at29x.h,MACHINES["AT29X"] = true
###################################################

if("AT29X" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/at29x.cpp
		${MAME_DIR}/src/devices/machine/at29x.h
	)
endif()

###################################################
##
##@src/devices/machine/at45dbxx.h,MACHINES["AT45DBXX"] = true
###################################################

if("AT45DBXX" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/at45dbxx.cpp
		${MAME_DIR}/src/devices/machine/at45dbxx.h
	)
endif()

###################################################
##
##@src/devices/machine/ataflash.h,MACHINES["ATAFLASH"] = true
###################################################

if("ATAFLASH" IN_LIST MACHINES)
	list(APPEND MACHINES "PCCARD")
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ataflash.cpp
		${MAME_DIR}/src/devices/machine/ataflash.h
	)
endif()

###################################################
##
##@src/devices/machine/atmel_arm_aic.h,MACHINES["ARM_AIC"] = true
###################################################

if("ARM_AIC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/atmel_arm_aic.cpp
		${MAME_DIR}/src/devices/machine/atmel_arm_aic.h
	)
endif()

###################################################
##
##@src/devices/machine/ay31015.h,MACHINES["AY31015"] = true
###################################################

if("AY31015" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ay31015.cpp
		${MAME_DIR}/src/devices/machine/ay31015.h
	)
endif()

###################################################
##
##@src/devices/machine/bankdev.h,MACHINES["BANKDEV"] = true
###################################################

if("BANKDEV" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/bankdev.cpp
		${MAME_DIR}/src/devices/machine/bankdev.h
	)
endif()

###################################################
##
##@src/devices/machine/bq4847.h,MACHINES["BQ4847"] = true
###################################################

if("BQ4847" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/bq4847.cpp
		${MAME_DIR}/src/devices/machine/bq4847.h
	)
endif()

###################################################
##
##@src/devices/machine/bq48x2.h,MACHINES["BQ4852"] = true
###################################################

if("BQ4852" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/bq48x2.cpp
		${MAME_DIR}/src/devices/machine/bq48x2.h
	)
endif()

###################################################
##
##@src/devices/machine/busmouse.h,MACHINES["BUSMOUSE"] = true
###################################################

if("BUSMOUSE" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/busmouse.cpp
		${MAME_DIR}/src/devices/machine/busmouse.h
	)
endif()

###################################################
##
##@src/devices/machine/cdp1852.h,MACHINES["CDP1852"] = true
###################################################

if("CDP1852" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/cdp1852.cpp
		${MAME_DIR}/src/devices/machine/cdp1852.h
	)
endif()

###################################################
##
##@src/devices/machine/cdp1871.h,MACHINES["CDP1871"] = true
###################################################

if("CDP1871" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/cdp1871.cpp
		${MAME_DIR}/src/devices/machine/cdp1871.h
	)
endif()

###################################################
##
##@src/devices/machine/cdp1879.h,MACHINES["CDP1879"] = true
###################################################

if("CDP1879" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/cdp1879.cpp
		${MAME_DIR}/src/devices/machine/cdp1879.h
	)
endif()


###################################################
##
##@src/devices/machine/ch376.h,MACHINES["CH376"] = true
###################################################

if("CH376" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ch376.cpp
		${MAME_DIR}/src/devices/machine/ch376.h
	)
endif()


###################################################
##
##@src/devices/machine/chessmachine.h,MACHINES["CHESSMACHINE"] = true
###################################################

if("CHESSMACHINE" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/chessmachine.cpp
		${MAME_DIR}/src/devices/machine/chessmachine.h
	)
endif()


###################################################
##
##@src/devices/machine/com52c50.h,MACHINES["COM52C50"] = true
###################################################

if("COM52C50" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/com52c50.cpp
		${MAME_DIR}/src/devices/machine/com52c50.h
	)
endif()

###################################################
##
##@src/devices/machine/com8116.h,MACHINES["COM8116"] = true
###################################################

if("COM8116" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/com8116.cpp
		${MAME_DIR}/src/devices/machine/com8116.h
	)
endif()

###################################################
##
##@src/devices/machine/cs4031.h,MACHINES["CS4031"] = true
###################################################

if("CS4031" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/cs4031.cpp
		${MAME_DIR}/src/devices/machine/cs4031.h
	)
endif()

###################################################
##
##@src/devices/machine/cs8221.h,MACHINES["CS8221"] = true
###################################################

if("CS8221" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/cs8221.cpp
		${MAME_DIR}/src/devices/machine/cs8221.h
	)
endif()

###################################################
##
##@src/devices/machine/cs8900a.h,MACHINES["CS8900A"] = true
###################################################

if("CS8900A" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/cs8900a.cpp
		${MAME_DIR}/src/devices/machine/cs8900a.h
	)
endif()


###################################################
##
##@src/devices/machine/cxd1095.h,MACHINES["CXD1095"] = true
###################################################

if("CXD1095" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/cxd1095.cpp
		${MAME_DIR}/src/devices/machine/cxd1095.h
	)
endif()

##@src/devices/machine/ds1204.h,MACHINES["DS1204"] = true
###################################################

if("DS1204" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ds1204.cpp
		${MAME_DIR}/src/devices/machine/ds1204.h
	)
endif()

###################################################
##
##@src/devices/machine/ds1205.h,MACHINES["DS1205"] = true
###################################################

if("DS1205" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ds1205.cpp
		${MAME_DIR}/src/devices/machine/ds1205.h
	)
endif()

###################################################
##
##@src/devices/machine/ds1302.h,MACHINES["DS1302"] = true
###################################################

if("DS1302" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ds1302.cpp
		${MAME_DIR}/src/devices/machine/ds1302.h
	)
endif()

###################################################
##
##@src/devices/machine/ds1315.h,MACHINES["DS1315"] = true
###################################################

if("DS1315" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ds1315.cpp
		${MAME_DIR}/src/devices/machine/ds1315.h
	)
endif()

###################################################
##
##@src/devices/machine/ds1386.h,MACHINES["DS1386"] = true
###################################################

if("DS1386" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ds1386.cpp
		${MAME_DIR}/src/devices/machine/ds1386.h
	)
endif()

###################################################
##
##@src/devices/machine/ds17x85.h,MACHINES["DS17X85"] = true
###################################################

if("DS17X85" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ds17x85.cpp
		${MAME_DIR}/src/devices/machine/ds17x85.h
	)
endif()

###################################################
##
##@src/devices/machine/ds1994.h,MACHINES["DS1994"] = true
###################################################

if("DS1994" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ds1994.cpp
		${MAME_DIR}/src/devices/machine/ds1994.h
	)
endif()

###################################################
##
##@src/devices/machine/ds2401.h,MACHINES["DS2401"] = true
###################################################

if("DS2401" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ds2401.cpp
		${MAME_DIR}/src/devices/machine/ds2401.h
	)
endif()

###################################################
##
##@src/devices/machine/ds2404.h,MACHINES["DS2404"] = true
###################################################

if("DS2404" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ds2404.cpp
		${MAME_DIR}/src/devices/machine/ds2404.h
	)
endif()

###################################################
##
##@src/devices/machine/ds75160a.h,MACHINES["DS75160A"] = true
###################################################

if("DS75160A" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ds75160a.cpp
		${MAME_DIR}/src/devices/machine/ds75160a.h
	)
endif()

###################################################
##
##@src/devices/machine/ds75161a.h,MACHINES["DS75161A"] = true
###################################################

if("DS75161A" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ds75161a.cpp
		${MAME_DIR}/src/devices/machine/ds75161a.h
	)
endif()

###################################################
##
##@src/devices/machine/ds8874.h,MACHINES["DS8874"] = true
###################################################

if("DS8874" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ds8874.cpp
		${MAME_DIR}/src/devices/machine/ds8874.h
	)
endif()

###################################################
##
##@src/devices/machine/e0516.h,MACHINES["E0516"] = true
###################################################

if("E0516" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/e0516.cpp
		${MAME_DIR}/src/devices/machine/e0516.h
	)
endif()

###################################################
##
##@src/devices/machine/e05a03.h,MACHINES["E05A03"] = true
###################################################

if("E05A03" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/e05a03.cpp
		${MAME_DIR}/src/devices/machine/e05a03.h
	)
endif()

###################################################
##
##@src/devices/machine/e05a30.h,MACHINES["E05A30"] = true
###################################################

if("E05A30" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/e05a30.cpp
		${MAME_DIR}/src/devices/machine/e05a30.h
	)
endif()

###################################################
##
##@src/devices/machine/eeprom.h,MACHINES["EEPROMDEV"] = true
##@src/devices/machine/eepromser.h,MACHINES["EEPROMDEV"] = true
##@src/devices/machine/eeprompar.h,MACHINES["EEPROMDEV"] = true
###################################################

if("EEPROMDEV" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/eeprom.cpp
		${MAME_DIR}/src/devices/machine/eeprom.h
		${MAME_DIR}/src/devices/machine/eepromser.cpp
		${MAME_DIR}/src/devices/machine/eepromser.h
		${MAME_DIR}/src/devices/machine/eeprompar.cpp
		${MAME_DIR}/src/devices/machine/eeprompar.h
	)
endif()

###################################################
##
##@src/devices/machine/er1400.h,MACHINES["ER1400"] = true
###################################################

if("ER1400" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/er1400.cpp
		${MAME_DIR}/src/devices/machine/er1400.h
	)
endif()

###################################################
##
##@src/devices/machine/er2055.h,MACHINES["ER2055"] = true
###################################################

if("ER2055" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/er2055.cpp
		${MAME_DIR}/src/devices/machine/er2055.h
	)
endif()

###################################################
##
##@src/devices/machine/exorterm.h,MACHINES["EXORTERM"] = true
###################################################

if("EXORTERM" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/exorterm.cpp
		${MAME_DIR}/src/devices/machine/exorterm.h
		${GEN_DIR}/emu/layout/exorterm155.lh
	)

	layoutbuildtask("emu/layout" "exorterm155")
endif()

###################################################
##
##@src/devices/machine/f3853.h,MACHINES["F3853"] = true
###################################################

if("F3853" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/f3853.cpp
		${MAME_DIR}/src/devices/machine/f3853.h
	)
endif()

###################################################
##
##@src/devices/machine/f4702.h,MACHINES["F4702"] = true
###################################################

if("F4702" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/f4702.cpp
		${MAME_DIR}/src/devices/machine/f4702.h
	)
endif()

###################################################
##
##@src/devices/machine/fga002.h,MACHINES["FGA002"] = true
###################################################

if("FGA002" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/fga002.cpp
		${MAME_DIR}/src/devices/machine/fga002.h
	)
endif()

###################################################
##
##@src/devices/machine/hd63450.h,MACHINES["HD63450"] = true
###################################################

if("HD63450" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/hd63450.cpp
		${MAME_DIR}/src/devices/machine/hd63450.h
	)
endif()

###################################################
##
##@src/devices/machine/hd64610.h,MACHINES["HD64610"] = true
###################################################

if("HD64610" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/hd64610.cpp
		${MAME_DIR}/src/devices/machine/hd64610.h
	)
endif()

###################################################
##
##@src/devices/machine/hp_dc100_tape.h,MACHINES["HP_DC100_TAPE"] = true
###################################################

if("HP_DC100_TAPE" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/hp_dc100_tape.cpp
		${MAME_DIR}/src/devices/machine/hp_dc100_tape.h
	)
endif()

###################################################
##
##@src/devices/machine/hp_taco.h,MACHINES["HP_TACO"] = true
###################################################

if("HP_TACO" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/hp_taco.cpp
		${MAME_DIR}/src/devices/machine/hp_taco.h
	)
endif()

###################################################
##
##@src/devices/machine/1ma6.h,MACHINES["1MA6"] = true
###################################################

if("1MA6" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/1ma6.cpp
		${MAME_DIR}/src/devices/machine/1ma6.h
	)
endif()

###################################################
##
##@src/devices/machine/1mb5.h,MACHINES["1MB5"] = true
###################################################

if("1MB5" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/1mb5.cpp
		${MAME_DIR}/src/devices/machine/1mb5.h
	)
endif()

###################################################
##
##@src/devices/machine/i2cmem.h,MACHINES["I2CMEM"] = true
###################################################

if("I2CMEM" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i2cmem.cpp
		${MAME_DIR}/src/devices/machine/i2cmem.h
	)
endif()

###################################################
##
##@src/devices/machine/i7220.h,MACHINES["I7220"] = true
###################################################

if("I7220" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i7220.cpp
		${MAME_DIR}/src/devices/machine/i7220.h
	)
endif()

###################################################
##
##@src/devices/machine/i8087.h,MACHINES["I8087"] = true
###################################################

if("I8087" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i8087.cpp
		${MAME_DIR}/src/devices/machine/i8087.h
	)
endif()

###################################################
##
##@src/devices/machine/i8155.h,MACHINES["I8155"] = true
###################################################

if("I8155" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i8155.cpp
		${MAME_DIR}/src/devices/machine/i8155.h
	)
endif()

###################################################
##
##@src/devices/machine/i8212.h,MACHINES["I8212"] = true
###################################################

if("I8212" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i8212.cpp
		${MAME_DIR}/src/devices/machine/i8212.h
	)
endif()

###################################################
##
##@src/devices/machine/i8214.h,MACHINES["I8214"] = true
###################################################

if("I8214" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i8214.cpp
		${MAME_DIR}/src/devices/machine/i8214.h
	)
endif()

###################################################
##
##@src/devices/machine/i82355.h,MACHINES["I82355"] = true
###################################################

if("I82355" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i82355.cpp
		${MAME_DIR}/src/devices/machine/i82355.h
	)
endif()

###################################################
##
##@src/devices/machine/i8243.h,MACHINES["I8243"] = true
###################################################

if("I8243" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i8243.cpp
		${MAME_DIR}/src/devices/machine/i8243.h
	)
endif()

###################################################
##
##@src/devices/machine/i8251.h,MACHINES["I8251"] = true
###################################################

if("I8251" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i8251.cpp
		${MAME_DIR}/src/devices/machine/i8251.h
	)
endif()

###################################################
##
##@src/devices/machine/i8257.h,MACHINES["I8257"] = true
###################################################

if("I8257" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i8257.cpp
		${MAME_DIR}/src/devices/machine/i8257.h
	)
endif()


###################################################
##
##@src/devices/machine/i8271.h,MACHINES["I8271"] = true
###################################################

if("I8271" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i8271.cpp
		${MAME_DIR}/src/devices/machine/i8271.h
	)
endif()

###################################################
##
##@src/devices/machine/i8279.h,MACHINES["I8279"] = true
###################################################

if("I8279" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i8279.cpp
		${MAME_DIR}/src/devices/machine/i8279.h
	)
endif()

###################################################
##
##@src/devices/machine/i8355.h,MACHINES["I8355"] = true
###################################################

if("I8355" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i8355.cpp
		${MAME_DIR}/src/devices/machine/i8355.h
	)
endif()

###################################################
##
##@src/devices/machine/i80130.h,MACHINES["I80130"] = true
###################################################

if("I80130" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i80130.cpp
		${MAME_DIR}/src/devices/machine/i80130.h
	)
endif()

###################################################
##
##@src/devices/machine/icm7170.h,MACHINES["ICM7170"] = true
###################################################

if("ICM7170" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/icm7170.cpp
		${MAME_DIR}/src/devices/machine/icm7170.h
	)
endif()

###################################################
##
##@src/devices/machine/ibm21s850.h,MACHINES["IBM21S850"] = true
###################################################

if("IBM21S850" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ibm21s850.cpp
		${MAME_DIR}/src/devices/machine/ibm21s850.h
	)
endif()

###################################################
##
##@src/devices/machine/idectrl.h,MACHINES["IDECTRL"] = true
##@src/devices/machine/vt83c461.h,MACHINES["IDECTRL"] = true
###################################################

if("IDECTRL" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/idectrl.cpp
		${MAME_DIR}/src/devices/machine/idectrl.h
		${MAME_DIR}/src/devices/machine/vt83c461.cpp
		${MAME_DIR}/src/devices/machine/vt83c461.h
	)
endif()

###################################################
##
##@src/devices/machine/ie15.h,MACHINES["IE15"] = true
###################################################

if("IE15" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ie15.cpp
		${MAME_DIR}/src/devices/machine/ie15.h
		${MAME_DIR}/src/devices/machine/ie15_kbd.cpp
		${MAME_DIR}/src/devices/machine/ie15_kbd.h
		${GEN_DIR}/emu/layout/ie15.lh
	)
	
	layoutbuildtask("emu/layout" "ie15")
endif()

###################################################
##
##@src/devices/machine/im6402.h,MACHINES["IM6402"] = true
###################################################

if("IM6402" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/im6402.cpp
		${MAME_DIR}/src/devices/machine/im6402.h
	)
endif()

###################################################
##
##@src/devices/machine/ins8154.h,MACHINES["INS8154"] = true
###################################################

if("INS8154" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ins8154.cpp
		${MAME_DIR}/src/devices/machine/ins8154.h
	)
endif()

###################################################
##
##@src/devices/machine/ins8250.h,MACHINES["INS8250"] = true
###################################################

if("INS8250" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ins8250.cpp
		${MAME_DIR}/src/devices/machine/ins8250.h
	)
endif()

###################################################
##
##@src/devices/machine/intelfsh.h,MACHINES["INTELFLASH"] = true
###################################################

if("INTELFLASH" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/intelfsh.cpp
		${MAME_DIR}/src/devices/machine/intelfsh.h
	)
endif()

###################################################
##
##@src/devices/machine/jvsdev.h,MACHINES["JVS"] = true
##@src/devices/machine/jvshost.h,MACHINES["JVS"] = true
###################################################

if("JVS" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/jvsdev.cpp
		${MAME_DIR}/src/devices/machine/jvsdev.h
		${MAME_DIR}/src/devices/machine/jvshost.cpp
		${MAME_DIR}/src/devices/machine/jvshost.h
	)
endif()

###################################################
##
##@src/devices/machine/k033906.h,MACHINES["K033906"] = true
###################################################

if("K033906" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/k033906.cpp
		${MAME_DIR}/src/devices/machine/k033906.h
	)
endif()

###################################################
##
##@src/devices/machine/k053252.h,MACHINES["K053252"] = true
###################################################

if("K053252" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/k053252.cpp
		${MAME_DIR}/src/devices/machine/k053252.h
	)
endif()

###################################################
##
##@src/devices/machine/k056230.h,MACHINES["K056230"] = true
###################################################

if("K056230" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/k056230.cpp
		${MAME_DIR}/src/devices/machine/k056230.h
	)
endif()

###################################################
##
##@src/devices/machine/m950x0.h,MACHINES["M950X0"] = true
###################################################

if("M950X0" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/m950x0.cpp
		${MAME_DIR}/src/devices/machine/m950x0.h
	)
endif()

###################################################
##
##@src/devices/machine/mm5740.h,MACHINES["MM5740"] = true
###################################################

if("MM5740" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mm5740.cpp
		${MAME_DIR}/src/devices/machine/mm5740.h
	)
endif()

###################################################
##
##@src/devices/machine/kb3600.h,MACHINES["KB3600"] = true
###################################################

if("KB3600" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/kb3600.cpp
		${MAME_DIR}/src/devices/machine/kb3600.h
	)
endif()

###################################################
##
##@src/devices/machine/kr2376.h,MACHINES["KR2376"] = true
###################################################

if("KR2376" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/kr2376.cpp
		${MAME_DIR}/src/devices/machine/kr2376.h
	)
endif()

###################################################
##
##@src/devices/machine/latch8.h,MACHINES["LATCH8"] = true
###################################################

if("LATCH8" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/latch8.cpp
		${MAME_DIR}/src/devices/machine/latch8.h
	)
endif()

###################################################
##
##@src/devices/machine/lc89510.h,MACHINES["LC89510"] = true
###################################################

if("LC89510" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/lc89510.cpp
		${MAME_DIR}/src/devices/machine/lc89510.h
	)
endif()

###################################################
##
##@src/devices/machine/ldpr8210.h,MACHINES["LDPR8210"] = true
###################################################

if("LDPR8210" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ldpr8210.cpp
		${MAME_DIR}/src/devices/machine/ldpr8210.h
	)
endif()

###################################################
##
##@src/devices/machine/ldstub.h,MACHINES["LDSTUB"] = true
###################################################

if("LDSTUB" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ldstub.cpp
		${MAME_DIR}/src/devices/machine/ldstub.h
	)
endif()

###################################################
##
##@src/devices/machine/ldv1000.h,MACHINES["LDV1000"] = true
###################################################

if("LDV1000" IN_LIST MACHINES)
	list(APPEND MACHINES "Z80CTC")
	list(APPEND MACHINES "I8255")
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ldv1000.cpp
		${MAME_DIR}/src/devices/machine/ldv1000.h
	)
endif()

###################################################
##
##@src/devices/machine/ldp1000.h,MACHINES["LDP1000"] = true
###################################################

if("LDP1000" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ldp1000.cpp
		${MAME_DIR}/src/devices/machine/ldp1000.h
	)
endif()

###################################################
##
##@src/devices/machine/ldp1450.h,MACHINES["LDP1450"] = true
###################################################

if("LDP1450" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ldp1450.cpp
		${MAME_DIR}/src/devices/machine/ldp1450.h
	)
endif()

###################################################
##
##@src/devices/machine/ldvp931.h,MACHINES["LDVP931"] = true
###################################################

if("LDVP931" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ldvp931.cpp
		${MAME_DIR}/src/devices/machine/ldvp931.h
	)
endif()

###################################################
##
##@src/devices/machine/lh5810.h,MACHINES["LH5810"] = true
###################################################

if("LH5810" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/lh5810.cpp
		${MAME_DIR}/src/devices/machine/lh5810.h
	)
endif()

###################################################
##
##@src/devices/machine/linflash.h,MACHINES["LINFLASH"] = true
###################################################

if("LINFLASH" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/linflash.cpp
		${MAME_DIR}/src/devices/machine/linflash.h
	)
endif()

###################################################
##
##@src/devices/machine/locomo.h,MACHINES["LOCOMO"] = true
###################################################

if("LOCOMO" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/locomo.cpp
		${MAME_DIR}/src/devices/machine/locomo.h
	)
endif()

###################################################
##
##@src/devices/machine/m3002.h,MACHINES["M3002"] = true
###################################################

if("M3002" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/m3002.cpp
		${MAME_DIR}/src/devices/machine/m3002.h
	)
endif()

###################################################
##
##@src/devices/machine/m68sfdc.h,MACHINES["M68SFDC"] = true
###################################################

if("M68SFDC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/m68sfdc.cpp
		${MAME_DIR}/src/devices/machine/m68sfdc.h
	)
endif()

###################################################
##
##@src/devices/machine/m6m80011ap.h,MACHINES["M6M80011AP"] = true
###################################################

if("M6M80011AP" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/m6m80011ap.cpp
		${MAME_DIR}/src/devices/machine/m6m80011ap.h
	)
endif()

###################################################
##
##@src/devices/machine/mb14241.h,MACHINES["MB14241"] = true
###################################################

if("MB14241" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mb14241.cpp
		${MAME_DIR}/src/devices/machine/mb14241.h
	)
endif()

###################################################
##
##@src/devices/machine/mb3773.h,MACHINES["MB3773"] = true
###################################################

if("MB3773" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mb3773.cpp
		${MAME_DIR}/src/devices/machine/mb3773.h
	)
endif()

###################################################
##
##@src/devices/machine/mb8421.h,MACHINES["MB8421"] = true
###################################################

if("MB8421" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mb8421.cpp
		${MAME_DIR}/src/devices/machine/mb8421.h
	)
endif()

###################################################
##
##@src/devices/machine/mb87030.h,MACHINES["MB87030"] = true
###################################################

if("MB87030" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mb87030.cpp
		${MAME_DIR}/src/devices/machine/mb87030.h
	)
endif()

###################################################
##
##@src/devices/machine/mb87078.h,MACHINES["MB87078"] = true
###################################################

if("MB87078" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mb87078.cpp
		${MAME_DIR}/src/devices/machine/mb87078.h
	)
endif()

###################################################
##
##@src/devices/machine/mb8795.h,MACHINES["MB8795"] = true
###################################################

if("MB8795" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mb8795.cpp
		${MAME_DIR}/src/devices/machine/mb8795.h
	)
endif()

###################################################
##
##@src/devices/machine/mb89352.h,MACHINES["MB89352"] = true
###################################################

if("MB89352" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mb89352.cpp
		${MAME_DIR}/src/devices/machine/mb89352.h
	)
endif()

###################################################
##
##@src/devices/machine/mb89371.h,MACHINES["MB89371"] = true
###################################################

if("MB89371" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mb89371.cpp
		${MAME_DIR}/src/devices/machine/mb89371.h
	)
endif()

###################################################
##
##@src/devices/machine/mb89374.h,MACHINES["MB89374"] = true
###################################################

if("MB89374" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mb89374.cpp
		${MAME_DIR}/src/devices/machine/mb89374.h
	)
endif()

###################################################
##
##@src/devices/machine/mc146818.h,MACHINES["MC146818"] = true
###################################################

if("MC146818" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mc146818.cpp
		${MAME_DIR}/src/devices/machine/mc146818.h
		${MAME_DIR}/src/devices/machine/ds128x.cpp
		${MAME_DIR}/src/devices/machine/ds128x.h
	)
endif()

###################################################
##
##@src/devices/machine/mc14411.h,MACHINES["MC14411"] = true
###################################################

if("MC14411" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mc14411.cpp
		${MAME_DIR}/src/devices/machine/mc14411.h
	)
endif()

###################################################
##
##@src/devices/machine/mc6843.h,MACHINES["MC6843"] = true
###################################################

if("MC6843" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mc6843.cpp
		${MAME_DIR}/src/devices/machine/mc6843.h
	)
endif()

###################################################
##
##@src/devices/machine/mc6844.h,MACHINES["MC6844"] = true
###################################################

if("MC6844" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mc6844.cpp
		${MAME_DIR}/src/devices/machine/mc6844.h
	)
endif()

###################################################
##
##@src/devices/machine/mc6846.h,MACHINES["MC6846"] = true
###################################################

if("MC6846" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mc6846.cpp
		${MAME_DIR}/src/devices/machine/mc6846.h
	)
endif()

###################################################
##
##@src/devices/machine/mc6852.h,MACHINES["MC6852"] = true
###################################################

if("MC6852" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mc6852.cpp
		${MAME_DIR}/src/devices/machine/mc6852.h
	)
endif()

###################################################
##
##@src/devices/machine/mc6854.h,MACHINES["MC6854"] = true
###################################################

if("MC6854" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mc6854.cpp
		${MAME_DIR}/src/devices/machine/mc6854.h
	)
endif()

###################################################
##
##@src/devices/machine/mc68328.h,MACHINES["MC68328"] = true
###################################################

if("MC68328" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mc68328.cpp
		${MAME_DIR}/src/devices/machine/mc68328.h
	)
endif()

###################################################
##
##@src/devices/machine/mc68901.h,MACHINES["MC68901"] = true
###################################################

if("MC68901" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mc68901.cpp
		${MAME_DIR}/src/devices/machine/mc68901.h
	)
endif()

###################################################
##
##@src/devices/machine/mccs1850.h,MACHINES["MCCS1850"] = true
###################################################

if("MCCS1850" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mccs1850.cpp
		${MAME_DIR}/src/devices/machine/mccs1850.h
	)
endif()

###################################################
##
##@src/devices/machine/68307.h,MACHINES["M68307"] = true
###################################################

if("M68307" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/68307.cpp
		${MAME_DIR}/src/devices/machine/68307.h
		${MAME_DIR}/src/devices/machine/68307sim.cpp
		${MAME_DIR}/src/devices/machine/68307sim.h
		${MAME_DIR}/src/devices/machine/68307bus.cpp
		${MAME_DIR}/src/devices/machine/68307bus.h
		${MAME_DIR}/src/devices/machine/68307tmu.cpp
		${MAME_DIR}/src/devices/machine/68307tmu.h
	)
endif()

###################################################
##
##@src/devices/machine/68340.h,MACHINES["M68340"] = true
###################################################

if("M68340" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/68340.cpp
		${MAME_DIR}/src/devices/machine/68340.h
		${MAME_DIR}/src/devices/machine/68340sim.cpp
		${MAME_DIR}/src/devices/machine/68340sim.h
		${MAME_DIR}/src/devices/machine/68340dma.cpp
		${MAME_DIR}/src/devices/machine/68340dma.h
		${MAME_DIR}/src/devices/machine/68340ser.cpp
		${MAME_DIR}/src/devices/machine/68340ser.h
		${MAME_DIR}/src/devices/machine/68340tmu.cpp
		${MAME_DIR}/src/devices/machine/68340tmu.h
	)
endif()

###################################################
##
##@src/devices/machine/mcf5206e.h,MACHINES["MCF5206E"] = true
###################################################

if("MCF5206E" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mcf5206e.cpp
		${MAME_DIR}/src/devices/machine/mcf5206e.h
	)
endif()

###################################################
##
##@src/devices/machine/meters.h,MACHINES["METERS"] = true
###################################################

if("METERS" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/meters.cpp
		${MAME_DIR}/src/devices/machine/meters.h
	)
endif()

###################################################
##
##@src/devices/machine/microtch.h,MACHINES["MICROTOUCH"] = true
###################################################

if("MICROTOUCH" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/microtch.cpp
		${MAME_DIR}/src/devices/machine/microtch.h
	)
endif()

###################################################
##
##@src/devices/machine/mm5307.h,MACHINES["MM5307"] = true
###################################################

if("MM5307" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mm5307.cpp
		${MAME_DIR}/src/devices/machine/mm5307.h
	)
endif()

###################################################
##
##@src/devices/machine/mm58274c.h,MACHINES["MM58274C"] = true
###################################################

if("MM58274C" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mm58274c.cpp
		${MAME_DIR}/src/devices/machine/mm58274c.h
	)
endif()

###################################################
##
##@src/devices/machine/mm74c922.h,MACHINES["MM74C922"] = true
###################################################

if("MM74C922" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mm74c922.cpp
		${MAME_DIR}/src/devices/machine/mm74c922.h
	)
endif()

###################################################
##
##@src/devices/machine/mos6526.h,MACHINES["MOS6526"] = true
###################################################

if("MOS6526" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mos6526.cpp
		${MAME_DIR}/src/devices/machine/mos6526.h
	)
endif()

###################################################
##
##@src/devices/machine/mos6529.h,MACHINES["MOS6529"] = true
###################################################

if("MOS6529" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mos6529.cpp
		${MAME_DIR}/src/devices/machine/mos6529.h
	)
endif()

###################################################
##
##@src/devices/machine/mos6702.h,MACHINES["MOS6702"] = true
###################################################

if("MOS6702" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mos6702.cpp
		${MAME_DIR}/src/devices/machine/mos6702.h
	)
endif()

###################################################
##
##@src/devices/machine/mos8706.h,MACHINES["MOS8706"] = true
###################################################

if("MOS8706" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mos8706.cpp
		${MAME_DIR}/src/devices/machine/mos8706.h
	)
endif()

###################################################
##
##@src/devices/machine/mos8722.h,MACHINES["MOS8722"] = true
###################################################

if("MOS8722" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mos8722.cpp
		${MAME_DIR}/src/devices/machine/mos8722.h
	)
endif()

###################################################
##
##@src/devices/machine/mos8726.h,MACHINES["MOS8726"] = true
###################################################

if("MOS8726" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mos8726.cpp
		${MAME_DIR}/src/devices/machine/mos8726.h
	)
endif()

###################################################
##
##@src/devices/machine/mos6530.h,MACHINES["MIOT6530"] = true
##@src/devices/machine/mos6530n.h,MACHINES["MIOT6530"] = true
###################################################

if("MIOT6530" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mos6530.cpp
		${MAME_DIR}/src/devices/machine/mos6530.h
		${MAME_DIR}/src/devices/machine/mos6530n.cpp
		${MAME_DIR}/src/devices/machine/mos6530n.h
	)
endif()

###################################################
##
##@src/devices/machine/mos6551.h,MACHINES["MOS6551"] = true
###################################################

if("MOS6551" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mos6551.cpp
		${MAME_DIR}/src/devices/machine/mos6551.h
	)
endif()

###################################################
##
##@src/devices/machine/msm5832.h,MACHINES["MSM5832"] = true
###################################################

if("MSM5832" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/msm5832.cpp
		${MAME_DIR}/src/devices/machine/msm5832.h
	)
endif()

###################################################
##
##@src/devices/machine/msm58321.h,MACHINES["MSM58321"] = true
###################################################

if("MSM58321" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/msm58321.cpp
		${MAME_DIR}/src/devices/machine/msm58321.h
	)
endif()

###################################################
##
##@src/devices/machine/msm6242.h,MACHINES["MSM6242"] = true
###################################################

if("MSM6242" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/msm6242.cpp
		${MAME_DIR}/src/devices/machine/msm6242.h
	)
endif()

###################################################
##
##@src/devices/machine/msm6253.h,MACHINES["MSM6253"] = true
###################################################

if("MSM6253" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/msm6253.cpp
		${MAME_DIR}/src/devices/machine/msm6253.h
	)
endif()

###################################################
##
##@src/devices/machine/myb3k_kbd.h,MACHINES["MYB3K_KEYBOARD"] = true
###################################################

if("MYB3K_KEYBOARD" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
	${MAME_DIR}/src/devices/machine/myb3k_kbd.cpp
	${MAME_DIR}/src/devices/machine/myb3k_kbd.h
	)
endif()

###################################################
##
##@src/devices/machine/ncr539x.h,MACHINES["NCR539x"] = true
###################################################

if("NCR539x" IN_LIST MACHINES)
	list(APPEND MACHINES "SCSI")
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ncr539x.cpp
		${MAME_DIR}/src/devices/machine/ncr539x.h
	)
endif()

###################################################
##
##@src/devices/machine/nmc9306.h,MACHINES["NMC9306"] = true
###################################################

if("NMC9306" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/nmc9306.cpp
		${MAME_DIR}/src/devices/machine/nmc9306.h
	)
endif()

###################################################
##
##@src/devices/machine/nscsi_bus.h,MACHINES["NSCSI"] = true
##@src/devices/machine/nscsi_cb.h,MACHINES["NSCSI"] = true
###################################################

if("NSCSI" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/nscsi_bus.cpp
		${MAME_DIR}/src/devices/machine/nscsi_bus.h
		${MAME_DIR}/src/devices/machine/nscsi_cb.cpp
		${MAME_DIR}/src/devices/machine/nscsi_cb.h
	)
endif()

###################################################
##
##@src/devices/machine/pcf8573.h,MACHINES["PCF8573"] = true
###################################################

if("PCF8573" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/pcf8573.cpp
		${MAME_DIR}/src/devices/machine/pcf8573.h
	)
endif()

###################################################
##
##@src/devices/machine/pcf8583.h,MACHINES["PCF8583"] = true
###################################################

if("PCF8583" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/pcf8583.cpp
		${MAME_DIR}/src/devices/machine/pcf8583.h
	)
endif()

###################################################
##
##@src/devices/machine/pcf8584.h,MACHINES["PCF8584"] = true
###################################################

if("PCF8584" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/pcf8584.cpp
		${MAME_DIR}/src/devices/machine/pcf8584.h
	)
endif()

###################################################
##
##@src/devices/machine/pcf8593.h,MACHINES["PCF8593"] = true
###################################################

if("PCF8593" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/pcf8593.cpp
		${MAME_DIR}/src/devices/machine/pcf8593.h
	)
endif()

###################################################
##
##@src/devices/machine/lpci.h,MACHINES["LPCI"] = true
###################################################

if("LPCI" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/lpci.cpp
		${MAME_DIR}/src/devices/machine/lpci.h
	)
endif()

###################################################
##
##@src/devices/machine/pci.h,MACHINES["PCI"] = true
###################################################

if("PCI" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/pci.cpp
		${MAME_DIR}/src/devices/machine/pci.h
		${MAME_DIR}/src/devices/machine/pci-usb.cpp
		${MAME_DIR}/src/devices/machine/pci-usb.h
		${MAME_DIR}/src/devices/machine/pci-sata.cpp
		${MAME_DIR}/src/devices/machine/pci-sata.h
		${MAME_DIR}/src/devices/machine/pci-ide.cpp
		${MAME_DIR}/src/devices/machine/pci-ide.h
		${MAME_DIR}/src/devices/machine/pci-apic.cpp
		${MAME_DIR}/src/devices/machine/pci-apic.h
		${MAME_DIR}/src/devices/machine/pci-smbus.cpp
		${MAME_DIR}/src/devices/machine/pci-smbus.h
		${MAME_DIR}/src/devices/machine/i82541.cpp
		${MAME_DIR}/src/devices/machine/i82541.h
		${MAME_DIR}/src/devices/machine/i82875p.cpp
		${MAME_DIR}/src/devices/machine/i82875p.h
		${MAME_DIR}/src/devices/machine/i6300esb.cpp
		${MAME_DIR}/src/devices/machine/i6300esb.h
		${MAME_DIR}/src/devices/machine/i82439hx.cpp
		${MAME_DIR}/src/devices/machine/i82439hx.h
		${MAME_DIR}/src/devices/machine/i82439tx.cpp
		${MAME_DIR}/src/devices/machine/i82439tx.h
		${MAME_DIR}/src/devices/machine/i82371sb.cpp
		${MAME_DIR}/src/devices/machine/i82371sb.h
		${MAME_DIR}/src/devices/machine/lpc.h
		${MAME_DIR}/src/devices/machine/lpc-acpi.cpp
		${MAME_DIR}/src/devices/machine/lpc-acpi.h
		${MAME_DIR}/src/devices/machine/lpc-rtc.cpp
		${MAME_DIR}/src/devices/machine/lpc-rtc.h
		${MAME_DIR}/src/devices/machine/lpc-pit.cpp
		${MAME_DIR}/src/devices/machine/lpc-pit.h
		${MAME_DIR}/src/devices/machine/vrc4373.cpp
		${MAME_DIR}/src/devices/machine/vrc4373.h
		${MAME_DIR}/src/devices/machine/vrc5074.cpp
		${MAME_DIR}/src/devices/machine/vrc5074.h
		${MAME_DIR}/src/devices/machine/gt64xxx.cpp
		${MAME_DIR}/src/devices/machine/gt64xxx.h
		${MAME_DIR}/src/devices/machine/sis85c496.cpp
		${MAME_DIR}/src/devices/machine/sis85c496.h
	)
endif()

###################################################
##
##@src/devices/machine/pckeybrd.h,MACHINES["PCKEYBRD"] = true
###################################################

if("PCKEYBRD" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/pckeybrd.cpp
		${MAME_DIR}/src/devices/machine/pckeybrd.h
	)
endif()

###################################################
##
##@src/devices/machine/phi.h,MACHINES["PHI"] = true
###################################################

if("PHI" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/phi.cpp
		${MAME_DIR}/src/devices/machine/phi.h
	)
endif()

###################################################
##
##@src/devices/machine/pic8259.h,MACHINES["PIC8259"] = true
###################################################

if("PIC8259" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/pic8259.cpp
		${MAME_DIR}/src/devices/machine/pic8259.h
	)
endif()

###################################################
##
##@src/devices/machine/pit8253.h,MACHINES["PIT8253"] = true
###################################################

if("PIT8253" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/pit8253.cpp
		${MAME_DIR}/src/devices/machine/pit8253.h
	)
endif()

###################################################
##
##@src/devices/machine/pla.h,MACHINES["PLA"] = true
###################################################

if("PLA" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/pla.cpp
		${MAME_DIR}/src/devices/machine/pla.h
	)
endif()

###################################################
##
##@src/devices/machine/pxa255.h,MACHINES["PXA255"] = true
###################################################

if("PXA255" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/pxa255.cpp
		${MAME_DIR}/src/devices/machine/pxa255.h
		${MAME_DIR}/src/devices/machine/pxa255defs.h
	)
endif()

###################################################
##
##@src/devices/machine/r10696.h,MACHINES["R10696"] = true
###################################################

if("R10696" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/r10696.cpp
		${MAME_DIR}/src/devices/machine/r10696.h
	)
endif()

###################################################
##
##@src/devices/machine/r10788.h,MACHINES["R10788"] = true
###################################################

if("R10788" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/r10788.cpp
		${MAME_DIR}/src/devices/machine/r10788.h
	)
endif()

###################################################
##
##@src/devices/machine/ra17xx.h,MACHINES["RA17XX"] = true
###################################################

if("RA17XX" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ra17xx.cpp
		${MAME_DIR}/src/devices/machine/ra17xx.h
	)
endif()

###################################################
##
##@src/devices/machine/rf5c296.h,MACHINES["RF5C296"] = true
###################################################

if("RF5C296" IN_LIST MACHINES)
	list(APPEND MACHINES "PCCARD")
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/rf5c296.cpp
		${MAME_DIR}/src/devices/machine/rf5c296.h
	)
endif()

###################################################
##
##@src/devices/machine/ripple_counter.h,MACHINES["RIPPLE_COUNTER"] = true
###################################################

if("RIPPLE_COUNTER" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ripple_counter.cpp
		${MAME_DIR}/src/devices/machine/ripple_counter.h
	)
endif()

###################################################
##
##@src/devices/machine/roc10937.h,MACHINES["ROC10937"] = true
###################################################

if("ROC10937" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/roc10937.cpp
		${MAME_DIR}/src/devices/machine/roc10937.h
	)
endif()

###################################################
##
##@src/devices/machine/rp5c01.h,MACHINES["RP5C01"] = true
###################################################

if("RP5C01" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/rp5c01.cpp
		${MAME_DIR}/src/devices/machine/rp5c01.h
	)
endif()

###################################################
##
##@src/devices/machine/rp5c15.h,MACHINES["RP5C15"] = true
###################################################

if("RP5C15" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/rp5c15.cpp
		${MAME_DIR}/src/devices/machine/rp5c15.h
	)
endif()

###################################################
##
##@src/devices/machine/rp5h01.h,MACHINES["RP5H01"] = true
###################################################

if("RP5H01" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/rp5h01.cpp
		${MAME_DIR}/src/devices/machine/rp5h01.h
	)
endif()

###################################################
##
##@src/devices/machine/64h156.h,MACHINES["R64H156"] = true
###################################################

if("R64H156" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/64h156.cpp
		${MAME_DIR}/src/devices/machine/64h156.h
	)
endif()

###################################################
##
##@src/devices/machine/rstbuf.h,MACHINES["RSTBUF"] = true
###################################################

if("RSTBUF" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/rstbuf.cpp
		${MAME_DIR}/src/devices/machine/rstbuf.h
	)
endif()

###################################################
##
##@src/devices/machine/rtc4543.h,MACHINES["RTC4543"] = true
###################################################

if("RTC4543" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/rtc4543.cpp
		${MAME_DIR}/src/devices/machine/rtc4543.h
	)
endif()

###################################################
##
##@src/devices/machine/rtc65271.h,MACHINES["RTC65271"] = true
###################################################

if("RTC65271" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/rtc65271.cpp
		${MAME_DIR}/src/devices/machine/rtc65271.h
	)
endif()

###################################################
##
##@src/devices/machine/rtc9701.h,MACHINES["RTC9701"] = true
###################################################

if("RTC9701" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/rtc9701.cpp
		${MAME_DIR}/src/devices/machine/rtc9701.h
	)
endif()

###################################################
##
##@src/devices/machine/s2636.h,MACHINES["S2636"] = true
###################################################

if("S2636" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/s2636.cpp
		${MAME_DIR}/src/devices/machine/s2636.h
	)
endif()

###################################################
##
##@src/devices/machine/s3520cf.h,MACHINES["S3520CF"] = true
###################################################

if("S3520CF" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/s3520cf.cpp
		${MAME_DIR}/src/devices/machine/s3520cf.h
	)
endif()

###################################################
##
##@src/devices/machine/s3c2400.h,MACHINES["S3C24XX"] = true
##@src/devices/machine/s3c2410.h,MACHINES["S3C24XX"] = true
##@src/devices/machine/s3c2440.h,MACHINES["S3C24XX"] = true
###################################################

if("S3C24XX" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/s3c2400.cpp
		${MAME_DIR}/src/devices/machine/s3c2400.h
		${MAME_DIR}/src/devices/machine/s3c2410.cpp
		${MAME_DIR}/src/devices/machine/s3c2410.h
		${MAME_DIR}/src/devices/machine/s3c2440.cpp
		${MAME_DIR}/src/devices/machine/s3c2440.h
		${MAME_DIR}/src/devices/machine/s3c24xx.cpp
		${MAME_DIR}/src/devices/machine/s3c24xx.h
		${MAME_DIR}/src/devices/machine/s3c24xx.hxx
	)
endif()

###################################################
##
##@src/devices/machine/s3c44b0.h,MACHINES["S3C44B0"] = true
###################################################

if("S3C44B0" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/s3c44b0.cpp
		${MAME_DIR}/src/devices/machine/s3c44b0.h
	)
endif()

###################################################
##
##@src/devices/machine/sa1110.h,MACHINES["SA1110"] = true
###################################################

if("SA1110" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/sa1110.cpp
		${MAME_DIR}/src/devices/machine/sa1110.h
	)
endif()

###################################################
##
##@src/devices/machine/sa1111.h,MACHINES["SA1111"] = true
###################################################

if("SA1111" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/sa1111.cpp
		${MAME_DIR}/src/devices/machine/sa1111.h
	)
endif()

###################################################
##
##@src/devices/machine/saa1043.h,MACHINES["SAA1043"] = true
###################################################

if("SAA1043" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/saa1043.cpp
		${MAME_DIR}/src/devices/machine/saa1043.h
	)
endif()

###################################################
##
##@src/devices/machine/scc68070.h,MACHINES["SCC68070"] = true
###################################################
if("SCC68070" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/scc68070.cpp
		${MAME_DIR}/src/devices/machine/scc68070.h
	)
endif()

###################################################
##
##@src/devices/machine/scn_pci.h,MACHINES["SCN_PCI"] = true
###################################################

if("SCN_PCI" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/scn_pci.cpp
		${MAME_DIR}/src/devices/machine/scn_pci.h
	)
endif()

###################################################
##
##@src/devices/machine/scoop.h,MACHINES["SCOOP"] = true
###################################################
if("SCOOP" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/scoop.cpp
		${MAME_DIR}/src/devices/machine/scoop.h
	)
endif()

###################################################
##
##@src/devices/machine/scnxx562.h,MACHINES["DUSCC"] = true
###################################################

if("DUSCC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/scnxx562.cpp
		${MAME_DIR}/src/devices/machine/scnxx562.h
	)
endif()

###################################################
##
##@src/devices/machine/sda2006.h,MACHINES["SDA2006"] = true
###################################################

if("SDA2006" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/sda2006.cpp
		${MAME_DIR}/src/devices/machine/sda2006.h
	)
endif()

###################################################
##
##@src/devices/machine/sensorboard.h,MACHINES["SENSORBOARD"] = true
###################################################

if("SENSORBOARD" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/sensorboard.cpp
		${MAME_DIR}/src/devices/machine/sensorboard.h
	)
endif()

###################################################
##
##@src/devices/machine/serflash.h,MACHINES["SERFLASH"] = true
###################################################

if("SERFLASH" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/serflash.cpp
		${MAME_DIR}/src/devices/machine/serflash.h
	)
endif()

###################################################
##
##@src/devices/machine/smc91c9x.h,MACHINES["SMC91C9X"] = true
###################################################

if("SMC91C9X" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/smc91c9x.cpp
		${MAME_DIR}/src/devices/machine/smc91c9x.h
	)
endif()

###################################################
##
##@src/devices/machine/smpc.h,MACHINES["SMPC"] = true
###################################################

if("SMPC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/smpc.cpp
		${MAME_DIR}/src/devices/machine/smpc.h
	)
endif()

###################################################
##
##@src/devices/machine/sega_scu.h,MACHINES["SEGA_SCU"] = true
###################################################

if("SEGA_SCU" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/sega_scu.cpp
		${MAME_DIR}/src/devices/machine/sega_scu.h
	)
endif()

###################################################
##
##@src/devices/machine/spg2xx.h,MACHINES["SPG2XX"] = true
##@src/devices/machine/spg110.h,MACHINES["SPG2XX"] = true
##@src/devices/machine/generalplus_gpl16250soc.h,MACHINES["SPG2XX"] = true
###################################################

if("SPG2XX" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/spg2xx.cpp
		${MAME_DIR}/src/devices/machine/spg2xx.h
		${MAME_DIR}/src/devices/machine/spg2xx_audio.cpp
		${MAME_DIR}/src/devices/machine/spg2xx_audio.h
		${MAME_DIR}/src/devices/machine/spg2xx_io.cpp
		${MAME_DIR}/src/devices/machine/spg2xx_io.h
		${MAME_DIR}/src/devices/machine/spg2xx_sysdma.cpp
		${MAME_DIR}/src/devices/machine/spg2xx_sysdma.h
		${MAME_DIR}/src/devices/machine/spg2xx_video.cpp
		${MAME_DIR}/src/devices/machine/spg2xx_video.h
		${MAME_DIR}/src/devices/machine/spg110.cpp
		${MAME_DIR}/src/devices/machine/spg110.h
		${MAME_DIR}/src/devices/machine/spg110_video.cpp
		${MAME_DIR}/src/devices/machine/spg110_video.h
		${MAME_DIR}/src/devices/machine/generalplus_gpl16250soc.cpp
		${MAME_DIR}/src/devices/machine/generalplus_gpl16250soc.h
		${MAME_DIR}/src/devices/machine/generalplus_gpl16250soc_video.cpp
		${MAME_DIR}/src/devices/machine/generalplus_gpl16250soc_video.h
		${MAME_DIR}/src/devices/machine/spg_renderer.cpp
		${MAME_DIR}/src/devices/machine/spg_renderer.h
	)
endif()

###################################################
##
##@src/devices/machine/spg290_cdservo.h,MACHINES["SPG290"] = true
##@src/devices/machine/spg290_timer.h,MACHINES["SPG290"] = true
##@src/devices/machine/spg290_i2c.h,MACHINES["SPG290"] = true
##@src/devices/machine/spg290_ppu.h,MACHINES["SPG290"] = true
###################################################

if("SPG290" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/spg290_cdservo.cpp
		${MAME_DIR}/src/devices/machine/spg290_cdservo.h
		${MAME_DIR}/src/devices/machine/spg290_timer.cpp
		${MAME_DIR}/src/devices/machine/spg290_timer.h
		${MAME_DIR}/src/devices/machine/spg290_i2c.cpp
		${MAME_DIR}/src/devices/machine/spg290_i2c.h
		${MAME_DIR}/src/devices/machine/spg290_ppu.cpp
		${MAME_DIR}/src/devices/machine/spg290_ppu.h
	)
endif()
###################################################
##
##@src/devices/machine/stvcd.h,MACHINES["STVCD"] = true
###################################################

if("STVCD" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/stvcd.cpp
		${MAME_DIR}/src/devices/machine/stvcd.h
	)
endif()

###################################################
##
##@src/devices/machine/swtpc8212.h,MACHINES["SWTPC8212"] = true
###################################################

if("SWTPC8212" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/swtpc8212.cpp
		${MAME_DIR}/src/devices/machine/swtpc8212.h
	)
endif()

###################################################
##
##
###################################################

if(("ATA" IN_LIST BUSES) OR ("SCSI" IN_LIST BUSES) OR 
	("T10" IN_LIST MACHINES))
endif()

if("T10" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/t10mmc.cpp
		${MAME_DIR}/src/devices/machine/t10mmc.h
		${MAME_DIR}/src/devices/machine/t10sbc.cpp
		${MAME_DIR}/src/devices/machine/t10sbc.h
		${MAME_DIR}/src/devices/machine/t10spc.cpp
		${MAME_DIR}/src/devices/machine/t10spc.h
	)
endif()


###################################################
##
##@src/devices/machine/smartboard.h,MACHINES["TASC_SB30"] = true
###################################################

if("TASC_SB30" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/smartboard.cpp
		${MAME_DIR}/src/devices/machine/smartboard.h
	)
endif()

###################################################
##
##@src/devices/machine/tc009xlvc.h,MACHINES["TC0091LVC"] = true
###################################################

if("TC0091LVC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/tc009xlvc.cpp
		${MAME_DIR}/src/devices/machine/tc009xlvc.h
	)
endif()

###################################################
##
##@src/devices/machine/tdc1008.h,MACHINES["TDC1008"] = true
###################################################

if("TDC1008" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/tdc1008.cpp
		${MAME_DIR}/src/devices/machine/tdc1008.h
	)
endif()

###################################################
##
##@src/devices/machine/te7750.h,MACHINES["TE7750"] = true
###################################################

if("TE7750" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/te7750.cpp
		${MAME_DIR}/src/devices/machine/te7750.h
	)
endif()

###################################################
##
##@src/devices/machine/ticket.h,MACHINES["TICKET"] = true
###################################################

if("TICKET" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ticket.cpp
		${MAME_DIR}/src/devices/machine/ticket.h
	)
endif()

###################################################
##
##@src/devices/machine/timekpr.h,MACHINES["TIMEKPR"] = true
###################################################

if("TIMEKPR" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/timekpr.cpp
		${MAME_DIR}/src/devices/machine/timekpr.h
	)
endif()

###################################################
##
##@src/devices/machine/tmc0430.h,MACHINES["TMC0430"] = true
###################################################

if("TMC0430" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/tmc0430.cpp
		${MAME_DIR}/src/devices/machine/tmc0430.h
	)
endif()

###################################################
##
##@src/devices/machine/tmc208k.h,MACHINES["TMC208K"] = true
###################################################

if("TMC208K" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/tmc208k.cpp
		${MAME_DIR}/src/devices/machine/tmc208k.h
	)
endif()

###################################################
##
##@src/devices/machine/tmp68301.h,MACHINES["TMP68301"] = true
###################################################

if("TMP68301" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/tmp68301.cpp
		${MAME_DIR}/src/devices/machine/tmp68301.h
	)
endif()

###################################################
##
##@src/devices/machine/tms1024.h,MACHINES["TMS1024"] = true
###################################################

if("TMS1024" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/tms1024.cpp
		${MAME_DIR}/src/devices/machine/tms1024.h
	)
endif()

###################################################
##
##@src/devices/machine/tms5501.h,MACHINES["TMS5501"] = true
###################################################

if("TMS5501" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/tms5501.cpp
		${MAME_DIR}/src/devices/machine/tms5501.h
	)
endif()

###################################################
##
##@src/devices/machine/tms6100.h,MACHINES["TMS6100"] = true
###################################################

if("TMS6100" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/tms6100.cpp
		${MAME_DIR}/src/devices/machine/tms6100.h
	)
endif()

###################################################
##
##@src/devices/machine/tms9901.h,MACHINES["TMS9901"] = true
###################################################

if("TMS9901" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/tms9901.cpp
		${MAME_DIR}/src/devices/machine/tms9901.h
	)
endif()

###################################################
##
##@src/devices/machine/tms9902.h,MACHINES["TMS9902"] = true
###################################################

if("TMS9902" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/tms9902.cpp
		${MAME_DIR}/src/devices/machine/tms9902.h
	)
endif()

###################################################
##
##@src/devices/machine/tms9914.h,MACHINES["TMS9914"] = true
###################################################

if("TMS9914" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/tms9914.cpp
		${MAME_DIR}/src/devices/machine/tms9914.h
	)
endif()

###################################################
##
##@src/devices/machine/tsb12lv01a.h,MACHINES["TSB12LV01A"] = true
###################################################

if("TSB12LV01A" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/tsb12lv01a.cpp
		${MAME_DIR}/src/devices/machine/tsb12lv01a.h
	)
endif()

###################################################
##
##@src/devices/machine/tube.h,MACHINES["TUBE"] = true
###################################################

if("TUBE" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/tube.cpp
		${MAME_DIR}/src/devices/machine/tube.h
	)
endif()

###################################################
##
##@src/devices/machine/ucb1200.h,MACHINES["UCB1200"] = true
###################################################

if("UCB1200" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ucb1200.cpp
		${MAME_DIR}/src/devices/machine/ucb1200.h
	)
endif()

###################################################
##
##@src/devices/machine/upd1990a.h,MACHINES["UPD1990A"] = true
###################################################

if("UPD1990A" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/upd1990a.cpp
		${MAME_DIR}/src/devices/machine/upd1990a.h
	)
endif()

###################################################
##
##@src/devices/machine/upd4992.h,MACHINES["UPD4992"] = true
###################################################

if("UPD4992" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/upd4992.cpp
		${MAME_DIR}/src/devices/machine/upd4992.h
	)
endif()


###################################################
##
##@src/devices/machine/upd4701.h,MACHINES["UPD4701"] = true
###################################################

if("UPD4701" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/upd4701.cpp
		${MAME_DIR}/src/devices/machine/upd4701.h
	)
endif()

###################################################
##
##@src/devices/machine/upd7001.h,MACHINES["UPD7001"] = true
###################################################

if("UPD7001" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/upd7001.cpp
		${MAME_DIR}/src/devices/machine/upd7001.h
	)
endif()

###################################################
##
##@src/devices/machine/upd7002.h,MACHINES["UPD7002"] = true
###################################################

if("UPD7002" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/upd7002.cpp
		${MAME_DIR}/src/devices/machine/upd7002.h
	)
endif()

###################################################
##
##@src/devices/machine/upd7004.h,MACHINES["UPD7004"] = true
###################################################

if("UPD7004" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/upd7004.cpp
		${MAME_DIR}/src/devices/machine/upd7004.h
	)
endif()

###################################################
##
##@src/devices/machine/upd71071.h,MACHINES["UPD71071"] = true
###################################################

if("UPD71071" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/upd71071.cpp
		${MAME_DIR}/src/devices/machine/upd71071.h
	)
endif()

###################################################
##
##@src/devices/machine/upd765.h,MACHINES["UPD765"] = true
###################################################

if("UPD765" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/upd765.cpp
		${MAME_DIR}/src/devices/machine/upd765.h
	)
endif()

###################################################
##
##@src/devices/machine/v3021.h,MACHINES["V3021"] = true
###################################################

if("V3021" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/v3021.cpp
		${MAME_DIR}/src/devices/machine/v3021.h
	)
endif()

###################################################
##
##@src/devices/machine/vic_pl192.h,MACHINES["VIC_PL192"] = true
###################################################

if("VIC_PL192" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/vic_pl192.cpp
		${MAME_DIR}/src/devices/machine/vic_pl192.h
	)
endif()

###################################################
##
##@src/devices/machine/wd_fdc.h,MACHINES["WD_FDC"] = true
###################################################

if("WD_FDC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/wd_fdc.cpp
		${MAME_DIR}/src/devices/machine/wd_fdc.h
	)
endif()

###################################################
##
##@src/devices/machine/wd1000.h,MACHINES["WD1000"] = true
###################################################

if("WD1000" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/wd1000.cpp
		${MAME_DIR}/src/devices/machine/wd1000.h
	)
endif()

###################################################
##
##@src/devices/machine/wd1010.h,MACHINES["WD1010"] = true
###################################################

if("WD1010" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/wd1010.cpp
		${MAME_DIR}/src/devices/machine/wd1010.h
	)
endif()

###################################################
##
##@src/devices/machine/wd11c00_17.h,MACHINES["WD11C00_17"] = true
###################################################

if("WD11C00_17" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/wd11c00_17.cpp
		${MAME_DIR}/src/devices/machine/wd11c00_17.h
	)
endif()

###################################################
##
##@src/devices/machine/wd2010.h,MACHINES["WD2010"] = true
###################################################

if("WD2010" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/wd2010.cpp
		${MAME_DIR}/src/devices/machine/wd2010.h
	)
endif()

###################################################
##
##@src/devices/machine/wd33c9x.h,MACHINES["WD33C9X"] = true
###################################################

if("WD33C9X" IN_LIST MACHINES)
	list(APPEND MACHINES "SCSI")
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/wd33c9x.cpp
		${MAME_DIR}/src/devices/machine/wd33c9x.h
	)
endif()

###################################################
##
##@src/devices/machine/wd7600.h,MACHINES["WD7600"] = true
###################################################

if("WD7600" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/wd7600.cpp
		${MAME_DIR}/src/devices/machine/wd7600.h
	)
endif()

###################################################
##
##@src/devices/machine/x2201.h,MACHINES["X2201"] = true
###################################################

if("X2201" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/x2201.cpp
		${MAME_DIR}/src/devices/machine/x2201.h
	)
endif()

###################################################
##
##@src/devices/machine/x2212.h,MACHINES["X2212"] = true
###################################################

if("X2212" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/x2212.cpp
		${MAME_DIR}/src/devices/machine/x2212.h
	)
endif()

###################################################
##
##@src/devices/machine/x76f041.h,MACHINES["X76F041"] = true
###################################################

if("X76F041" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/x76f041.cpp
		${MAME_DIR}/src/devices/machine/x76f041.h
	)
endif()

###################################################
##
##@src/devices/machine/x76f100.h,MACHINES["X76F100"] = true
###################################################

if("X76F100" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/x76f100.cpp
		${MAME_DIR}/src/devices/machine/x76f100.h
	)
endif()

###################################################
##
##@src/devices/machine/ym2148.h,MACHINES["YM2148"] = true
###################################################

if("YM2148" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ym2148.cpp
		${MAME_DIR}/src/devices/machine/ym2148.h
	)
endif()

###################################################
##
##@src/devices/machine/ym3802.h,MACHINES["YM3802"] = true
###################################################

if("YM3802" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ym3802.cpp
		${MAME_DIR}/src/devices/machine/ym3802.h
	)
endif()

###################################################
##
##@src/devices/machine/z80ctc.h,MACHINES["Z80CTC"] = true
###################################################

if("Z80CTC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/z80ctc.cpp
		${MAME_DIR}/src/devices/machine/z80ctc.h
	)
endif()

###################################################
##
##@src/devices/machine/z80sio.h,MACHINES["Z80SIO"] = true
###################################################

if("Z80SIO" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/z80sio.cpp
		${MAME_DIR}/src/devices/machine/z80sio.h
	)
endif()

###################################################
##
##@src/devices/machine/z80scc.h,MACHINES["Z80SCC"] = true
###################################################

if("Z80SCC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/z80scc.cpp
		${MAME_DIR}/src/devices/machine/z80scc.h
	)
endif()

###################################################
##
##@src/devices/machine/z80dma.h,MACHINES["Z80DMA"] = true
###################################################

if("Z80DMA" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/z80dma.cpp
		${MAME_DIR}/src/devices/machine/z80dma.h
	)
endif()

###################################################
##
##@src/devices/machine/z80pio.h,MACHINES["Z80PIO"] = true
###################################################

if("Z80PIO" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/z80pio.cpp
		${MAME_DIR}/src/devices/machine/z80pio.h
	)
endif()

###################################################
##
##@src/devices/machine/z80sti.h,MACHINES["Z80STI"] = true
###################################################

if("Z80STI" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/z80sti.cpp
		${MAME_DIR}/src/devices/machine/z80sti.h
	)
endif()

###################################################
##
##@src/devices/machine/z8536.h,MACHINES["Z8536"] = true
###################################################

if("Z8536" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/z8536.cpp
		${MAME_DIR}/src/devices/machine/z8536.h
	)
endif()

###################################################
##
##@src/devices/machine/pccard.h,MACHINES["PCCARD"] = true
###################################################

if("PCCARD" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/pccard.cpp
		${MAME_DIR}/src/devices/machine/pccard.h
	)
endif()

###################################################
##
##@src/devices/machine/i8255.h,MACHINES["I8255"] = true
###################################################

if("I8255" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i8255.cpp
		${MAME_DIR}/src/devices/machine/i8255.h
		${MAME_DIR}/src/devices/machine/mb89363b.cpp
		${MAME_DIR}/src/devices/machine/mb89363b.h
	)
endif()

###################################################
##
##@src/devices/machine/ncr5380n.h,MACHINES["NCR5380N"] = true
###################################################

if("NCR5380N" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ncr5380n.cpp
		${MAME_DIR}/src/devices/machine/ncr5380n.h
	)
endif()

###################################################
##
##@src/devices/machine/ncr5390.h,MACHINES["NCR5390"] = true
###################################################

if("NCR5390" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ncr5390.cpp
		${MAME_DIR}/src/devices/machine/ncr5390.h
	)
endif()

###################################################
##
##@src/devices/machine/mm58167.h,MACHINES["MM58167"] = true
###################################################

if("MM58167" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mm58167.cpp
		${MAME_DIR}/src/devices/machine/mm58167.h
	)
endif()

###################################################
##
##@src/devices/machine/mm58174.h,MACHINES["MM58174"] = true
###################################################

if("MM58174" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mm58174.cpp
		${MAME_DIR}/src/devices/machine/mm58174.h
	)
endif()


###################################################
##
##@src/devices/machine/dp8390.h,MACHINES["DP8390"] = true
###################################################

if("DP8390" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/dp8390.cpp
		${MAME_DIR}/src/devices/machine/dp8390.h
	)
endif()

###################################################
##
##@src/devices/machine/dp83932c.h,MACHINES["DP83932C"] = true
###################################################

if("DP83932C" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/dp83932c.cpp
		${MAME_DIR}/src/devices/machine/dp83932c.h
	)
endif()

###################################################
##
##@src/devices/machine/dp8573.h,MACHINES["DP8573"] = true
###################################################

if("DP8573" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/dp8573.cpp
		${MAME_DIR}/src/devices/machine/dp8573.h
	)
endif()

###################################################
##
##@src/devices/machine/pc_lpt.h,MACHINES["PC_LPT"] = true
###################################################

if("PC_LPT" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/pc_lpt.cpp
		${MAME_DIR}/src/devices/machine/pc_lpt.h
	)
endif()

###################################################
##
##@src/devices/machine/pc_fdc.h,MACHINES["PC_FDC"] = true
###################################################

if("PC_FDC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/pc_fdc.cpp
		${MAME_DIR}/src/devices/machine/pc_fdc.h
	)
endif()

###################################################
##
##@src/devices/machine/mpu401.h,MACHINES["MPU401"] = true
###################################################

if("MPU401" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mpu401.cpp
		${MAME_DIR}/src/devices/machine/mpu401.h
	)
endif()

###################################################
##
##@src/devices/machine/at_keybc.h,MACHINES["AT_KEYBC"] = true
###################################################

if("AT_KEYBC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/at_keybc.cpp
		${MAME_DIR}/src/devices/machine/at_keybc.h
	)
endif()


###################################################
##
##@src/devices/machine/hdc92x4.h,MACHINES["HDC9234"] = true
###################################################

if("HDC9234" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/hdc92x4.cpp
		${MAME_DIR}/src/devices/machine/hdc92x4.h
	)
endif()

###################################################
##
##@src/devices/machine/strata.h,MACHINES["STRATA"] = true
###################################################

if("STRATA" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/strata.cpp
		${MAME_DIR}/src/devices/machine/strata.h
	)
endif()

###################################################
##
##@src/devices/machine/steppers.h,MACHINES["STEPPERS"] = true
###################################################

if("STEPPERS" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/steppers.cpp
		${MAME_DIR}/src/devices/machine/steppers.h
	)
endif()

###################################################
##
##@src/devices/machine/corvushd.h,MACHINES["CORVUSHD"] = true
###################################################
if("CORVUSHD" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/corvushd.cpp
		${MAME_DIR}/src/devices/machine/corvushd.h
	)
endif()

###################################################
##
##@src/devices/machine/wozfdc.h,MACHINES["WOZFDC"] = true
###################################################
if("WOZFDC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/wozfdc.cpp
		${MAME_DIR}/src/devices/machine/wozfdc.h
	)
endif()

###################################################
##
##@src/devices/machine/diablo_hd.h,MACHINES["DIABLO_HD"] = true
###################################################
if("DIABLO_HD" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/diablo_hd.cpp
		${MAME_DIR}/src/devices/machine/diablo_hd.h
	)
endif()

###################################################
##
##@src/devices/machine/fdc37c665gt.h,MACHINES["FDC37C665GT"] = true
###################################################

if("FDC37C665GT" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/fdc37c665gt.cpp
		${MAME_DIR}/src/devices/machine/fdc37c665gt.h
	)
endif()

###################################################
##
##@src/devices/machine/pci9050.h,MACHINES["PCI9050"] = true
###################################################

if("PCI9050" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/pci9050.cpp
		${MAME_DIR}/src/devices/machine/pci9050.h
	)
endif()

###################################################
##
##@src/devices/machine/netlist.h,MACHINES["NETLIST"] = true
###################################################

if("NETLIST" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/netlist.cpp
		${MAME_DIR}/src/devices/machine/netlist.h
	)
endif()

###################################################
##
##@src/devices/machine/nsc810.h,MACHINES["NSC810"] = true
###################################################

if("NSC810" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/nsc810.cpp
		${MAME_DIR}/src/devices/machine/nsc810.h
	)
endif()

###################################################
##
##@src/devices/machine/vt82c496.h,MACHINES["VT82C496"] = true
###################################################

if("VT82C496" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/vt82c496.cpp
		${MAME_DIR}/src/devices/machine/vt82c496.h
	)
endif()

###################################################
##
##@src/devices/machine/fdc37c93x.h,MACHINES["FDC37C93X"] = true
###################################################

if("FDC37C93X" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/fdc37c93x.cpp
		${MAME_DIR}/src/devices/machine/fdc37c93x.h
	)
endif()

###################################################
##
##@src/devices/machine/pdc.h,MACHINES["PDC"] = true
###################################################

if("PDC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/pdc.cpp
		${MAME_DIR}/src/devices/machine/pdc.h
	)
endif()

###################################################
##
##@src/devices/machine/genpc.h,MACHINES["GENPC"] = true
###################################################

if("GENPC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/genpc.cpp
		${MAME_DIR}/src/devices/machine/genpc.h
	)
endif()

###################################################
##
##@src/devices/machine/gen_latch.h,MACHINES["GEN_LATCH"] = true
###################################################

if("GEN_LATCH" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/gen_latch.cpp
		${MAME_DIR}/src/devices/machine/gen_latch.h
	)
endif()

###################################################
##
##@src/devices/machine/fdc_pll.h,MACHINES["FDC_PLL"] = true
###################################################

if("FDC_PLL" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/fdc_pll.cpp
		${MAME_DIR}/src/devices/machine/fdc_pll.h
	)
endif()

###################################################
##
##@src/devices/machine/watchdog.h,MACHINES["WATCHDOG"] = true
###################################################

if("WATCHDOG" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/watchdog.cpp
		${MAME_DIR}/src/devices/machine/watchdog.h
	)
endif()


###################################################
##
##@src/devices/machine/smartmed.h,MACHINES["SMARTMEDIA"] = true
###################################################
if("SMARTMEDIA" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/smartmed.cpp
		${MAME_DIR}/src/devices/machine/smartmed.h
	)
endif()

###################################################
##
##@src/devices/machine/appldriv.h,MACHINES["APPLE_DRIVE"] = true
###################################################
if("APPLE_DRIVE" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/appldriv.cpp
		${MAME_DIR}/src/devices/machine/appldriv.h
	)
endif()

###################################################
##
##@src/devices/machine/applefdc.h,MACHINES["APPLE_FDC"] = true
###################################################
if("APPLE_FDC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/applefdc.cpp
		${MAME_DIR}/src/devices/machine/applefdc.h
	)
endif()

###################################################
##
##@src/devices/machine/sonydriv.h,MACHINES["SONY_DRIVE"] = true
###################################################
if("SONY_DRIVE" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/sonydriv.cpp
		${MAME_DIR}/src/devices/machine/sonydriv.h
	)
endif()

###################################################
##
##@src/devices/machine/scnxx562.h,MACHINES["SCNXX562"] = true
###################################################
if("SCNXX562" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/scnxx562.cpp
		${MAME_DIR}/src/devices/machine/scnxx562.h
	)
endif()

###################################################
##
##@src/devices/machine/input_merger.h,MACHINES["INPUT_MERGER"] = true
###################################################
if("INPUT_MERGER" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/input_merger.cpp
		${MAME_DIR}/src/devices/machine/input_merger.h
	)
endif()

###################################################
##
##@src/devices/machine/k054321.h,MACHINES["K054321"] = true
###################################################
if("K054321" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/k054321.cpp
		${MAME_DIR}/src/devices/machine/k054321.h
	)
endif()

###################################################
##
##@src/devices/machine/smioc.h,MACHINES["SMIOC"] = true
###################################################

if("SMIOC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/smioc.cpp
		${MAME_DIR}/src/devices/machine/smioc.h
	)
endif()

###################################################
##
##@src/devices/machine/i82586.h,MACHINES["I82586"] = true
###################################################

if("I82586" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i82586.cpp
		${MAME_DIR}/src/devices/machine/i82586.h
	)
endif()

###################################################
##
##@src/devices/machine/adc0844.h,MACHINES["ADC0844"] = true
###################################################

if("ADC0844" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/adc0844.cpp
		${MAME_DIR}/src/devices/machine/adc0844.h
	)
endif()

###################################################
##
##@src/devices/machine/28fxxx.h,MACHINES["28FXXX"] = true
###################################################

if("28FXXX" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/28fxxx.cpp
		${MAME_DIR}/src/devices/machine/28fxxx.h
	)
endif()

###################################################
##
##@src/devices/machine/gen_fifo.h,MACHINES["GEN_FIFO"] = true
###################################################

if("GEN_FIFO" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/gen_fifo.cpp
		${MAME_DIR}/src/devices/machine/gen_fifo.h
	)
endif()

###################################################
##
##@src/devices/machine/output_latch.h,MACHINES["OUTPUT_LATCH"] = true
###################################################

if("OUTPUT_LATCH" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/output_latch.cpp
		${MAME_DIR}/src/devices/machine/output_latch.h
	)
endif()

###################################################
##
##@src/devices/machine/z80daisy.h,MACHINES["Z80DAISY"] = true
###################################################

if("Z80DAISY" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/z80daisy.cpp
		${MAME_DIR}/src/devices/machine/z80daisy.h
		${MAME_DIR}/src/devices/machine/z80daisy_generic.cpp
		${MAME_DIR}/src/devices/machine/z80daisy_generic.h
	)
endif()

###################################################
##
##@src/devices/machine/i8291a.h,MACHINES["I8291A"] = true
###################################################

if("I8291A" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i8291a.cpp
		${MAME_DIR}/src/devices/machine/i8291a.h
	)
endif()

###################################################
##
##@src/devices/machine/ps2dma.h,MACHINES["PS2DMAC"] = true
###################################################

if("PS2DMAC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ps2dma.cpp
		${MAME_DIR}/src/devices/machine/ps2dma.h
	)
endif()

###################################################
##
##@src/devices/machine/ps2intc.h,MACHINES["PS2INTC"] = true
###################################################

if("PS2INTC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ps2intc.cpp
		${MAME_DIR}/src/devices/machine/ps2intc.h
	)
endif()

###################################################
##
##@src/devices/machine/ps2mc.h,MACHINES["PS2MC"] = true
###################################################

if("PS2MC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ps2mc.cpp
		${MAME_DIR}/src/devices/machine/ps2mc.h
	)
endif()

###################################################
##
##@src/devices/machine/ps2pad.h,MACHINES["PS2PAD"] = true
###################################################

if("PS2PAD" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ps2pad.cpp
		${MAME_DIR}/src/devices/machine/ps2pad.h
	)
endif()

###################################################
##
##@src/devices/machine/ps2sif.h,MACHINES["PS2SIF"] = true
###################################################

if("PS2SIF" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ps2sif.cpp
		${MAME_DIR}/src/devices/machine/ps2sif.h
	)
endif()

###################################################
##
##@src/devices/machine/ps2timer.h,MACHINES["PS2TIMER"] = true
###################################################

if("PS2TIMER" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ps2timer.cpp
		${MAME_DIR}/src/devices/machine/ps2timer.h
	)
endif()

###################################################
##
##@src/devices/machine/iopcdvd.h,MACHINES["IOPCDVD"] = true
###################################################

if("IOPCDVD" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/iopcdvd.cpp
		${MAME_DIR}/src/devices/machine/iopcdvd.h
	)
endif()

###################################################
##
##@src/devices/machine/iopdma.h,MACHINES["IOPDMA"] = true
###################################################

if("IOPDMA" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/iopdma.cpp
		${MAME_DIR}/src/devices/machine/iopdma.h
	)
endif()

###################################################
##
##@src/devices/machine/iopintc.h,MACHINES["IOPINTC"] = true
###################################################

if("IOPINTC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/iopintc.cpp
		${MAME_DIR}/src/devices/machine/iopintc.h
	)
endif()

###################################################
##
##@src/devices/machine/iopsio2.h,MACHINES["IOPSIO2"] = true
###################################################

if("IOPSIO2" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/iopsio2.cpp
		${MAME_DIR}/src/devices/machine/iopsio2.h
	)
endif()

###################################################
##
##@src/devices/machine/ioptimer.h,MACHINES["IOPTIMER"] = true
###################################################

if("IOPTIMER" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ioptimer.cpp
		${MAME_DIR}/src/devices/machine/ioptimer.h
	)
endif()

###################################################
##
##@src/devices/machine/sun4c_mmu.h,MACHINES["SUN4C_MMU"] = true
###################################################

if("SUN4C_MMU" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/sun4c_mmu.cpp
		${MAME_DIR}/src/devices/machine/sun4c_mmu.h
	)
endif()

###################################################
##
##@src/devices/machine/z8038.h,MACHINES["Z8038"] = true
###################################################

if("Z8038" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/z8038.cpp
		${MAME_DIR}/src/devices/machine/z8038.h
	)
endif()

###################################################
##
##@src/devices/machine/scc2698b.h,MACHINES["SCC2698B"] = true
###################################################

if("SCC2698B" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/scc2698b.cpp
		${MAME_DIR}/src/devices/machine/scc2698b.h
	)
endif()

###################################################
##
##@src/devices/machine/aic565.h,MACHINES["AIC565"] = true
###################################################

if("AIC565" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/aic565.cpp
		${MAME_DIR}/src/devices/machine/aic565.h
	)
endif()

###################################################
##
##@src/devices/machine/aic580.h,MACHINES["AIC580"] = true
###################################################

if("AIC580" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/aic580.cpp
		${MAME_DIR}/src/devices/machine/aic580.h
	)
endif()

###################################################
##
##@src/devices/machine/aic6250.h,MACHINES["AIC6250"] = true
###################################################

if("AIC6250" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/aic6250.cpp
		${MAME_DIR}/src/devices/machine/aic6250.h
	)
endif()

###################################################
##
##@src/devices/machine/dc7085.h,MACHINES["DC7085"] = true
###################################################

if("DC7085" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/dc7085.cpp
		${MAME_DIR}/src/devices/machine/dc7085.h
	)
endif()

###################################################
##
##@src/devices/machine/i82357.h,MACHINES["I82357"] = true
###################################################

if("I82357" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i82357.cpp
		${MAME_DIR}/src/devices/machine/i82357.h
	)
endif()

###################################################
##
##@src/devices/machine/xc1700e.h,MACHINES["XC1700E"] = true
###################################################

if("XC1700E" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/xc1700e.cpp
		${MAME_DIR}/src/devices/machine/xc1700e.h
	)
endif()

###################################################
##
##@src/devices/machine/edlc.h,MACHINES["EDLC"] = true
###################################################

if("EDLC" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/edlc.cpp
		${MAME_DIR}/src/devices/machine/edlc.h
	)
endif()

###################################################
##
##@src/devices/machine/wtl3132.h,MACHINES["WTL3132"] = true
###################################################

if("WTL3132" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/wtl3132.cpp
		${MAME_DIR}/src/devices/machine/wtl3132.h
	)
endif()

###################################################
##
##@src/devices/machine/vrender0,MACHINES["VRENDER0"] = true
###################################################

if("VRENDER0" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/vrender0.cpp
		${MAME_DIR}/src/devices/machine/vr0uart.cpp
		${MAME_DIR}/src/devices/machine/vrender0.h
	)
endif()

###################################################
##
##@src/devices/machine/i3001.h,MACHINES["I3001"] = true
###################################################

if("I3001" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i3001.cpp
		${MAME_DIR}/src/devices/machine/i3001.h
	)
endif()

###################################################
##
##@src/devices/machine/i3002.h,MACHINES["I3002"] = true
###################################################

if("I3002" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/i3002.cpp
		${MAME_DIR}/src/devices/machine/i3002.h
	)
endif()

###################################################
##
##@src/devices/machine/s_smp.h,MACHINES["S_SMP"] = true
###################################################

if("S_SMP" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/s_smp.cpp
		${MAME_DIR}/src/devices/machine/s_smp.h
	)
endif()

###################################################
##
##@src/devices/machine/cxd1185.h,MACHINES["CXD1185"] = true
###################################################

if("CXD1185" IN_LIST MACHINES)
	list(APPEND MACHINES "NSCSI")
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/cxd1185.cpp
		${MAME_DIR}/src/devices/machine/cxd1185.h
	)
endif()

###################################################
##
##@src/devices/machine/applefdintf.h,MACHINES["APPLE_FDINTF"] = true
###################################################
if("APPLE_FDINTF" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/applefdintf.cpp
		${MAME_DIR}/src/devices/machine/applefdintf.h
	)
endif()

###################################################
##
##@src/devices/machine/iwm.h,MACHINES["IWM"] = true
###################################################
if("IWM" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/iwm.cpp
		${MAME_DIR}/src/devices/machine/iwm.h
	)
endif()

###################################################
##
##@src/devices/machine/swim1.h,MACHINES["SWIM1"] = true
###################################################
if("SWIM1" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/swim1.cpp
		${MAME_DIR}/src/devices/machine/swim1.h
	)
endif()

###################################################
##
##@src/devices/machine/swim2.h,MACHINES["SWIM2"] = true
###################################################
if("SWIM2" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/swim2.cpp
		${MAME_DIR}/src/devices/machine/swim2.h
	)
endif()

###################################################
##
##@src/devices/machine/swim3.h,MACHINES["SWIM3"] = true
###################################################
if("SWIM3" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/swim3.cpp
		${MAME_DIR}/src/devices/machine/swim3.h
	)
endif()

###################################################
##
##@src/devices/machine/mv_sonora.h,MACHINES["MAC_VIDEO_SONORA"] = true
###################################################
if("MAC_VIDEO_SONORA" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/mv_sonora.cpp
		${MAME_DIR}/src/devices/machine/mv_sonora.h
	)
endif()

###################################################
##
##@src/devices/machine/alpha_8921.h,MACHINES["ALPHA_8921"] = true
###################################################
if("ALPHA_8921" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/alpha_8921.cpp
		${MAME_DIR}/src/devices/machine/alpha_8921.h
	)
endif()

###################################################
##
##@src/devices/machine/bl_handhelds_menucontrol.h,MACHINES["BL_HANDHELDS_MENUCONTROL"] = true
###################################################
if("BL_HANDHELDS_MENUCONTROL" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/bl_handhelds_menucontrol.cpp
		${MAME_DIR}/src/devices/machine/bl_handhelds_menucontrol.h
	)
endif()

###################################################
##
##@src/devices/machine/ns32081.h,MACHINES["NS32081"] = true
###################################################
if("NS32081" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ns32081.cpp
		${MAME_DIR}/src/devices/machine/ns32081.h
	)
endif()

###################################################
##
##@src/devices/machine/ns32202.h,MACHINES["NS32202"] = true
###################################################
if("NS32202" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ns32202.cpp
		${MAME_DIR}/src/devices/machine/ns32202.h
	)
endif()

###################################################
##
##@src/devices/machine/ns32082.h,MACHINES["NS32082"] = true
###################################################
if("NS32082" IN_LIST MACHINES)
	list(APPEND MACHINE_SRCS
		${MAME_DIR}/src/devices/machine/ns32082.cpp
		${MAME_DIR}/src/devices/machine/ns32082.h
	)
endif()
