##################################################
## SoftFloat 3 library objects
##################################################

set(SOFTFLOAT3_SRCS
	${MAME_DIR}/3rdparty/softfloat3/source/s_eq128.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_le128.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_lt128.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_shortShiftLeft128.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_shortShiftRight128.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_shortShiftRightJam64.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_shortShiftRightJam64Extra.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_shortShiftRightJam128.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_shortShiftRightJam128Extra.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_shiftRightJam32.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_shiftRightJam64.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_shiftRightJam64Extra.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_shiftRightJam128.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_shiftRightJam128Extra.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_shiftRightJam256M.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_countLeadingZeros8.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_countLeadingZeros16.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_countLeadingZeros32.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_countLeadingZeros64.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_add128.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_add256M.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_sub128.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_sub256M.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_mul64ByShifted32To128.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_mul64To128.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_mul128By32.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_mul128To256M.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_approxRecip_1Ks.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_approxRecip32_1.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_approxRecipSqrt_1Ks.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_approxRecipSqrt32_1.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/softfloat_raiseFlags.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/s_commonNaNToF16UI.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/s_propagateNaNF16UI.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/s_f32UIToCommonNaN.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/s_commonNaNToF32UI.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/s_propagateNaNF32UI.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/s_f64UIToCommonNaN.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/s_commonNaNToF64UI.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/s_propagateNaNF64UI.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/extF80M_isSignalingNaN.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/s_extF80UIToCommonNaN.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/s_commonNaNToExtF80UI.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/s_propagateNaNExtF80UI.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/f128M_isSignalingNaN.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/s_f128UIToCommonNaN.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/s_commonNaNToF128UI.c
	${MAME_DIR}/3rdparty/softfloat3/source/8086/s_propagateNaNF128UI.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_roundToUI32.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_roundToUI64.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_roundToI32.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_roundToI64.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_normSubnormalF16Sig.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_roundPackToF16.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_normRoundPackToF16.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_addMagsF16.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_subMagsF16.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_mulAddF16.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_normSubnormalF32Sig.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_roundPackToF32.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_normRoundPackToF32.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_addMagsF32.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_subMagsF32.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_mulAddF32.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_normSubnormalF64Sig.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_roundPackToF64.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_normRoundPackToF64.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_addMagsF64.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_subMagsF64.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_mulAddF64.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_normSubnormalExtF80Sig.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_roundPackToExtF80.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_normRoundPackToExtF80.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_addMagsExtF80.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_subMagsExtF80.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_normSubnormalF128Sig.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_roundPackToF128.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_normRoundPackToF128.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_addMagsF128.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_subMagsF128.c
	${MAME_DIR}/3rdparty/softfloat3/source/s_mulAddF128.c
	${MAME_DIR}/3rdparty/softfloat3/source/softfloat_state.c
	${MAME_DIR}/3rdparty/softfloat3/source/ui32_to_f16.c
	${MAME_DIR}/3rdparty/softfloat3/source/ui32_to_f32.c
	${MAME_DIR}/3rdparty/softfloat3/source/ui32_to_f64.c
	${MAME_DIR}/3rdparty/softfloat3/source/ui32_to_extF80.c
	${MAME_DIR}/3rdparty/softfloat3/source/ui32_to_extF80M.c
	${MAME_DIR}/3rdparty/softfloat3/source/ui32_to_f128.c
	${MAME_DIR}/3rdparty/softfloat3/source/ui32_to_f128M.c
	${MAME_DIR}/3rdparty/softfloat3/source/ui64_to_f16.c
	${MAME_DIR}/3rdparty/softfloat3/source/ui64_to_f32.c
	${MAME_DIR}/3rdparty/softfloat3/source/ui64_to_f64.c
	${MAME_DIR}/3rdparty/softfloat3/source/ui64_to_extF80.c
	${MAME_DIR}/3rdparty/softfloat3/source/ui64_to_extF80M.c
	${MAME_DIR}/3rdparty/softfloat3/source/ui64_to_f128.c
	${MAME_DIR}/3rdparty/softfloat3/source/ui64_to_f128M.c
	${MAME_DIR}/3rdparty/softfloat3/source/i32_to_f16.c
	${MAME_DIR}/3rdparty/softfloat3/source/i32_to_f32.c
	${MAME_DIR}/3rdparty/softfloat3/source/i32_to_f64.c
	${MAME_DIR}/3rdparty/softfloat3/source/i32_to_extF80.c
	${MAME_DIR}/3rdparty/softfloat3/source/i32_to_extF80M.c
	${MAME_DIR}/3rdparty/softfloat3/source/i32_to_f128.c
	${MAME_DIR}/3rdparty/softfloat3/source/i32_to_f128M.c
	${MAME_DIR}/3rdparty/softfloat3/source/i64_to_f16.c
	${MAME_DIR}/3rdparty/softfloat3/source/i64_to_f32.c
	${MAME_DIR}/3rdparty/softfloat3/source/i64_to_f64.c
	${MAME_DIR}/3rdparty/softfloat3/source/i64_to_extF80.c
	${MAME_DIR}/3rdparty/softfloat3/source/i64_to_extF80M.c
	${MAME_DIR}/3rdparty/softfloat3/source/i64_to_f128.c
	${MAME_DIR}/3rdparty/softfloat3/source/i64_to_f128M.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_to_ui32.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_to_ui64.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_to_i32.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_to_i64.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_to_ui32_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_to_ui64_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_to_i32_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_to_i64_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_to_f32.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_to_f64.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_to_extF80.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_to_extF80M.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_to_f128.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_to_f128M.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_roundToInt.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_add.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_sub.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_mul.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_mulAdd.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_div.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_rem.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_sqrt.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_eq.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_le.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_lt.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_eq_signaling.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_le_quiet.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_lt_quiet.c
	${MAME_DIR}/3rdparty/softfloat3/source/f16_isSignalingNaN.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_to_ui32.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_to_ui64.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_to_i32.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_to_i64.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_to_ui32_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_to_ui64_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_to_i32_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_to_i64_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_to_f16.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_to_f64.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_to_extF80.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_to_extF80M.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_to_f128.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_to_f128M.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_roundToInt.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_add.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_sub.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_mul.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_mulAdd.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_div.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_rem.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_sqrt.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_eq.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_le.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_lt.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_eq_signaling.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_le_quiet.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_lt_quiet.c
	${MAME_DIR}/3rdparty/softfloat3/source/f32_isSignalingNaN.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_to_ui32.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_to_ui64.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_to_i32.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_to_i64.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_to_ui32_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_to_ui64_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_to_i32_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_to_i64_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_to_f16.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_to_f32.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_to_extF80.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_to_extF80M.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_to_f128.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_to_f128M.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_roundToInt.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_add.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_sub.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_mul.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_mulAdd.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_div.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_rem.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_sqrt.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_eq.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_le.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_lt.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_eq_signaling.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_le_quiet.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_lt_quiet.c
	${MAME_DIR}/3rdparty/softfloat3/source/f64_isSignalingNaN.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_to_ui32.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_to_ui64.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_to_i32.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_to_i64.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_to_ui32_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_to_ui64_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_to_i32_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_to_i64_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_to_f16.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_to_f32.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_to_f64.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_to_f128.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_roundToInt.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_add.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_sub.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_mul.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_div.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_rem.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_sqrt.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_eq.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_le.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_lt.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_eq_signaling.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_le_quiet.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_lt_quiet.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80_isSignalingNaN.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_to_ui32.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_to_ui64.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_to_i32.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_to_i64.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_to_ui32_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_to_ui64_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_to_i32_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_to_i64_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_to_f16.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_to_f32.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_to_f64.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_to_f128M.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_roundToInt.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_add.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_sub.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_mul.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_div.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_rem.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_sqrt.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_eq.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_le.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_lt.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_eq_signaling.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_le_quiet.c
	${MAME_DIR}/3rdparty/softfloat3/source/extF80M_lt_quiet.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_to_ui32.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_to_ui64.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_to_i32.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_to_i64.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_to_ui32_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_to_ui64_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_to_i32_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_to_i64_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_to_f16.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_to_f32.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_to_extF80.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_to_f64.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_roundToInt.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_add.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_sub.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_mul.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_mulAdd.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_div.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_rem.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_sqrt.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_eq.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_le.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_lt.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_eq_signaling.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_le_quiet.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_lt_quiet.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128_isSignalingNaN.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_to_ui32.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_to_ui64.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_to_i32.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_to_i64.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_to_ui32_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_to_ui64_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_to_i32_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_to_i64_r_minMag.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_to_f16.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_to_f32.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_to_extF80M.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_to_f64.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_roundToInt.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_add.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_sub.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_mul.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_mulAdd.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_div.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_rem.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_sqrt.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_eq.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_le.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_lt.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_eq_signaling.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_le_quiet.c
	${MAME_DIR}/3rdparty/softfloat3/source/f128M_lt_quiet.c
)

set_source_files_properties(${SOFTFLOAT3_SRCS} PROPERTIES LANGUAGE "CXX")

add_library(softfloat3 ${LIBTYPE} ${SOFTFLOAT3_SRCS})

target_include_directories(softfloat3 PRIVATE
	${MAME_DIR}/src/osd
	${MAME_DIR}/3rdparty/softfloat3/build/MAME
	${MAME_DIR}/3rdparty/softfloat3/source
	${MAME_DIR}/3rdparty/softfloat3/source/include
	${MAME_DIR}/3rdparty/softfloat3/source/8086
)

if(((CMAKE_CXX_COMPILER_ID STREQUAL "GNU") OR (CMAKE_CXX_COMPILER_ID MATCHES "Clang")) AND NOT MSVC)
	target_compile_options(softfloat3 PRIVATE -x c++)
endif()

if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
	target_compile_options(softfloat3 PRIVATE -Wno-implicit-fallthrough)
endif()

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
	target_compile_options(softfloat3 PRIVATE /wd4701) # warning C4701: potentially uninitialized local variable 'xxx' used
	target_compile_options(softfloat3 PRIVATE /wd4703) # warning C4703: potentially uninitialized local pointer variable 'xxx' used
endif()

target_compile_definitions(softfloat3 PRIVATE
	SOFTFLOAT_ROUND_ODD
	INLINE_LEVEL=5
	SOFTFLOAT_FAST_DIV32TO16
	SOFTFLOAT_FAST_DIV64TO32
	SOFTFLOAT_FAST_INT64
)
