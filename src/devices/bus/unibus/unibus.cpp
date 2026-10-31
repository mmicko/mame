// license:BSD-3-Clause
// copyright-holders:Miodrag Milanovic
/**********************************************************************

    DEC Unibus

**********************************************************************/

#include "emu.h"
#include "unibus.h"


DEFINE_DEVICE_TYPE(UNIBUS, unibus_device, "unibus", "DEC Unibus")
DEFINE_DEVICE_TYPE(UNIBUS_SLOT, unibus_slot_device, "unibus_slot", "DEC Unibus slot")


//**************************************************************************
//  CARD INTERFACE
//**************************************************************************

device_unibus_card_interface::device_unibus_card_interface(const machine_config &mconfig, device_t &device)
	: device_interface(device, "unibus")
	, m_unibus(nullptr)
	, m_br(0)
{
}

device_unibus_card_interface::~device_unibus_card_interface()
{
}

void device_unibus_card_interface::interface_pre_start()
{
	if (!m_unibus)
		throw emu_fatalerror("%s: Unibus card not in a Unibus slot\n", device().tag());

	device().save_item(NAME(m_br));
}

void device_unibus_card_interface::unibus_init()
{
	device().reset();
}

void device_unibus_card_interface::br_w(int level, int state)
{
	assert(level >= 4 && level <= 7);
	u8 const bit = 1 << level;
	u8 const br = state ? (m_br | bit) : (m_br & ~bit);
	if (br != m_br)
	{
		m_br = br;
		m_unibus->br_update(level);
	}
}


//**************************************************************************
//  BUS
//**************************************************************************

unibus_device::unibus_device(const machine_config &mconfig, const char *tag, device_t *owner, u32 clock)
	: device_t(mconfig, UNIBUS, tag, owner, clock)
	, m_processor(nullptr)
	, m_space(*this, finder_base::DUMMY_TAG, -1)
	, m_iopage(0760000)
	, m_br(0)
{
}

void unibus_device::device_start()
{
	save_item(NAME(m_br));
}

void unibus_device::add_card(device_unibus_card_interface &card)
{
	card.set_unibus(*this);
	m_cards.emplace_back(card);
}

void unibus_device::set_processor(device_unibus_card_interface &cpu, offs_t iopage)
{
	m_processor = &cpu;
	m_iopage = iopage;
}

// the processor's address of a Unibus address: the I/O page is where the processor sees it, the
// rest of the Unibus is the processor's memory
offs_t unibus_device::cpu_address(offs_t addr) const
{
	if (!m_space.found())
		throw emu_fatalerror("%s: no processor on the Unibus\n", tag());
	if (addr >= 0760000)
		return addr - 0760000 + m_iopage;
	if (addr >= m_iopage)
		throw emu_fatalerror("%s: Unibus address %06o is not reachable by the processor\n", tag(), addr);
	return addr;
}

void unibus_device::install_ram(offs_t start, offs_t end, void *base)
{
	m_space->install_ram(cpu_address(start), cpu_address(end), base);
}

void unibus_device::init_w()
{
	for (device_unibus_card_interface &card : m_cards)
		if (&card != m_processor)
			card.unibus_init();
}

// a request line of the bus follows the cards requesting at that level
void unibus_device::br_update(int level)
{
	u8 const bit = 1 << level;
	bool state = false;
	for (device_unibus_card_interface &card : m_cards)
		if (card.m_br & bit)
		{
			state = true;
			break;
		}
	if (state != bool(m_br & bit))
	{
		m_br ^= bit;
		if (m_processor)
			m_processor->unibus_br_w(level, state ? ASSERT_LINE : CLEAR_LINE);
	}
}

// the grant goes down the chain: the first card with a request at that level answers it
int unibus_device::irq_ack(int level)
{
	u8 const bit = 1 << level;
	for (device_unibus_card_interface &card : m_cards)
		if (&card != m_processor && (card.m_br & bit))
			return card.unibus_irq_ack(level);
	return -1;
}


//**************************************************************************
//  SLOT
//**************************************************************************

unibus_slot_device::unibus_slot_device(const machine_config &mconfig, const char *tag, device_t *owner, u32 clock)
	: device_t(mconfig, UNIBUS_SLOT, tag, owner, clock)
	, device_single_card_slot_interface<device_unibus_card_interface>(mconfig, *this)
	, m_unibus(*this, finder_base::DUMMY_TAG)
{
}

// cards are added in slot order, the order of the bus grant chain
void unibus_slot_device::device_resolve_objects()
{
	device_unibus_card_interface *const card = get_card_device();
	if (card)
		m_unibus->add_card(*card);
}
