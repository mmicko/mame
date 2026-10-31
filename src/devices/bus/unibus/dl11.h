// license:BSD-3-Clause
// copyright-holders:Miodrag Milanovic
/**********************************************************************

    DEC DL11 serial line unit

**********************************************************************/

#ifndef MAME_BUS_UNIBUS_DL11_H
#define MAME_BUS_UNIBUS_DL11_H

#pragma once

#include "unibus.h"

#include "bus/rs232/rs232.h"
#include "machine/dl11.h"


class unibus_dl11_device : public device_t, public device_unibus_card_interface
{
public:
	unibus_dl11_device(const machine_config &mconfig, const char *tag, device_t *owner, u32 clock);

	// device_unibus_card_interface implementation
	virtual void unibus_init() override;
	virtual int unibus_irq_ack(int level) override;

protected:
	// device_t implementation
	virtual void device_add_mconfig(machine_config &config) override ATTR_COLD;
	virtual void device_start() override ATTR_COLD;

private:
	void update_br(int state = 0);

	required_device<dl11_device> m_dl11;
	required_device<rs232_port_device> m_rs232;
};


DECLARE_DEVICE_TYPE(UNIBUS_DL11, unibus_dl11_device)

#endif // MAME_BUS_UNIBUS_DL11_H
