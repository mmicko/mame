// license:BSD-3-Clause
// copyright-holders:Miodrag Milanovic
/**********************************************************************

    DEC Unibus memory

**********************************************************************/

#ifndef MAME_BUS_UNIBUS_MEMORY_H
#define MAME_BUS_UNIBUS_MEMORY_H

#pragma once

#include "unibus.h"


// ======================> unibus_mm11u_device

class unibus_mm11u_device : public device_t, public device_unibus_card_interface
{
public:
	unibus_mm11u_device(const machine_config &mconfig, const char *tag, device_t *owner, u32 clock);

	// device_unibus_card_interface implementation
	virtual void unibus_init() override { }     // INIT does not reset memory

protected:
	// device_t implementation
	virtual void device_start() override ATTR_COLD;

private:
	static constexpr offs_t SIZE = 16 * 2 * 1024; // 16KW memory

	std::unique_ptr<u16[]> m_ram;
};


DECLARE_DEVICE_TYPE(UNIBUS_MM11U, unibus_mm11u_device)

#endif // MAME_BUS_UNIBUS_MEMORY_H
