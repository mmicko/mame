set(FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/all.cpp
	${MAME_DIR}/src/lib/formats/all.h

	${MAME_DIR}/src/lib/formats/ioprocs.cpp
	${MAME_DIR}/src/lib/formats/ioprocs.h
	${MAME_DIR}/src/lib/formats/imageutl.cpp
	${MAME_DIR}/src/lib/formats/imageutl.h

	${MAME_DIR}/src/lib/formats/cassimg.cpp
	${MAME_DIR}/src/lib/formats/cassimg.h
	${MAME_DIR}/src/lib/formats/wavfile.cpp
	${MAME_DIR}/src/lib/formats/wavfile.h

	${MAME_DIR}/src/lib/formats/flopimg.cpp
	${MAME_DIR}/src/lib/formats/flopimg.h

	${MAME_DIR}/src/lib/formats/cqm_dsk.cpp
	${MAME_DIR}/src/lib/formats/cqm_dsk.h
	${MAME_DIR}/src/lib/formats/dsk_dsk.cpp
	${MAME_DIR}/src/lib/formats/dsk_dsk.h
	${MAME_DIR}/src/lib/formats/ipf_dsk.cpp
	${MAME_DIR}/src/lib/formats/ipf_dsk.h
	${MAME_DIR}/src/lib/formats/td0_dsk.cpp
	${MAME_DIR}/src/lib/formats/td0_dsk.h
	${MAME_DIR}/src/lib/formats/hxchfe_dsk.cpp
	${MAME_DIR}/src/lib/formats/hxchfe_dsk.h
	${MAME_DIR}/src/lib/formats/hxcmfm_dsk.cpp
	${MAME_DIR}/src/lib/formats/hxcmfm_dsk.h
	${MAME_DIR}/src/lib/formats/mfi_dsk.cpp
	${MAME_DIR}/src/lib/formats/mfi_dsk.h
	${MAME_DIR}/src/lib/formats/imd_dsk.cpp
	${MAME_DIR}/src/lib/formats/imd_dsk.h
	${MAME_DIR}/src/lib/formats/upd765_dsk.cpp
	${MAME_DIR}/src/lib/formats/upd765_dsk.h
	${MAME_DIR}/src/lib/formats/pc_dsk.cpp
	${MAME_DIR}/src/lib/formats/pc_dsk.h
	${MAME_DIR}/src/lib/formats/d88_dsk.cpp
	${MAME_DIR}/src/lib/formats/d88_dsk.h
	${MAME_DIR}/src/lib/formats/dfi_dsk.cpp
	${MAME_DIR}/src/lib/formats/dfi_dsk.h
	${MAME_DIR}/src/lib/formats/fdi_dsk.cpp

	${MAME_DIR}/src/lib/formats/fsmgr.h
	${MAME_DIR}/src/lib/formats/fsmgr.cpp
	${MAME_DIR}/src/lib/formats/fsblk_vec.h
	${MAME_DIR}/src/lib/formats/fsblk_vec.cpp
	${MAME_DIR}/src/lib/formats/fs_unformatted.h
	${MAME_DIR}/src/lib/formats/fs_unformatted.cpp
)

##################################################
##
##@src/lib/formats/2d_dsk.h,FORMATS["2D_DSK"] = true
##################################################

if (("2D_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/2d_dsk.cpp
	${MAME_DIR}/src/lib/formats/2d_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/a26_cas.h,FORMATS["A26_CAS"] = true
##################################################

if (("A26_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/a26_cas.cpp
	${MAME_DIR}/src/lib/formats/a26_cas.h
)
endif()

##################################################
##
##@src/lib/formats/a5105_dsk.h,FORMATS["A5105_DSK"] = true
##################################################

if (("A5105_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/a5105_dsk.cpp
	${MAME_DIR}/src/lib/formats/a5105_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/abc800_dsk.h,FORMATS["ABC800_DSK"] = true
##################################################

if (("ABC800_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/abc800_dsk.cpp
	${MAME_DIR}/src/lib/formats/abc800_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/abcfd2_dsk.h,FORMATS["ABCFD2_DSK"] = true
##################################################

if (("ABCFD2_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/abcfd2_dsk.cpp
	${MAME_DIR}/src/lib/formats/abcfd2_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/ace_tap.h,FORMATS["ACE_TAP"] = true
##################################################

if (("ACE_TAP" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/ace_tap.cpp
	${MAME_DIR}/src/lib/formats/ace_tap.h
)
endif()

##################################################
##
##@src/lib/formats/acorn_dsk.h,FORMATS["ACORN_DSK"] = true
##################################################

if (("ACORN_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/acorn_dsk.cpp
	${MAME_DIR}/src/lib/formats/acorn_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/adam_cas.h,FORMATS["ADAM_CAS"] = true
##################################################

if (("ADAM_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/adam_cas.cpp
	${MAME_DIR}/src/lib/formats/adam_cas.h
)
endif()

##################################################
##
##@src/lib/formats/adam_dsk.h,FORMATS["ADAM_DSK"] = true
##################################################

if (("ADAM_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/adam_dsk.cpp
	${MAME_DIR}/src/lib/formats/adam_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/afs_dsk.h,FORMATS["AFS_DSK"] = true
##################################################

if (("AFS_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/afs_dsk.cpp
	${MAME_DIR}/src/lib/formats/afs_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/agat840k_hle_dsk.h,FORMATS["AGAT840K_HLE_DSK"] = true
##################################################

if (("AGAT840K_HLE_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/agat840k_hle_dsk.cpp
	${MAME_DIR}/src/lib/formats/agat840k_hle_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/aim_dsk.h,FORMATS["AIM_DSK"] = true
##################################################

if (("AIM_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/aim_dsk.cpp
	${MAME_DIR}/src/lib/formats/aim_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/ami_dsk.h,FORMATS["AMI_DSK"] = true
##################################################

if (("AMI_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/ami_dsk.cpp
	${MAME_DIR}/src/lib/formats/ami_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/ap2_dsk.h,FORMATS["AP2_DSK"] = true
##################################################

if (("AP2_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/ap2_dsk.cpp
	${MAME_DIR}/src/lib/formats/ap2_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/apd_dsk.h,FORMATS["APD_DSK"] = true
##################################################

if (("APD_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/apd_dsk.cpp
	${MAME_DIR}/src/lib/formats/apd_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/apf_apt.h,FORMATS["APF_APT"] = true
##################################################

if (("APF_APT" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/apf_apt.cpp
	${MAME_DIR}/src/lib/formats/apf_apt.h
)
endif()

##################################################
##
##@src/lib/formats/apollo_dsk.h,FORMATS["APOLLO_DSK"] = true
##################################################

if (("APOLLO_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/apollo_dsk.cpp
	${MAME_DIR}/src/lib/formats/apollo_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/applix_dsk.h,FORMATS["APPLIX_DSK"] = true
##################################################

if (("APPLIX_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/applix_dsk.cpp
	${MAME_DIR}/src/lib/formats/applix_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/apridisk.h,FORMATS["APRIDISK"] = true
##################################################

if (("APRIDISK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/apridisk.cpp
	${MAME_DIR}/src/lib/formats/apridisk.h
)
endif()

##################################################
##
##@src/lib/formats/ap_dsk35.h,FORMATS["AP_DSK35"] = true
##################################################

if (("AP_DSK35" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/ap_dsk35.cpp
	${MAME_DIR}/src/lib/formats/ap_dsk35.h
)
endif()

##################################################
##
##@src/lib/formats/aquarius_caq.h,FORMATS["AQUARIUS_CAQ"] = true
##################################################

if (("AQUARIUS_CAQ" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/aquarius_caq.cpp
	${MAME_DIR}/src/lib/formats/aquarius_caq.h
)
endif()

##################################################
##
##@src/lib/formats/asst128_dsk.h,FORMATS["ASST128_DSK"] = true
##################################################

if (("ASST128_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/asst128_dsk.cpp
	${MAME_DIR}/src/lib/formats/asst128_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/atari_dsk.h,FORMATS["ATARI_DSK"] = true
##################################################

if (("ATARI_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/atari_dsk.cpp
	${MAME_DIR}/src/lib/formats/atari_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/atom_dsk.h,FORMATS["ATOM_DSK"] = true
##################################################

if (("ATOM_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/atom_dsk.cpp
	${MAME_DIR}/src/lib/formats/atom_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/atom_tap.h,FORMATS["ATOM_TAP"] = true
##################################################

if (("ATOM_TAP" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/atom_tap.cpp
	${MAME_DIR}/src/lib/formats/atom_tap.h
)
endif()

##################################################
##
##@src/lib/formats/basicdsk.h,FORMATS["BASICDSK"] = true
##################################################

if (("BASICDSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/basicdsk.cpp
	${MAME_DIR}/src/lib/formats/basicdsk.h
)
endif()

##################################################
##
##@src/lib/formats/bw12_dsk.h,FORMATS["BW12_DSK"] = true
##################################################

if (("BW12_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/bw12_dsk.cpp
	${MAME_DIR}/src/lib/formats/bw12_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/bw2_dsk.h,FORMATS["BW2_DSK"] = true
##################################################

if (("BW2_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/bw2_dsk.cpp
	${MAME_DIR}/src/lib/formats/bw2_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/c3040_dsk.h,FORMATS["C3040_DSK"] = true
##################################################

if (("C3040_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/c3040_dsk.cpp
	${MAME_DIR}/src/lib/formats/c3040_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/c4040_dsk.h,FORMATS["C4040_DSK"] = true
##################################################

if (("C4040_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/c4040_dsk.cpp
	${MAME_DIR}/src/lib/formats/c4040_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/c8280_dsk.h,FORMATS["C8280_DSK"] = true
##################################################

if (("C8280_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/c8280_dsk.cpp
	${MAME_DIR}/src/lib/formats/c8280_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/camplynx_cas.h,FORMATS["CAMPLYNX_CAS"] = true
##################################################

if (("CAMPLYNX_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/camplynx_cas.cpp
	${MAME_DIR}/src/lib/formats/camplynx_cas.h
)
endif()

##################################################
##
##@src/lib/formats/camplynx_dsk.h,FORMATS["CAMPLYNX_DSK"] = true
##################################################

if (("CAMPLYNX_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/camplynx_dsk.cpp
	${MAME_DIR}/src/lib/formats/camplynx_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/cbm_crt.h,FORMATS["CBM_CRT"] = true
##################################################

if (("CBM_CRT" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/cbm_crt.cpp
	${MAME_DIR}/src/lib/formats/cbm_crt.h
)
endif()

##################################################
##
##@src/lib/formats/cbm_tap.h,FORMATS["CBM_TAP"] = true
##################################################

if (("CBM_TAP" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/cbm_tap.cpp
	${MAME_DIR}/src/lib/formats/cbm_tap.h
)
endif()

##################################################
##
##@src/lib/formats/ccvf_dsk.h,FORMATS["CCVF_DSK"] = true
##################################################

if (("CCVF_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/ccvf_dsk.cpp
	${MAME_DIR}/src/lib/formats/ccvf_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/cd90_640_dsk.h,FORMATS["CD90_640_DSK"] = true
##################################################

if (("CD90_640_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/cd90_640_dsk.cpp
	${MAME_DIR}/src/lib/formats/cd90_640_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/cgenie_dsk.h,FORMATS["CGENIE_DSK"] = true
##################################################

if (("CGENIE_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/cgenie_dsk.cpp
	${MAME_DIR}/src/lib/formats/cgenie_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/cgen_cas.h,FORMATS["CGEN_CAS"] = true
##################################################

if (("CGEN_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/cgen_cas.cpp
	${MAME_DIR}/src/lib/formats/cgen_cas.h
)
endif()

##################################################
##
##@src/lib/formats/coco_cas.h,FORMATS["COCO_CAS"] = true
##################################################

if (("COCO_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/coco_cas.cpp
	${MAME_DIR}/src/lib/formats/coco_cas.h
)
endif()

##################################################
##
##@src/lib/formats/comx35_dsk.h,FORMATS["COMX35_DSK"] = true
##################################################

if (("COMX35_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/comx35_dsk.cpp
	${MAME_DIR}/src/lib/formats/comx35_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/concept_dsk.h,FORMATS["CONCEPT_DSK"] = true
##################################################

if (("CONCEPT_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/concept_dsk.cpp
	${MAME_DIR}/src/lib/formats/concept_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/coupedsk.h,FORMATS["COUPEDSK"] = true
##################################################

if (("COUPEDSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/coupedsk.cpp
	${MAME_DIR}/src/lib/formats/coupedsk.h
)
endif()

##################################################
##
##@src/lib/formats/cpis_dsk.h,FORMATS["CPIS_DSK"] = true
##################################################

if (("CPIS_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/cpis_dsk.cpp
	${MAME_DIR}/src/lib/formats/cpis_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/csw_cas.h,FORMATS["CSW_CAS"] = true
##################################################

if (("CSW_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/csw_cas.cpp
	${MAME_DIR}/src/lib/formats/csw_cas.h
)
endif()

##################################################
##
##@src/lib/formats/d64_dsk.h,FORMATS["D64_DSK"] = true
##################################################

if (("D64_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/d64_dsk.cpp
	${MAME_DIR}/src/lib/formats/d64_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/d71_dsk.h,FORMATS["D71_DSK"] = true
##################################################

if (("D71_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/d71_dsk.cpp
	${MAME_DIR}/src/lib/formats/d71_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/d80_dsk.h,FORMATS["D80_DSK"] = true
##################################################

if (("D80_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/d80_dsk.cpp
	${MAME_DIR}/src/lib/formats/d80_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/d81_dsk.h,FORMATS["D81_DSK"] = true
##################################################

if (("D81_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/d81_dsk.cpp
	${MAME_DIR}/src/lib/formats/d81_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/d82_dsk.h,FORMATS["D82_DSK"] = true
##################################################

if (("D82_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/d82_dsk.cpp
	${MAME_DIR}/src/lib/formats/d82_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/dcp_dsk.h,FORMATS["DCP_DSK"] = true
##################################################

if (("DCP_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/dcp_dsk.cpp
	${MAME_DIR}/src/lib/formats/dcp_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/dim_dsk.h,FORMATS["DIM_DSK"] = true
##################################################

if (("DIM_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/dim_dsk.cpp
	${MAME_DIR}/src/lib/formats/dim_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/dip_dsk.h,FORMATS["DIP_DSK"] = true
##################################################

if (("DIP_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/dip_dsk.cpp
	${MAME_DIR}/src/lib/formats/dip_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/dmk_dsk.h,FORMATS["DMK_DSK"] = true
##################################################

if (("DMK_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/dmk_dsk.cpp
	${MAME_DIR}/src/lib/formats/dmk_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/ds9_dsk.h,FORMATS["DS9_DSK"] = true
##################################################

if (("DS9_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/ds9_dsk.cpp
	${MAME_DIR}/src/lib/formats/ds9_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/sdf_dsk.h,FORMATS["SDF_DSK"] = true
##################################################

if (("SDF_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/sdf_dsk.cpp
	${MAME_DIR}/src/lib/formats/sdf_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/ep64_dsk.h,FORMATS["EP64_DSK"] = true
##################################################

if (("EP64_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/ep64_dsk.cpp
	${MAME_DIR}/src/lib/formats/ep64_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/dmv_dsk.h,FORMATS["DMV_DSK"] = true
##################################################

if (("DMV_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/dmv_dsk.cpp
	${MAME_DIR}/src/lib/formats/dmv_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/dvk_mx_dsk.h,FORMATS["DVK_MX_DSK"] = true
##################################################

if (("DVK_MX_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/dvk_mx_dsk.cpp
	${MAME_DIR}/src/lib/formats/dvk_mx_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/esq16_dsk.h,FORMATS["ESQ16_DSK"] = true
##################################################

if (("ESQ16_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/esq16_dsk.cpp
	${MAME_DIR}/src/lib/formats/esq16_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/esq8_dsk.h,FORMATS["ESQ8_DSK"] = true
##################################################

if (("ESQ8_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/esq8_dsk.cpp
	${MAME_DIR}/src/lib/formats/esq8_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/excali64_dsk.h,FORMATS["EXCALI64_DSK"] = true
##################################################

if (("EXCALI64_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/excali64_dsk.cpp
	${MAME_DIR}/src/lib/formats/excali64_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/fc100_cas.h,FORMATS["FC100_CAS"] = true
##################################################

if (("FC100_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/fc100_cas.cpp
	${MAME_DIR}/src/lib/formats/fc100_cas.h
)
endif()

##################################################
##
##@src/lib/formats/fdd_dsk.h,FORMATS["FDD_DSK"] = true
##################################################

if (("FDD_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/fdd_dsk.cpp
	${MAME_DIR}/src/lib/formats/fdd_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/fl1_dsk.h,FORMATS["FL1_DSK"] = true
##################################################

if (("FL1_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/fl1_dsk.cpp
	${MAME_DIR}/src/lib/formats/fl1_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/flex_dsk.h,FORMATS["FLEX_DSK"] = true
##################################################

if (("FLEX_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/flex_dsk.cpp
	${MAME_DIR}/src/lib/formats/flex_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/uniflex_dsk.h,FORMATS["UNIFLEX_DSK"] = true
##################################################

if (("UNIFLEX_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/uniflex_dsk.cpp
	${MAME_DIR}/src/lib/formats/uniflex_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/fm7_cas.h,FORMATS["FM7_CAS"] = true
##################################################

if (("FM7_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/fm7_cas.cpp
	${MAME_DIR}/src/lib/formats/fm7_cas.h
)
endif()

##################################################
##
##@src/lib/formats/fmsx_cas.h,FORMATS["FMSX_CAS"] = true
##################################################

if (("FMSX_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/fmsx_cas.cpp
	${MAME_DIR}/src/lib/formats/fmsx_cas.h
)
endif()

##################################################
##
##@src/lib/formats/fmtowns_dsk.h,FORMATS["FMTOWNS_DSK"] = true
##################################################

if (("FMTOWNS_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/fmtowns_dsk.cpp
	${MAME_DIR}/src/lib/formats/fmtowns_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/fsd_dsk.h,FORMATS["FSD_DSK"] = true
##################################################

if (("FSD_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/fsd_dsk.cpp
	${MAME_DIR}/src/lib/formats/fsd_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/g64_dsk.h,FORMATS["G64_DSK"] = true
##################################################

if (("G64_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/g64_dsk.cpp
	${MAME_DIR}/src/lib/formats/g64_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/gtp_cas.h,FORMATS["GTP_CAS"] = true
##################################################

if (("GTP_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/gtp_cas.cpp
	${MAME_DIR}/src/lib/formats/gtp_cas.h
)
endif()

##################################################
##
##@src/lib/formats/guab_dsk.h,FORMATS["GUAB_DSK"] = true
##################################################

if (("GUAB_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/guab_dsk.cpp
	${MAME_DIR}/src/lib/formats/guab_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/h8_cas.h,FORMATS["H8_CAS"] = true
##################################################

if (("H8_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/h8_cas.cpp
	${MAME_DIR}/src/lib/formats/h8_cas.h
)
endif()

##################################################
##
##@src/lib/formats/hector_minidisc.h,FORMATS["HECTOR_MINIDISC"] = true
##################################################

if (("HECTOR_MINIDISC" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/hector_minidisc.cpp
	${MAME_DIR}/src/lib/formats/hector_minidisc.h
)
endif()

##################################################
##
##@src/lib/formats/hect_dsk.h,FORMATS["HECT_DSK"] = true
##################################################

if (("HECT_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/hect_dsk.cpp
	${MAME_DIR}/src/lib/formats/hect_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/hect_tap.h,FORMATS["HECT_TAP"] = true
##################################################

if (("HECT_TAP" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/hect_tap.cpp
	${MAME_DIR}/src/lib/formats/hect_tap.h
)
endif()

##################################################
##
##@src/lib/formats/hti_tape.h,FORMATS["HTI_TAP"] = true
##################################################

if (("HTI_TAP" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/hti_tape.cpp
	${MAME_DIR}/src/lib/formats/hti_tape.h
)
endif()

##################################################
##
##@src/lib/formats/hpi_dsk.h,FORMATS["HPI_DSK"] = true
##################################################

if (("HPI_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/hpi_dsk.cpp
	${MAME_DIR}/src/lib/formats/hpi_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/hp_ipc_dsk.h,FORMATS["HP_IPC_DSK"] = true
##################################################

if (("HP_IPC_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/hp_ipc_dsk.cpp
	${MAME_DIR}/src/lib/formats/hp_ipc_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/img_dsk.h,FORMATS["IMG_DSK"] = true
##################################################

if (("IMG_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/img_dsk.cpp
	${MAME_DIR}/src/lib/formats/img_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/iq151_dsk.h,FORMATS["IQ151_DSK"] = true
##################################################

if (("IQ151_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/iq151_dsk.cpp
	${MAME_DIR}/src/lib/formats/iq151_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/itt3030_dsk.h,FORMATS["ITT3030_DSK"] = true
##################################################

if (("ITT3030_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/itt3030_dsk.cpp
	${MAME_DIR}/src/lib/formats/itt3030_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/juku_dsk.h,FORMATS["JUKU_DSK"] = true
##################################################

if (("JUKU_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/juku_dsk.cpp
	${MAME_DIR}/src/lib/formats/juku_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/jvc_dsk.h,FORMATS["JVC_DSK"] = true
##################################################

if (("JVC_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/jvc_dsk.cpp
	${MAME_DIR}/src/lib/formats/jvc_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/os9_dsk.h,FORMATS["OS9_DSK"] = true
##################################################

if (("OS9_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/os9_dsk.cpp
	${MAME_DIR}/src/lib/formats/os9_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/jfd_dsk.h,FORMATS["JFD_DSK"] = true
##################################################

if (("JFD_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/jfd_dsk.cpp
	${MAME_DIR}/src/lib/formats/jfd_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/kaypro_dsk.h,FORMATS["KAYPRO_DSK"] = true
##################################################

if (("KAYPRO_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/kaypro_dsk.cpp
	${MAME_DIR}/src/lib/formats/kaypro_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/kc85_dsk.h,FORMATS["KC85_DSK"] = true
##################################################

if (("KC85_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/kc85_dsk.cpp
	${MAME_DIR}/src/lib/formats/kc85_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/kc_cas.h,FORMATS["KC_CAS"] = true
##################################################

if (("KC_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/kc_cas.cpp
	${MAME_DIR}/src/lib/formats/kc_cas.h
)
endif()

##################################################
##
##@src/lib/formats/kim1_cas.h,FORMATS["KIM1_CAS"] = true
##################################################

if (("KIM1_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/kim1_cas.cpp
	${MAME_DIR}/src/lib/formats/kim1_cas.h
)
endif()

##################################################
##
##@src/lib/formats/lviv_lvt.h,FORMATS["LVIV_LVT"] = true
##################################################

if (("LVIV_LVT" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/lviv_lvt.cpp
	${MAME_DIR}/src/lib/formats/lviv_lvt.h
)
endif()

##################################################
##
##@src/lib/formats/m20_dsk.h,FORMATS["M20_DSK"] = true
##################################################

if (("M20_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/m20_dsk.cpp
	${MAME_DIR}/src/lib/formats/m20_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/m5_dsk.h,FORMATS["M5_DSK"] = true
##################################################

if (("M5_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/m5_dsk.cpp
	${MAME_DIR}/src/lib/formats/m5_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/mbee_cas.h,FORMATS["MBEE_CAS"] = true
##################################################

if (("MBEE_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/mbee_cas.cpp
	${MAME_DIR}/src/lib/formats/mbee_cas.h
)
endif()

##################################################
##
##@src/lib/formats/mdos_dsk.h,FORMATS["MDOS_DSK"] = true
##################################################

if (("MDOS_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/mdos_dsk.cpp
	${MAME_DIR}/src/lib/formats/mdos_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/mfm_hd.h,FORMATS["MFM_HD"] = true
##################################################

if (("MFM_HD" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/mfm_hd.cpp
	${MAME_DIR}/src/lib/formats/mfm_hd.h
)
endif()

##################################################
##
##@src/lib/formats/mm_dsk.h,FORMATS["MM_DSK"] = true
##################################################

if (("MM_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/mm_dsk.cpp
	${MAME_DIR}/src/lib/formats/mm_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/ms0515_dsk.h,FORMATS["MS0515_DSK"] = true
##################################################

if (("MS0515_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/ms0515_dsk.cpp
	${MAME_DIR}/src/lib/formats/ms0515_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/msx_dsk.h,FORMATS["MSX_DSK"] = true
##################################################

if (("MSX_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/msx_dsk.cpp
	${MAME_DIR}/src/lib/formats/msx_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/mtx_dsk.h,FORMATS["MTX_DSK"] = true
##################################################

if (("MTX_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/mtx_dsk.cpp
	${MAME_DIR}/src/lib/formats/mtx_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/mz_cas.h,FORMATS["MZ_CAS"] = true
##################################################

if (("MZ_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/mz_cas.cpp
	${MAME_DIR}/src/lib/formats/mz_cas.h
)
endif()

##################################################
##
##@src/lib/formats/nanos_dsk.h,FORMATS["NANOS_DSK"] = true
##################################################

if (("NANOS_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/nanos_dsk.cpp
	${MAME_DIR}/src/lib/formats/nanos_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/nascom_dsk.h,FORMATS["NASCOM_DSK"] = true
##################################################

if (("NASCOM_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/nascom_dsk.cpp
	${MAME_DIR}/src/lib/formats/nascom_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/naslite_dsk.h,FORMATS["NASLITE_DSK"] = true
##################################################

if (("NASLITE_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/naslite_dsk.cpp
	${MAME_DIR}/src/lib/formats/naslite_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/nes_dsk.h,FORMATS["NES_DSK"] = true
##################################################

if (("NES_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/nes_dsk.cpp
	${MAME_DIR}/src/lib/formats/nes_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/nfd_dsk.h,FORMATS["NFD_DSK"] = true
##################################################

if (("NFD_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/nfd_dsk.cpp
	${MAME_DIR}/src/lib/formats/nfd_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/opd_dsk.h,FORMATS["OPD_DSK"] = true
##################################################

if (("OPD_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/opd_dsk.cpp
	${MAME_DIR}/src/lib/formats/opd_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/orao_cas.h,FORMATS["ORAO_CAS"] = true
##################################################

if (("ORAO_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/orao_cas.cpp
	${MAME_DIR}/src/lib/formats/orao_cas.h
)
endif()

##################################################
##
##@src/lib/formats/oric_dsk.h,FORMATS["ORIC_DSK"] = true
##################################################

if (("ORIC_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/oric_dsk.cpp
	${MAME_DIR}/src/lib/formats/oric_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/oric_tap.h,FORMATS["ORIC_TAP"] = true
##################################################

if (("ORIC_TAP" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/oric_tap.cpp
	${MAME_DIR}/src/lib/formats/oric_tap.h
)
endif()

##################################################
##
##@src/lib/formats/ibmxdf_dsk.h,FORMATS["IBMXDF_DSK"] = true
##################################################

if (("IBMXDF_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/ibmxdf_dsk.cpp
	${MAME_DIR}/src/lib/formats/ibmxdf_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/p2000t_cas.h,FORMATS["P2000T_CAS"] = true
##################################################

if (("P2000T_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/p2000t_cas.cpp
	${MAME_DIR}/src/lib/formats/p2000t_cas.h
)
endif()


##################################################
##
##@src/lib/formats/p6001_cas.h,FORMATS["P6001_CAS"] = true
##################################################

if (("P6001_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/p6001_cas.cpp
	${MAME_DIR}/src/lib/formats/p6001_cas.h
)
endif()

##################################################
##
##@src/lib/formats/pasti_dsk.h,FORMATS["PASTI_DSK"] = true
##################################################

if (("PASTI_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/pasti_dsk.cpp
	${MAME_DIR}/src/lib/formats/pasti_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/pc98fdi_dsk.h,FORMATS["PC98FDI_DSK"] = true
##################################################

if (("PC98FDI_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/pc98fdi_dsk.cpp
	${MAME_DIR}/src/lib/formats/pc98fdi_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/pc98_dsk.h,FORMATS["PC98_DSK"] = true
##################################################

if (("PC98_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/pc98_dsk.cpp
	${MAME_DIR}/src/lib/formats/pc98_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/phc25_cas.h,FORMATS["PHC25_CAS"] = true
##################################################

if (("PHC25_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/phc25_cas.cpp
	${MAME_DIR}/src/lib/formats/phc25_cas.h
)
endif()

##################################################
##
##@src/lib/formats/pk8020_dsk.h,FORMATS["PK8020_DSK"] = true
##################################################

if (("PK8020_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/pk8020_dsk.cpp
	${MAME_DIR}/src/lib/formats/pk8020_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/pmd_cas.h,FORMATS["PMD_CAS"] = true
##################################################

if (("PMD_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/pmd_cas.cpp
	${MAME_DIR}/src/lib/formats/pmd_cas.h
)
endif()

##################################################
##
##@src/lib/formats/poly_dsk.h,FORMATS["POLY_DSK"] = true
##################################################

if (("POLY_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/poly_dsk.cpp
	${MAME_DIR}/src/lib/formats/poly_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/ppg_dsk.h,FORMATS["PPG_DSK"] = true
##################################################

if (("PPG_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/ppg_dsk.cpp
	${MAME_DIR}/src/lib/formats/ppg_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/primoptp.h,FORMATS["PRIMOPTP"] = true
##################################################

if (("PRIMOPTP" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/primoptp.cpp
	${MAME_DIR}/src/lib/formats/primoptp.h
)
endif()

##################################################
##
##@src/lib/formats/pyldin_dsk.h,FORMATS["PYLDIN_DSK"] = true
##################################################

if (("PYLDIN_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/pyldin_dsk.cpp
	${MAME_DIR}/src/lib/formats/pyldin_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/ql_dsk.h,FORMATS["QL_DSK"] = true
##################################################

if (("QL_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/ql_dsk.cpp
	${MAME_DIR}/src/lib/formats/ql_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/rc759_dsk.h,FORMATS["RC759_DSK"] = true
##################################################

if (("RC759_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/rc759_dsk.cpp
	${MAME_DIR}/src/lib/formats/rc759_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/rk_cas.h,FORMATS["RK_CAS"] = true
##################################################

if (("RK_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/rk_cas.cpp
	${MAME_DIR}/src/lib/formats/rk_cas.h
)
endif()

##################################################
##
##@src/lib/formats/rx50_dsk.h,FORMATS["RX50_DSK"] = true
##################################################

if (("RX50_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/rx50_dsk.cpp
	${MAME_DIR}/src/lib/formats/rx50_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/sc3000_bit.h,FORMATS["SC3000_BIT"] = true
##################################################

if (("SC3000_BIT" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/sc3000_bit.cpp
	${MAME_DIR}/src/lib/formats/sc3000_bit.h
)
endif()

##################################################
##
##@src/lib/formats/sdd_dsk.h,FORMATS["SDD_DSK"] = true
##################################################

if (("SDD_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/sdd_dsk.cpp
	${MAME_DIR}/src/lib/formats/sdd_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/sf7000_dsk.h,FORMATS["SF7000_DSK"] = true
##################################################

if (("SF7000_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/sf7000_dsk.cpp
	${MAME_DIR}/src/lib/formats/sf7000_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/smx_dsk.h,FORMATS["SMX_DSK"] = true
##################################################

if (("SMX_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/smx_dsk.cpp
	${MAME_DIR}/src/lib/formats/smx_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/sol_cas.h,FORMATS["SOL_CAS"] = true
##################################################

if (("SOL_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/sol_cas.cpp
	${MAME_DIR}/src/lib/formats/sol_cas.h
)
endif()

##################################################
##
##@src/lib/formats/sorc_cas.h,FORMATS["SORC_CAS"] = true
##################################################

if (("SORC_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/sorc_cas.cpp
	${MAME_DIR}/src/lib/formats/sorc_cas.h
)
endif()

##################################################
##
##@src/lib/formats/sorc_dsk.h,FORMATS["SORC_DSK"] = true
##################################################

if (("SORC_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/sorc_dsk.cpp
	${MAME_DIR}/src/lib/formats/sorc_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/sord_cas.h,FORMATS["SORD_CAS"] = true
##################################################

if (("SORD_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/sord_cas.cpp
	${MAME_DIR}/src/lib/formats/sord_cas.h
)
endif()

##################################################
##
##@src/lib/formats/spc1000_cas.h,FORMATS["SPC1000_CAS"] = true
##################################################

if (("SPC1000_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/spc1000_cas.cpp
	${MAME_DIR}/src/lib/formats/spc1000_cas.h
)
endif()

##################################################
##
##@src/lib/formats/st_dsk.h,FORMATS["ST_DSK"] = true
##################################################

if (("ST_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/st_dsk.cpp
	${MAME_DIR}/src/lib/formats/st_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/svi_cas.h,FORMATS["SVI_CAS"] = true
##################################################

if (("SVI_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/svi_cas.cpp
	${MAME_DIR}/src/lib/formats/svi_cas.h
)
endif()

##################################################
##
##@src/lib/formats/svi_dsk.h,FORMATS["SVI_DSK"] = true
##################################################

if (("SVI_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/svi_dsk.cpp
	${MAME_DIR}/src/lib/formats/svi_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/swd_dsk.h,FORMATS["SWD_DSK"] = true
##################################################

if (("SWD_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/swd_dsk.cpp
	${MAME_DIR}/src/lib/formats/swd_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/tandy2k_dsk.h,FORMATS["TANDY2K_DSK"] = true
##################################################

if (("TANDY2K_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/tandy2k_dsk.cpp
	${MAME_DIR}/src/lib/formats/tandy2k_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/thom_cas.h,FORMATS["THOM_CAS"] = true
##################################################

if (("THOM_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/thom_cas.cpp
	${MAME_DIR}/src/lib/formats/thom_cas.h
)
endif()

##################################################
##
##@src/lib/formats/thom_dsk.h,FORMATS["THOM_DSK"] = true
##################################################

if (("THOM_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/thom_dsk.cpp
	${MAME_DIR}/src/lib/formats/thom_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/ti99_dsk.h,FORMATS["TI99_DSK"] = true
##################################################

if (("TI99_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/ti99_dsk.cpp
	${MAME_DIR}/src/lib/formats/ti99_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/tiki100_dsk.h,FORMATS["TIKI100_DSK"] = true
##################################################

if (("TIKI100_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/tiki100_dsk.cpp
	${MAME_DIR}/src/lib/formats/tiki100_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/trd_dsk.h,FORMATS["TRD_DSK"] = true
##################################################

if (("TRD_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/trd_dsk.cpp
	${MAME_DIR}/src/lib/formats/trd_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/trs80_dsk.h,FORMATS["TRS80_DSK"] = true
##################################################

if (("TRS80_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/trs80_dsk.cpp
	${MAME_DIR}/src/lib/formats/trs80_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/trs_cas.h,FORMATS["TRS_CAS"] = true
##################################################

if (("TRS_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/trs_cas.cpp
	${MAME_DIR}/src/lib/formats/trs_cas.h
)
endif()

##################################################
##
##@src/lib/formats/tvc_cas.h,FORMATS["TVC_CAS"] = true
##################################################

if (("TVC_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/tvc_cas.cpp
	${MAME_DIR}/src/lib/formats/tvc_cas.h
)
endif()

##################################################
##
##@src/lib/formats/tvc_dsk.h,FORMATS["TVC_DSK"] = true
##################################################

if (("TVC_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/tvc_dsk.cpp
	${MAME_DIR}/src/lib/formats/tvc_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/tzx_cas.h,FORMATS["TZX_CAS"] = true
##################################################

if (("TZX_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/tzx_cas.cpp
	${MAME_DIR}/src/lib/formats/tzx_cas.h
)
endif()

##################################################
##
##@src/lib/formats/uef_cas.h,FORMATS["UEF_CAS"] = true
##################################################

if (("UEF_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/uef_cas.cpp
	${MAME_DIR}/src/lib/formats/uef_cas.h
)
endif()

##################################################
##
##@src/lib/formats/vdk_dsk.h,FORMATS["VDK_DSK"] = true
##################################################

if (("VDK_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/vdk_dsk.cpp
	${MAME_DIR}/src/lib/formats/vdk_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/vector06_dsk.h,FORMATS["VECTOR06_DSK"] = true
##################################################

if (("VECTOR06_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/vector06_dsk.cpp
	${MAME_DIR}/src/lib/formats/vector06_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/vg5k_cas.h,FORMATS["VG5K_CAS"] = true
##################################################

if (("VG5K_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/vg5k_cas.cpp
	${MAME_DIR}/src/lib/formats/vg5k_cas.h
)
endif()

##################################################
##
##@src/lib/formats/victor9k_dsk.h,FORMATS["VICTOR9K_DSK"] = true
##################################################

if (("VICTOR9K_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/victor9k_dsk.cpp
	${MAME_DIR}/src/lib/formats/victor9k_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/vt_cas.h,FORMATS["VT_CAS"] = true
##################################################

if (("VT_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/vt_cas.cpp
	${MAME_DIR}/src/lib/formats/vt_cas.h
)
endif()

##################################################
##
##@src/lib/formats/vt_dsk.h,FORMATS["VT_DSK"] = true
##################################################

if (("VT_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/vt_dsk.cpp
	${MAME_DIR}/src/lib/formats/vt_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/fs_vtech.h,FORMATS["FS_VTECH"] = true
##################################################

if (("FS_VTECH" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/fs_vtech.cpp
	${MAME_DIR}/src/lib/formats/fs_vtech.h
)
endif()

##################################################
##
##@src/lib/formats/wd177x_dsk.h,FORMATS["WD177X_DSK"] = true
##################################################

if (("WD177X_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/wd177x_dsk.cpp
	${MAME_DIR}/src/lib/formats/wd177x_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/x07_cas.h,FORMATS["X07_CAS"] = true
##################################################

if (("X07_CAS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/x07_cas.cpp
	${MAME_DIR}/src/lib/formats/x07_cas.h
)
endif()

##################################################
##
##@src/lib/formats/x1_tap.h,FORMATS["X1_TAP"] = true
##################################################

if (("X1_TAP" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/x1_tap.cpp
	${MAME_DIR}/src/lib/formats/x1_tap.h
)
endif()

##################################################
##
##@src/lib/formats/xdf_dsk.h,FORMATS["XDF_DSK"] = true
##################################################

if (("XDF_DSK" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/xdf_dsk.cpp
	${MAME_DIR}/src/lib/formats/xdf_dsk.h
)
endif()

##################################################
##
##@src/lib/formats/zx81_p.h,FORMATS["ZX81_P"] = true
##################################################

if (("ZX81_P" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/zx81_p.cpp
	${MAME_DIR}/src/lib/formats/zx81_p.h
)
endif()

##################################################
##
##@src/lib/formats/fs_prodos.h,FORMATS["FS_PRODOS"] = true
##################################################

if (("FS_PRODOS" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/fs_prodos.cpp
	${MAME_DIR}/src/lib/formats/fs_prodos.h
)
endif()

##################################################
##
##@src/lib/formats/fs_oric_jasmin.h,FORMATS["FS_ORIC_JASMIN"] = true
##################################################

if (("FS_ORIC_JASMIN" IN_LIST FORMATS) OR TOOLS)
list(APPEND FORMATS_SRCS
	${MAME_DIR}/src/lib/formats/fs_oric_jasmin.cpp
	${MAME_DIR}/src/lib/formats/fs_oric_jasmin.h
)
endif()

add_library(formats ${LIBTYPE} ${FORMATS_SRCS})

addprojectflags(formats)

target_include_directories(formats PRIVATE
	${MAME_DIR}/src/osd
	${MAME_DIR}/src/emu
	${MAME_DIR}/src/lib
	${MAME_DIR}/src/lib/util
	${GEN_DIR}
	${MAME_DIR}/3rdparty/zlib
)

target_link_libraries(formats PUBLIC 
	utils
)