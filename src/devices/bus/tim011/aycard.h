// license:BSD-3-Clause
// copyright-holders:Marko Solajic, Miodrag Milanovic
/**********************************************************************

    TIM-011 AY Card

**********************************************************************/

#ifndef MAME_BUS_TIM011_AYCARD_H
#define MAME_BUS_TIM011_AYCARD_H

#pragma once


#include "exp.h"
#include "sound/ay8910.h"

//**************************************************************************
//  TYPE DEFINITIONS
//**************************************************************************

// ======================> tim011_aycard_devices

class tim011_aycard_devices :
	public device_t,
	public device_tim011_expansion_interface
{
public:
	// construction/destruction
	tim011_aycard_devices(const machine_config &mconfig, const char *tag, device_t *owner, uint32_t clock);

protected:
	// device-level overrides
	virtual void device_start() override;

	// optional information overrides
	virtual void device_add_mconfig(machine_config &config) override;

	virtual uint8_t iorq_r(offs_t offset) override;
	virtual void iorq_w(offs_t offset, uint8_t data) override;
private:
	required_device<ay8910_device> m_psg;
};


// device type definition
DECLARE_DEVICE_TYPE(TIM011_AYCARD, tim011_aycard_devices)


#endif // MAME_BUS_TIM011_AYCARD_H
