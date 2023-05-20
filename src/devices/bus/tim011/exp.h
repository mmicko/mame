// license:BSD-3-Clause
// copyright-holders:Marko Solajic, Miodrag Milanovic
/**********************************************************************

        TIM-011 Expansion Port emulation

**********************************************************************

    Pinout:

		TIM011 Expansion Connector
		40 pin male, on main board

					*******
		VCC     1   * . . *    2 VCC
		GND     3   * . . *    4 GND
		/RD     5   * . . *    6 PHI
		/WR     7   * . . *    8 /RESET
		E       9   * . . *   10 /LIR
		/NMI   11   * . . *   12 /EXPSEL (E0-FF)
		/WAIT  13   * . . *   14 NC
		/INT0  15   * . . *   16 /HALT
		ST     17     . . *   18 NC
		A0     19     . . *   20 A1
		/TEND0 21     . . *   22 A2
		A3     23   * . . *   24 A4
		/DREQ0 25   * . . *   26 /IOE
		8MHZ   27   * . . *   28 RESET
		D7     29   * . . *   30 D6
		D5     31   * . . *   32 D3
		D4     33   * . . *   34 D2
		D1     35   * . . *   36 D0
		GND    37   * . . *   38 GND
		NC     39   * . . *   40 NC
					*******

**********************************************************************/

#ifndef MAME_BUS_TIM011_EXP_H
#define MAME_BUS_TIM011_EXP_H

#pragma once


//**************************************************************************
//  TYPE DEFINITIONS
//**************************************************************************

// ======================> tim011_expansion_slot_device

class device_tim011_expansion_interface;

class tim011_expansion_slot_device : public device_t, public device_single_card_slot_interface<device_tim011_expansion_interface>
{
public:
	// construction/destruction
	template <typename T>
	tim011_expansion_slot_device(machine_config const &mconfig, char const *tag, device_t *owner, T &&slot_options, const char *default_option)
		: tim011_expansion_slot_device(mconfig, tag, owner)
	{
		option_reset();
		slot_options(*this);
		set_default_option(default_option);
		set_fixed(false);
	}

	tim011_expansion_slot_device(machine_config const &mconfig, char const *tag, device_t *owner, uint32_t clock = 0);

	// callbacks
	auto irq_handler() { return m_irq_handler.bind(); }
	auto nmi_handler() { return m_nmi_handler.bind(); }

	uint8_t iorq_r(offs_t offset);
	void iorq_w(offs_t offset, uint8_t data);

	DECLARE_WRITE_LINE_MEMBER( irq_w ) { m_irq_handler(state); }
	DECLARE_WRITE_LINE_MEMBER( nmi_w ) { m_nmi_handler(state); }

protected:
	// device-level overrides
	virtual void device_start() override;

	device_tim011_expansion_interface *m_card;

private:
	devcb_write_line m_irq_handler;
	devcb_write_line m_nmi_handler;
};


// ======================> device_tim011_expansion_interface

class device_tim011_expansion_interface : public device_interface
{
public:
	// reading and writing
	virtual uint8_t iorq_r(offs_t offset) { return 0xff; }
	virtual void iorq_w(offs_t offset, uint8_t data) { }

protected:
	// construction/destruction
	device_tim011_expansion_interface(const machine_config &mconfig, device_t &device);

	tim011_expansion_slot_device *m_slot;
};


// device type definition
DECLARE_DEVICE_TYPE(TIM011_EXPANSION_SLOT, tim011_expansion_slot_device)

void tim011_expansion_devices(device_slot_interface &device);

#endif // MAME_BUS_TIM011_EXP_H
