// license:BSD-3-Clause
// copyright-holders:Miodrag Milanovic
/**********************************************************************

    DEC Unibus memory

**********************************************************************/

#include "emu.h"
#include "memory.h"


DEFINE_DEVICE_TYPE(UNIBUS_MM11U, unibus_mm11u_device, "unibus_mm11u", "DEC MM11-U core memory (16KW)")


unibus_mm11u_device::unibus_mm11u_device(const machine_config &mconfig, const char *tag, device_t *owner, u32 clock)
	: device_t(mconfig, UNIBUS_MM11U, tag, owner, clock)
	, device_unibus_card_interface(mconfig, *this)
{
}

void unibus_mm11u_device::device_start()
{
	m_ram = make_unique_clear<u16[]>(SIZE / 2);
	save_pointer(NAME(m_ram), SIZE / 2);

	unibus().install_ram(0, SIZE - 1, m_ram.get());
}
