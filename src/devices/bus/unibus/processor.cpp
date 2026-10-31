// license:BSD-3-Clause
// copyright-holders:Miodrag Milanovic
/**********************************************************************

    DEC Unibus processors

**********************************************************************/

#include "emu.h"
#include "processor.h"


DEFINE_DEVICE_TYPE(UNIBUS_KA11,  unibus_ka11_device,  "unibus_ka11",  "DEC KA11 processor (PDP-11/20)")
DEFINE_DEVICE_TYPE(UNIBUS_KD11B, unibus_kd11b_device, "unibus_kd11b", "DEC KD11-B processor (PDP-11/05)")


//**************************************************************************
//  PROCESSOR BASE
//**************************************************************************

unibus_processor_device::unibus_processor_device(const machine_config &mconfig, device_type type, const char *tag, device_t *owner, u32 clock)
	: device_t(mconfig, type, tag, owner, clock)
	, device_unibus_card_interface(mconfig, *this)
	, m_cpu(*this, "cpu")
{
}

void unibus_processor_device::connect_cpu()
{
	m_cpu->set_iopage(IOPAGE);
	m_cpu->set_addrmap(AS_PROGRAM, &unibus_processor_device::mem);
	m_cpu->set_irq_acknowledge_callback(FUNC(unibus_processor_device::irq_ack));
	// the RESET instruction asserts INIT
	m_cpu->out_reset().set([this] (int state) { if (state) unibus().init_w(); });

	auto *const slot = dynamic_cast<unibus_slot_device *>(owner());
	if (slot)
	{
		unibus_device &bus = slot->config_unibus();
		bus.set_space(m_cpu, AS_PROGRAM);
		bus.set_processor(*this, IOPAGE);
	}
}

void unibus_processor_device::mem(address_map &map)
{
	map(0000000, 0177777).rw(FUNC(unibus_processor_device::nxm_r), FUNC(unibus_processor_device::nxm_w));
	map(0177570, 0177571).r(FUNC(unibus_processor_device::swr_r)).nopw();
}

// no response from the bus: the processor takes a timeout trap
u16 unibus_processor_device::nxm_r()
{
	m_cpu->bus_error();
	return 0;
}

void unibus_processor_device::nxm_w(u16 data)
{
	m_cpu->bus_error();
}

void unibus_processor_device::unibus_br_w(int level, int state)
{
	m_cpu->set_input_line(t11_device::BUS_BR4_LINE + level - 4, state);
}

IRQ_CALLBACK_MEMBER(unibus_processor_device::irq_ack)
{
	if (irqline >= t11_device::BUS_BR4_LINE && irqline <= t11_device::BUS_BR7_LINE)
		return unibus().irq_ack(irqline - t11_device::BUS_BR4_LINE + 4);
	return 0;
}


//**************************************************************************
//  PROCESSOR CARDS
//**************************************************************************

unibus_ka11_device::unibus_ka11_device(const machine_config &mconfig, const char *tag, device_t *owner, u32 clock)
	: unibus_processor_device(mconfig, UNIBUS_KA11, tag, owner, clock)
{
}

void unibus_ka11_device::device_add_mconfig(machine_config &config)
{
	KA11(config, m_cpu, 4'000'000);
	connect_cpu();
}

unibus_kd11b_device::unibus_kd11b_device(const machine_config &mconfig, const char *tag, device_t *owner, u32 clock)
	: unibus_processor_device(mconfig, UNIBUS_KD11B, tag, owner, clock)
{
}

void unibus_kd11b_device::device_add_mconfig(machine_config &config)
{
	KD11B(config, m_cpu, 4'000'000);
	connect_cpu();
}
