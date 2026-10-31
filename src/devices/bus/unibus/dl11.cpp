// license:BSD-3-Clause
// copyright-holders:Miodrag Milanovic
/**********************************************************************

    DEC DL11 serial line unit

**********************************************************************/

#include "emu.h"
#include "dl11.h"


DEFINE_DEVICE_TYPE(UNIBUS_DL11, unibus_dl11_device, "unibus_dl11", "DEC DL11 serial line unit")


unibus_dl11_device::unibus_dl11_device(const machine_config &mconfig, const char *tag, device_t *owner, u32 clock)
	: device_t(mconfig, UNIBUS_DL11, tag, owner, clock)
	, device_unibus_card_interface(mconfig, *this)
	, m_dl11(*this, "dl11")
	, m_rs232(*this, "rs232")
{
}

void unibus_dl11_device::device_add_mconfig(machine_config &config)
{
	DL11(config, m_dl11, XTAL(4'608'000));
	m_dl11->set_rxc(9600);
	m_dl11->set_txc(9600);
	m_dl11->set_rxvec(060);
	m_dl11->set_txvec(064);
	m_dl11->txd_wr_callback().set(m_rs232, FUNC(rs232_port_device::write_txd));
	m_dl11->txrdy_wr_callback().set(FUNC(unibus_dl11_device::update_br));
	m_dl11->rxrdy_wr_callback().set(FUNC(unibus_dl11_device::update_br));

	RS232_PORT(config, m_rs232, default_rs232_devices, "terminal");
	m_rs232->rxd_handler().set(m_dl11, FUNC(dl11_device::rx_w));
}

void unibus_dl11_device::device_start()
{
	unibus().install_device(0777560, 0777567,
			read16sm_delegate(*m_dl11, FUNC(dl11_device::read)), write16s_delegate(*m_dl11, FUNC(dl11_device::write)));
}

void unibus_dl11_device::unibus_init()
{
	m_dl11->reset();
	update_br();
}

void unibus_dl11_device::update_br(int state)
{
	br_w(4, m_dl11->z80daisy_irq_state() ? ASSERT_LINE : CLEAR_LINE);
}

int unibus_dl11_device::unibus_irq_ack(int level)
{
	int const vec = m_dl11->z80daisy_irq_ack();
	update_br();
	return vec;
}
