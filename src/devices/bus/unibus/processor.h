// license:BSD-3-Clause
// copyright-holders:Miodrag Milanovic
/**********************************************************************

    DEC Unibus processors

**********************************************************************/

#ifndef MAME_BUS_UNIBUS_PROCESSOR_H
#define MAME_BUS_UNIBUS_PROCESSOR_H

#pragma once

#include "unibus.h"

#include "cpu/t11/t11.h"


// ======================> unibus_processor_device

class unibus_processor_device : public device_t, public device_unibus_card_interface
{
public:
	// device_unibus_card_interface implementation
	virtual void unibus_br_w(int level, int state) override;

protected:
	static constexpr offs_t IOPAGE = 0160000;

	unibus_processor_device(const machine_config &mconfig, device_type type, const char *tag, device_t *owner, u32 clock);

	// device_t implementation
	virtual void device_start() override ATTR_COLD { }

	// connect the processor to the Unibus (from device_add_mconfig of the card)
	void connect_cpu() ATTR_COLD;

	required_device<pdp11_cpu_device> m_cpu;

private:
	void mem(address_map &map) ATTR_COLD;

	IRQ_CALLBACK_MEMBER(irq_ack);

	u16 nxm_r();
	void nxm_w(u16 data);
	u16 swr_r() { return 0; } // TODO: switch register
};


// ======================> unibus_ka11_device

class unibus_ka11_device : public unibus_processor_device
{
public:
	unibus_ka11_device(const machine_config &mconfig, const char *tag, device_t *owner, u32 clock);

protected:
	// device_t implementation
	virtual void device_add_mconfig(machine_config &config) override ATTR_COLD;
};


// ======================> unibus_kd11b_device

class unibus_kd11b_device : public unibus_processor_device
{
public:
	unibus_kd11b_device(const machine_config &mconfig, const char *tag, device_t *owner, u32 clock);

protected:
	// device_t implementation
	virtual void device_add_mconfig(machine_config &config) override ATTR_COLD;
};


DECLARE_DEVICE_TYPE(UNIBUS_KA11,  unibus_ka11_device)
DECLARE_DEVICE_TYPE(UNIBUS_KD11B, unibus_kd11b_device)

#endif // MAME_BUS_UNIBUS_PROCESSOR_H
