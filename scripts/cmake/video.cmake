## license:BSD-3-Clause
## copyright-holders:MAMEdev Team

###########################################################################
##
##   video.lua
##
##   Rules for building video cores
##
###########################################################################

set(VIDEO_SRCS
	${MAME_DIR}/src/devices/video/poly.h
	${MAME_DIR}/src/devices/video/sprite.cpp
	${MAME_DIR}/src/devices/video/sprite.h
	${MAME_DIR}/src/devices/video/vector.cpp
	${MAME_DIR}/src/devices/video/vector.h
)

##################################################
##
##@src/devices/video/315_5124.h,VIDEOS["SEGA315_5124"] = true
##################################################

if("SEGA315_5124" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/315_5124.cpp
		${MAME_DIR}/src/devices/video/315_5124.h
	)
endif()

##################################################
##
##@src/devices/video/315_5313.h,VIDEOS["SEGA315_5313"] = true
##################################################

if("SEGA315_5313" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/315_5313.cpp
		${MAME_DIR}/src/devices/video/315_5313.h
	)
endif()

##################################################
##
##@src/devices/video/am8052.h,VIDEOS["AM8052"] = true
##################################################

if("AM8052" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/am8052.cpp
		${MAME_DIR}/src/devices/video/am8052.h
	)
endif()

##################################################
##
##@src/devices/video/bufsprite.h,VIDEOS["BUFSPRITE"] = true
##################################################

if("BUFSPRITE" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/bufsprite.cpp
		${MAME_DIR}/src/devices/video/bufsprite.h
	)
endif()

##################################################
##
##@src/devices/video/cdp1861.h,VIDEOS["CDP1861"] = true
##################################################

if("CDP1861" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/cdp1861.cpp
		${MAME_DIR}/src/devices/video/cdp1861.h
	)
endif()

##################################################
##
##@src/devices/video/cdp1862.h,VIDEOS["CDP1862"] = true
##################################################

if("CDP1862" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/cdp1862.cpp
		${MAME_DIR}/src/devices/video/cdp1862.h
	)
endif()

##################################################
##
##@src/devices/video/cesblit.h,VIDEOS["CESBLIT"] = true
##################################################

if("CESBLIT" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/cesblit.cpp
		${MAME_DIR}/src/devices/video/cesblit.h
	)
endif()

##################################################
##
##@src/devices/video/crt9007.h,VIDEOS["CRT9007"] = true
##################################################

if("CRT9007" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/crt9007.cpp
		${MAME_DIR}/src/devices/video/crt9007.h
	)
endif()

##################################################
##
##@src/devices/video/crt9021.h,VIDEOS["CRT9021"] = true
##################################################

if("CRT9021" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/crt9021.cpp
		${MAME_DIR}/src/devices/video/crt9021.h
	)
endif()

##################################################
##
##@src/devices/video/crt9028.h,VIDEOS["CRT9028"] = true
##################################################

if("CRT9028" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/crt9028.cpp
		${MAME_DIR}/src/devices/video/crt9028.h
	)
endif()

##################################################
##
##@src/devices/video/crt9212.h,VIDEOS["CRT9212"] = true
##################################################

if("CRT9212" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/crt9212.cpp
		${MAME_DIR}/src/devices/video/crt9212.h
	)
endif()

##################################################
##
##@src/devices/video/dl1416.h,VIDEOS["DL1416"] = true
##################################################

if("DL1416" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/dl1416.cpp
		${MAME_DIR}/src/devices/video/dl1416.h
	)
endif()

##################################################
##
##@src/devices/video/dm9368.h,VIDEOS["DM9368"] = true
##################################################

if("DM9368" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/dm9368.cpp
		${MAME_DIR}/src/devices/video/dm9368.h
	)
endif()

##################################################
##
##@src/devices/video/dp8350.h,VIDEOS["DP8350"] = true
##################################################

if("DP8350" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/dp8350.cpp
		${MAME_DIR}/src/devices/video/dp8350.h
	)
endif()

##################################################
##
##@src/devices/video/ef9340_1.h,VIDEOS["EF9340_1"] = true
##################################################

if("EF9340_1" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/ef9340_1.cpp
		${MAME_DIR}/src/devices/video/ef9340_1.h
	)
endif()

##################################################
##
##@src/devices/video/ef9345.h,VIDEOS["EF9345"] = true
##################################################

if("EF9345" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/ef9345.cpp
		${MAME_DIR}/src/devices/video/ef9345.h
	)
endif()

##################################################
##
##@src/devices/video/ef9364.h,VIDEOS["EF9364"] = true
##################################################

if("EF9364" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/ef9364.cpp
		${MAME_DIR}/src/devices/video/ef9364.h
	)
endif()

##################################################
##
##@src/devices/video/ef9365.h,VIDEOS["EF9365"] = true
##################################################

if("EF9365" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/ef9365.cpp
		${MAME_DIR}/src/devices/video/ef9365.h
	)
endif()

##################################################
##@src/devices/video/epic12.h,VIDEOS["EPIC12"] = true
##################################################

if("EPIC12" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/epic12.cpp
		${MAME_DIR}/src/devices/video/epic12.h
		${MAME_DIR}/src/devices/video/epic12_blit0.cpp
		${MAME_DIR}/src/devices/video/epic12_blit1.cpp
		${MAME_DIR}/src/devices/video/epic12_blit2.cpp
		${MAME_DIR}/src/devices/video/epic12_blit3.cpp
		${MAME_DIR}/src/devices/video/epic12_blit4.cpp
		${MAME_DIR}/src/devices/video/epic12_blit5.cpp
		${MAME_DIR}/src/devices/video/epic12_blit6.cpp
		${MAME_DIR}/src/devices/video/epic12_blit7.cpp
		${MAME_DIR}/src/devices/video/epic12_blit8.cpp
		${MAME_DIR}/src/devices/video/epic12in.hxx
		${MAME_DIR}/src/devices/video/epic12pixel.hxx
	)
endif()

##################################################
##
##@src/devices/video/fixfreq.h,VIDEOS["FIXFREQ"] = true
##################################################

if("FIXFREQ" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/fixfreq.cpp
		${MAME_DIR}/src/devices/video/fixfreq.h
	)
endif()

##################################################
##
##@src/devices/video/gf4500.h,VIDEOS["GF4500"] = true
##################################################

if("GF4500" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/gf4500.cpp
		${MAME_DIR}/src/devices/video/gf4500.h
	)
endif()

##################################################
##
##@src/devices/video/gf7600gs.h,VIDEOS["GF7600GS"] = true
##################################################

if("GF7600GS" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/gf7600gs.cpp
		${MAME_DIR}/src/devices/video/gf7600gs.h
	)
endif()

##################################################
##
##@src/devices/video/mga2064w.h,VIDEOS["MGA2064W"] = true
##################################################

if("MGA2064W" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/mga2064w.cpp
		${MAME_DIR}/src/devices/video/mga2064w.h
	)
endif()

##################################################
##
##@src/devices/video/nt7534.h,VIDEOS["NT7534"] = true
##################################################

if("NT7534" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/nt7534.cpp
		${MAME_DIR}/src/devices/video/nt7534.h
	)
endif()

##################################################
##
##@src/devices/video/hd44102.h,VIDEOS["HD44102"] = true
##################################################

if("HD44102" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/hd44102.cpp
		${MAME_DIR}/src/devices/video/hd44102.h
	)
endif()

##################################################
##
##@src/devices/video/hd44352.h,VIDEOS["HD44352"] = true
##################################################

if("HD44352" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/hd44352.cpp
		${MAME_DIR}/src/devices/video/hd44352.h
	)
endif()

##################################################
##
##@src/devices/video/hd44780.h,VIDEOS["HD44780"] = true
##################################################

if("HD44780" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/hd44780.cpp
		${MAME_DIR}/src/devices/video/hd44780.h
	)
endif()

##################################################
##
##@src/devices/video/hd61202.h,VIDEOS["HD61202"] = true
##################################################

if("HD61202" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/hd61202.cpp
		${MAME_DIR}/src/devices/video/hd61202.h
	)
endif()

##################################################
##
##@src/devices/video/hd61603.h,VIDEOS["HD61603"] = true
##################################################

if("HD61603" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/hd61603.cpp
		${MAME_DIR}/src/devices/video/hd61603.h
	)
endif()

##################################################
##
##@src/devices/video/hd61830.h,VIDEOS["HD61830"] = true
##################################################

if("HD61830" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/hd61830.cpp
		${MAME_DIR}/src/devices/video/hd61830.h
	)
endif()

##################################################
##
##@src/devices/video/hd63484.h,VIDEOS["HD63484"] = true
##################################################

if("HD63484" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/hd63484.cpp
		${MAME_DIR}/src/devices/video/hd63484.h
	)
endif()

##################################################
##
##@src/devices/video/hd66421.h,VIDEOS["HD66421"] = true
##################################################

if("HD66421" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/hd66421.cpp
		${MAME_DIR}/src/devices/video/hd66421.h
	)
endif()

##################################################
##
##@src/devices/video/hlcd0438.h,VIDEOS["HLCD0438"] = true
##################################################

if("HLCD0438" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/hlcd0438.cpp
		${MAME_DIR}/src/devices/video/hlcd0438.h
	)
endif()

##################################################
##
##@src/devices/video/hlcd0488.h,VIDEOS["HLCD0488"] = true
##################################################

if("HLCD0488" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/hlcd0488.cpp
		${MAME_DIR}/src/devices/video/hlcd0488.h
	)
endif()

##################################################
##
##@src/devices/video/hlcd0515.h,VIDEOS["HLCD0515"] = true
##################################################

if("HLCD0515" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/hlcd0515.cpp
		${MAME_DIR}/src/devices/video/hlcd0515.h
	)
endif()

##################################################
##
##@src/devices/video/hlcd0538.h,VIDEOS["HLCD0538"] = true
##################################################

if("HLCD0538" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/hlcd0538.cpp
		${MAME_DIR}/src/devices/video/hlcd0538.h
	)
endif()

##################################################
##
##@src/devices/video/hp1ll3.h,VIDEOS["HP1LL3"] = true
##################################################

if("HP1LL3" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/hp1ll3.cpp
		${MAME_DIR}/src/devices/video/hp1ll3.h
	)
endif()

##################################################
##
##@src/devices/video/huc6202.h,VIDEOS["HUC6202"] = true
##################################################

if("HUC6202" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/huc6202.cpp
		${MAME_DIR}/src/devices/video/huc6202.h
	)
endif()

##################################################
##
##@src/devices/video/huc6260.h,VIDEOS["HUC6260"] = true
##################################################

if("HUC6260" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/huc6260.cpp
		${MAME_DIR}/src/devices/video/huc6260.h
	)
endif()

##################################################
##
##@src/devices/video/huc6261.h,VIDEOS["HUC6261"] = true
##################################################

if("HUC6261" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/huc6261.cpp
		${MAME_DIR}/src/devices/video/huc6261.h
	)
endif()

##################################################
##
##@src/devices/video/huc6270.h,VIDEOS["HUC6270"] = true
##################################################

if("HUC6270" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/huc6270.cpp
		${MAME_DIR}/src/devices/video/huc6270.h
	)
endif()

##################################################
##
##@src/devices/video/huc6271.h,VIDEOS["HUC6271"] = true
##################################################

if("HUC6271" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/huc6271.cpp
		${MAME_DIR}/src/devices/video/huc6271.h
	)
endif()

##################################################
##
##@src/devices/video/huc6272.h,VIDEOS["HUC6272"] = true
##################################################

if("HUC6272" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/huc6272.cpp
		${MAME_DIR}/src/devices/video/huc6272.h
	)
endif()

##################################################
##
##@src/devices/video/i8244.h,VIDEOS["I8244"] = true
##################################################

if("I8244" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/i8244.cpp
		${MAME_DIR}/src/devices/video/i8244.h
	)
endif()

##################################################
##
##@src/devices/video/i82730.h,VIDEOS["I82730"] = true
##################################################

if("I82730" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/i82730.cpp
		${MAME_DIR}/src/devices/video/i82730.h
	)
endif()

##################################################
##
##@src/devices/video/i8275.h,VIDEOS["I8275"] = true
##################################################

if("I8275" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/i8275.cpp
		${MAME_DIR}/src/devices/video/i8275.h
	)
endif()

##################################################
##
##@src/devices/video/ims_cvc.h,VIDEOS["IMS_CVC"] = true
##################################################

if("IMS_CVC" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/ims_cvc.cpp
		${MAME_DIR}/src/devices/video/ims_cvc.h
	)
endif()

##################################################
##
##@src/devices/video/lc7582.h,VIDEOS["LC7582"] = true
##################################################

if("LC7582" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/lc7582.cpp
		${MAME_DIR}/src/devices/video/lc7582.h
	)
endif()

##################################################
##
##@src/devices/video/lc7985.h,VIDEOS["LC7985"] = true
##################################################

if("LC7985" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/lc7985.cpp
		${MAME_DIR}/src/devices/video/lc7985.h
	)
endif()

##################################################
##
##@src/devices/video/m50458.h,VIDEOS["M50458"] = true
##################################################

if("M50458" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/m50458.cpp
		${MAME_DIR}/src/devices/video/m50458.h
	)
endif()

###################################################
##
##@src/devices/video/mb88303.h,VIDEOS["MB88303"] = true
###################################################

if("MB88303" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/mb88303.cpp
		${MAME_DIR}/src/devices/video/mb88303.h
	)
endif()

##################################################
##
##@src/devices/video/mb90082.h,VIDEOS["MB90082"] = true
##################################################

if("MB90082" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/mb90082.cpp
		${MAME_DIR}/src/devices/video/mb90082.h
	)
endif()

##################################################
##
##@src/devices/video/mb_vcu.h,VIDEOS["MB_VCU"] = true
##################################################

if("MB_VCU" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/mb_vcu.cpp
		${MAME_DIR}/src/devices/video/mb_vcu.h
	)
endif()

##################################################
##
##@src/devices/video/mc6845.h,VIDEOS["MC6845"] = true
##################################################

if("MC6845" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/mc6845.cpp
		${MAME_DIR}/src/devices/video/mc6845.h
	)
endif()

##################################################
##
##@src/devices/video/mc6847.h,VIDEOS["MC6847"] = true
##################################################

if("MC6847" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/mc6847.cpp
		${MAME_DIR}/src/devices/video/mc6847.h
	)
endif()

##################################################
##
##@src/devices/video/md4330b.h,VIDEOS["MD4330B"] = true
##################################################

if("MD4330B" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/md4330b.cpp
		${MAME_DIR}/src/devices/video/md4330b.h
	)
endif()

##################################################
##
##@src/devices/video/mm5445.h,VIDEOS["MM5445"] = true
##################################################

if("MM5445" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/mm5445.cpp
		${MAME_DIR}/src/devices/video/mm5445.h
	)
endif()

##################################################
##
##@src/devices/video/msm6222b.h,VIDEOS["MSM6222B"] = true
##################################################

if("MSM6222B" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/msm6222b.cpp
		${MAME_DIR}/src/devices/video/msm6222b.h
	)
endif()

##################################################
##
##@src/devices/video/msm6255.h,VIDEOS["MSM6255"] = true
##################################################

if("MSM6255" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/msm6255.cpp
		${MAME_DIR}/src/devices/video/msm6255.h
	)
endif()

##################################################
##
##@src/devices/video/mos6566.h,VIDEOS["MOS6566"] = true
##################################################

if("MOS6566" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/mos6566.cpp
		${MAME_DIR}/src/devices/video/mos6566.h
	)
endif()


list(APPEND VIDEO_SRCS
	${MAME_DIR}/src/devices/video/cgapal.cpp
	${MAME_DIR}/src/devices/video/cgapal.h
)

##################################################
##
##@src/devices/video/pc_vga.h,VIDEOS["PC_VGA"] = true
##################################################

if("PC_VGA" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/pc_vga.cpp
		${MAME_DIR}/src/devices/video/pc_vga.h
		${MAME_DIR}/src/devices/bus/isa/trident.cpp
		${MAME_DIR}/src/devices/bus/isa/trident.h
		${MAME_DIR}/src/devices/video/clgd542x.cpp
		${MAME_DIR}/src/devices/video/clgd542x.h
	)
endif()

##################################################
##
##@src/devices/video/virge_pci.h,VIDEOS["VIRGE_PCI"] = true
##################################################

if("VIRGE_PCI" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/virge_pci.cpp
		${MAME_DIR}/src/devices/video/virge_pci.h
	)
endif()

##################################################
##
##@src/devices/video/pcd8544.h,VIDEOS["PCD8544"] = true
##################################################

if("PCD8544" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/pcd8544.cpp
		${MAME_DIR}/src/devices/video/pcd8544.h
	)
endif()

##################################################
##
##@src/devices/video/pcf2100.h,VIDEOS["PCF2100"] = true
##################################################

if("PCF2100" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/pcf2100.cpp
		${MAME_DIR}/src/devices/video/pcf2100.h
	)
endif()

##################################################
##
##@src/devices/video/polylgcy.h,VIDEOS["POLY"] = true
##################################################

if("POLY" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/polylgcy.cpp
		${MAME_DIR}/src/devices/video/polylgcy.h
	)
endif()

##################################################
##
##@src/devices/video/psx.h,VIDEOS["PSX"] = true
##################################################

if("PSX" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/psx.cpp
		${MAME_DIR}/src/devices/video/psx.h
	)
endif()

##################################################
##
##@src/devices/video/ramdac.h,VIDEOS["RAMDAC"] = true
##################################################

if("RAMDAC" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/ramdac.cpp
		${MAME_DIR}/src/devices/video/ramdac.h
	)
endif()

##################################################
##
##@src/devices/video/saa5050.h,VIDEOS["SAA5050"] = true
##################################################

if("SAA5050" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/saa5050.cpp
		${MAME_DIR}/src/devices/video/saa5050.h
	)
endif()

##################################################
##
##@src/devices/video/saa5240.h,VIDEOS["SAA5240"] = true
##################################################

if("SAA5240" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/saa5240.cpp
		${MAME_DIR}/src/devices/video/saa5240.h
	)
endif()

##################################################
##
##@src/devices/video/pwm.h,VIDEOS["PWM_DISPLAY"] = true
##################################################
if("PWM_DISPLAY" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/pwm.cpp
		${MAME_DIR}/src/devices/video/pwm.h
	)
endif()

##################################################
##
##@src/devices/video/sed1200.h,VIDEOS["SED1200"] = true
##################################################
if("SED1200" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/sed1200.cpp
		${MAME_DIR}/src/devices/video/sed1200.h
	)
endif()

##################################################
##
##@src/devices/video/sed1330.h,VIDEOS["SED1330"] = true
##################################################
if("SED1330" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/sed1330.cpp
		${MAME_DIR}/src/devices/video/sed1330.h
	)
endif()

##################################################
##
##@src/devices/video/sed1356.h,VIDEOS["SED1356"] = true
##################################################
if("SED1356" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/sed1356.cpp
		${MAME_DIR}/src/devices/video/sed1356.h
	)
endif()

##################################################
##
##@src/devices/video/sed1500.h,VIDEOS["SED1500"] = true
##################################################
if("SED1500" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/sed1500.cpp
		${MAME_DIR}/src/devices/video/sed1500.h
	)
endif()

##################################################
##
##@src/devices/video/sed1520.h,VIDEOS["SED1520"] = true
##################################################
if("SED1520" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/sed1520.cpp
		${MAME_DIR}/src/devices/video/sed1520.h
	)
endif()

##################################################
##
##@src/devices/video/scn2674.h,VIDEOS["SCN2674"] = true
##################################################
if("SCN2674" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/scn2674.cpp
		${MAME_DIR}/src/devices/video/scn2674.h
	)
endif()

##################################################
##
##@src/devices/video/sda5708.h,VIDEOS["SDA5708"] = true
##################################################
if("SDA5708" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/sda5708.cpp
		${MAME_DIR}/src/devices/video/sda5708.h
	)
endif()

##################################################
##
##@src/devices/video/snes_ppu.h,VIDEOS["SNES_PPU"] = true
##################################################
if("SNES_PPU" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/snes_ppu.cpp
		${MAME_DIR}/src/devices/video/snes_ppu.h
	)
endif()

##################################################
##
##@src/devices/video/stvvdp1.h,VIDEOS["STVVDP"] = true
##@src/devices/video/stvvdp2.h,VIDEOS["STVVDP"] = true
##################################################

if("STVVDP" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/stvvdp1.cpp
		${MAME_DIR}/src/devices/video/stvvdp1.h
		${MAME_DIR}/src/devices/video/stvvdp2.cpp
		${MAME_DIR}/src/devices/video/stvvdp2.h
	)
endif()

##################################################
##
##@src/devices/video/t6963c.h,VIDEOS["T6963C"] = true
##################################################

if("T6963C" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/t6963c.cpp
		${MAME_DIR}/src/devices/video/t6963c.h
	)
endif()

##################################################
##
##@src/devices/video/t6a04.h,VIDEOS["T6A04"] = true
##################################################

if("T6A04" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/t6a04.cpp
		${MAME_DIR}/src/devices/video/t6a04.h
	)
endif()

##################################################
##
##@src/devices/video/tea1002.h,VIDEOS["TEA1002"] = true
##################################################

if("TEA1002" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/tea1002.cpp
		${MAME_DIR}/src/devices/video/tea1002.h
	)
endif()

##################################################
##
##@src/devices/video/tlc34076.h,VIDEOS["TLC34076"] = true
##################################################

if("TLC34076" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/tlc34076.cpp
		${MAME_DIR}/src/devices/video/tlc34076.h
	)
endif()

##################################################
##
##@src/devices/video/tms34061.h,VIDEOS["TMS34061"] = true
##################################################

if("TMS34061" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/tms34061.cpp
		${MAME_DIR}/src/devices/video/tms34061.h
	)
endif()

##################################################
##
##@src/devices/video/tms3556.h,VIDEOS["TMS3556"] = true
##################################################

if("TMS3556" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/tms3556.cpp
		${MAME_DIR}/src/devices/video/tms3556.h
	)
endif()

##################################################
##
##@src/devices/video/tms9927.h,VIDEOS["TMS9927"] = true
##################################################

if("TMS9927" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/tms9927.cpp
		${MAME_DIR}/src/devices/video/tms9927.h
	)
endif()

##################################################
##
##@src/devices/video/tms9928a.h,VIDEOS["TMS9928A"] = true
##################################################

if("TMS9928A" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/tms9928a.cpp
		${MAME_DIR}/src/devices/video/tms9928a.h
	)
endif()

##################################################
##
##@src/devices/video/upd3301.h,VIDEOS["UPD3301"] = true
##################################################

if("UPD3301" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/upd3301.cpp
		${MAME_DIR}/src/devices/video/upd3301.h
	)
endif()

##################################################
##
##@src/devices/video/upd7220.h,VIDEOS["UPD7220"] = true
##################################################

if("UPD7220" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/upd7220.cpp
		${MAME_DIR}/src/devices/video/upd7220.h
	)
endif()

##################################################
##
##@src/devices/video/upd7227.h,VIDEOS["UPD7227"] = true
##################################################

if("UPD7227" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/upd7227.cpp
		${MAME_DIR}/src/devices/video/upd7227.h
	)
endif()

##################################################
##
##@src/devices/video/vic4567.h,VIDEOS["VIC4567"] = true
##################################################

if("VIC4567" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/vic4567.cpp
		${MAME_DIR}/src/devices/video/vic4567.h
	)
endif()

##################################################
##
##@src/devices/video/v9938.h,VIDEOS["V9938"] = true
##################################################

if("V9938" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/v9938.cpp
		${MAME_DIR}/src/devices/video/v9938.h
	)
endif()

##################################################
##
##@src/devices/video/zeus2.h,VIDEOS["ZEUS2"] = true
##################################################

if("ZEUS2" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/zeus2.cpp
		${MAME_DIR}/src/devices/video/zeus2.h
	)
endif()

##################################################
##
##@src/devices/video/voodoo.h,VIDEOS["VOODOO"] = true
##################################################

if("VOODOO" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/voodoo.cpp
		${MAME_DIR}/src/devices/video/voodoo.h
		${MAME_DIR}/src/devices/video/vooddefs.ipp
		${MAME_DIR}/src/devices/video/voodoo_rast.ipp
	)
endif()

##################################################
##
##@src/devices/video/voodoo_pci.h,VIDEOS["VOODOO_PCI"] = true
##################################################

if("VOODOO_PCI" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/voodoo_pci.cpp
		${MAME_DIR}/src/devices/video/voodoo_pci.h
	)
endif()

##################################################
##
##@src/devices/video/crtc_ega.h,VIDEOS["CRTC_EGA"] = true
##################################################

if("CRTC_EGA" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/crtc_ega.cpp
		${MAME_DIR}/src/devices/video/crtc_ega.h
	)
endif()

##################################################
##
##@src/devices/video/jangou_blitter.h,VIDEOS["JANGOU_BLITTER"] = true
##################################################

if("JANGOU_BLITTER" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/jangou_blitter.cpp
		${MAME_DIR}/src/devices/video/jangou_blitter.h
	)
endif()

##################################################
##
##@src/devices/video/gb_lcd.h,VIDEOS["GB_LCD"] = true
##################################################

if("GB_LCD" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/gb_lcd.cpp
		${MAME_DIR}/src/devices/video/gb_lcd.h
	)
endif()

##################################################
##
##@src/devices/video/gba_lcd.h,VIDEOS["GBA_LCD"] = true
##################################################

if("GBA_LCD" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/gba_lcd.cpp
		${MAME_DIR}/src/devices/video/gba_lcd.h
	)
endif()

##################################################
##
##@src/devices/video/ef9369.h,VIDEOS["EF9369"] = true
##################################################

if("EF9369" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/ef9369.cpp
		${MAME_DIR}/src/devices/video/ef9369.h
	)
endif()

##################################################
##
##@src/devices/video/ppu2c0x.h,VIDEOS["PPU2C0X"] = true
##################################################

if("PPU2C0X" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/ppu2c0x.cpp
		${MAME_DIR}/src/devices/video/ppu2c0x.h
		${MAME_DIR}/src/devices/video/ppu2c0x_vt.cpp
		${MAME_DIR}/src/devices/video/ppu2c0x_vt.h
		${MAME_DIR}/src/devices/video/ppu2c0x_sh6578.cpp
		${MAME_DIR}/src/devices/video/ppu2c0x_sh6578.h
	)
endif()

##################################################
##
##@src/devices/video/bt459.h,VIDEOS["BT459"] = true
##################################################

if("BT459" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/bt459.cpp
		${MAME_DIR}/src/devices/video/bt459.h
	)
endif()

##################################################
##
##@src/devices/video/imagetek_i4100.h,VIDEOS["I4100"] = true
##################################################

if("I4100" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/imagetek_i4100.cpp
		${MAME_DIR}/src/devices/video/imagetek_i4100.h
	)
endif()

##################################################
##
##@src/devices/video/dp8510.h,VIDEOS["DP8510"] = true
##################################################

if("DP8510" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/dp8510.cpp
		${MAME_DIR}/src/devices/video/dp8510.h
	)
endif()

##################################################
##
##@src/devices/video/bt45x.h,VIDEOS["BT45X"] = true
##################################################

if("BT45X" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/bt45x.cpp
		${MAME_DIR}/src/devices/video/bt45x.h
	)
endif()

##################################################
##
##@src/devices/video/topcat.h,VIDEOS["TOPCAT"] = true
##################################################
if("TOPCAT" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/topcat.cpp
		${MAME_DIR}/src/devices/video/topcat.h
	)
endif()

##################################################
##
##@src/devices/video/catseye.h,VIDEOS["CATSEYE"] = true
##################################################
if("CATSEYE" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/catseye.cpp
		${MAME_DIR}/src/devices/video/catseye.h
	)
endif()


##################################################
##
##@src/devices/video/nereid.h,VIDEOS["NEREID"] = true
##################################################
if("NEREID" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/nereid.cpp
		${MAME_DIR}/src/devices/video/nereid.h
	)
endif()

##################################################
##
##@src/devices/video/ps2gif.h,VIDEOS["PS2GIF"] = true
##################################################
if("PS2GIF" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/ps2gif.cpp
		${MAME_DIR}/src/devices/video/ps2gif.h
	)
endif()

##################################################
##
##@src/devices/video/ps2gs.h,VIDEOS["PS2GS"] = true
##################################################
if("PS2GS" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/ps2gs.cpp
		${MAME_DIR}/src/devices/video/ps2gs.h
	)
endif()

##################################################
##
##@src/devices/video/decsfb.h,VIDEOS["DECSFB"] = true
##################################################
if("DECSFB" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/decsfb.cpp
		${MAME_DIR}/src/devices/video/decsfb.h
	)
endif()

##################################################
##
##@src/devices/video/bt47x.h,VIDEOS["BT47X"] = true
##################################################

if("BT47X" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/bt47x.cpp
		${MAME_DIR}/src/devices/video/bt47x.h
	)
endif()

##################################################
##
##@src/devices/video/bt431.h,VIDEOS["BT431"] = true
##################################################

if("BT431" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/bt431.cpp
		${MAME_DIR}/src/devices/video/bt431.h
	)
endif()

##################################################
##
##@src/devices/video/vrender0.h,VIDEOS["VRENDER0"] = true
##################################################

if("VRENDER0" IN_LIST VIDEOS)
	list(APPEND VIDEO_SRCS
		${MAME_DIR}/src/devices/video/vrender0.cpp
		${MAME_DIR}/src/devices/video/vrender0.h
	)
endif()
