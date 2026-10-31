// license:BSD-3-Clause
// copyright-holders:Miodrag Milanovic
/**********************************************************************

    DEC Unibus

**********************************************************************/

#ifndef MAME_BUS_UNIBUS_UNIBUS_H
#define MAME_BUS_UNIBUS_UNIBUS_H

#pragma once

#include <functional>
#include <vector>


class unibus_device;


// ======================> device_unibus_card_interface

class device_unibus_card_interface : public device_interface
{
	friend class unibus_device;

public:
	virtual ~device_unibus_card_interface();

	// INIT (the processor's RESET instruction, power up); resets the card by default
	virtual void unibus_init();

	// bus grant at a level: the vector of a pending request at that level, or -1 when the card has
	// none (the grant is passed on)
	virtual int unibus_irq_ack(int level) { return -1; }

	// the processor card: a request line at a level has changed
	virtual void unibus_br_w(int level, int state) { }

	void set_unibus(unibus_device &bus) { m_unibus = &bus; }

protected:
	device_unibus_card_interface(const machine_config &mconfig, device_t &device);

	virtual void interface_pre_start() override;

	unibus_device &unibus() { assert(m_unibus); return *m_unibus; }

	// bus request at level 4-7
	void br_w(int level, int state);

private:
	unibus_device *m_unibus;
	u8 m_br;
};


// ======================> unibus_device

class unibus_device : public device_t
{
public:
	unibus_device(const machine_config &mconfig, const char *tag, device_t *owner, u32 clock = 0);

	// the processor card, when the machine is configured: the space the Unibus is seen in and the
	// address of the I/O page (760000-777777) in it
	template <typename T> void set_space(T &&tag, int spacenum) { m_space.set_tag(std::forward<T>(tag), spacenum); }
	void set_processor(device_unibus_card_interface &cpu, offs_t iopage);

	// install a card at Unibus addresses (the I/O page, or memory on the 18-bit Unibus)
	template <typename R, typename W> void install_device(offs_t start, offs_t end, R rhandler, W whandler)
	{
		m_space->install_readwrite_handler(cpu_address(start), cpu_address(end), rhandler, whandler);
	}
	// Unibus memory
	void install_ram(offs_t start, offs_t end, void *base);

	// INIT from the processor
	void init_w();

	// bus grant from the processor at a level: the vector, or -1 (passive release)
	int irq_ack(int level);

	void add_card(device_unibus_card_interface &card);

protected:
	virtual void device_start() override ATTR_COLD;

private:
	friend class device_unibus_card_interface;

	offs_t cpu_address(offs_t addr) const;
	void br_update(int level);

	std::vector<std::reference_wrapper<device_unibus_card_interface> > m_cards;
	device_unibus_card_interface *m_processor;
	optional_address_space m_space;
	offs_t m_iopage;
	u8 m_br;
};


// ======================> unibus_slot_device

class unibus_slot_device : public device_t, public device_single_card_slot_interface<device_unibus_card_interface>
{
public:
	template <typename T, typename U>
	unibus_slot_device(const machine_config &mconfig, const char *tag, device_t *owner, T &&bus_tag, U &&opts, const char *dflt, bool fixed = false)
		: unibus_slot_device(mconfig, tag, owner, 0)
	{
		set_options(std::forward<U>(opts), dflt, fixed);
		m_unibus.set_tag(std::forward<T>(bus_tag));
	}
	unibus_slot_device(const machine_config &mconfig, const char *tag, device_t *owner, u32 clock = 0);

	// the bus while the machine is configured (for the cards in the slot)
	unibus_device &config_unibus() const { return *m_unibus.lookup(); }

protected:
	virtual void device_resolve_objects() override ATTR_COLD;
	virtual void device_start() override ATTR_COLD { }

	required_device<unibus_device> m_unibus;
};


DECLARE_DEVICE_TYPE(UNIBUS, unibus_device)
DECLARE_DEVICE_TYPE(UNIBUS_SLOT, unibus_slot_device)

#endif // MAME_BUS_UNIBUS_UNIBUS_H
