// license:BSD-3-Clause
// copyright-holders:Miodrag Milanovic
/**********************************************************************

    DEC Unibus cards

**********************************************************************/

#include "emu.h"
#include "cards.h"

#include "dl11.h"
#include "memory.h"
#include "processor.h"


void unibus_cpu_cards(device_slot_interface &device)
{
	device.option_add("ka11", UNIBUS_KA11);
	device.option_add("kd11b", UNIBUS_KD11B);
}

void unibus_cards(device_slot_interface &device)
{
	device.option_add("dl11", UNIBUS_DL11);
	device.option_add("mm11u", UNIBUS_MM11U);
}
