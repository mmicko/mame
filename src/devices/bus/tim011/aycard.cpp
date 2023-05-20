// license:BSD-3-Clause
// copyright-holders:Marko Solajic, Miodrag Milanovic
/**********************************************************************

    TIM-011 AY Card

**********************************************************************/

#include "emu.h"
#include "aycard.h"
#include "speaker.h"

//**************************************************************************
//  DEVICE DEFINITIONS
//**************************************************************************

DEFINE_DEVICE_TYPE(TIM011_AYCARD, tim011_aycard_devices, "ay", "AY card")


//-------------------------------------------------
//  device_add_mconfig - add device configuration
//-------------------------------------------------

void tim011_aycard_devices::device_add_mconfig(machine_config &config)
{
	/* sound hardware */
	SPEAKER(config, "mono").front_center();
	AY8912(config, m_psg, 1.843_MHz_XTAL);
	m_psg->add_route(ALL_OUTPUTS, "mono", 0.25);
}

//**************************************************************************
//  LIVE DEVICE
//**************************************************************************

//-------------------------------------------------
//  tim011_aycard_devices - constructor
//-------------------------------------------------

tim011_aycard_devices::tim011_aycard_devices(const machine_config &mconfig, const char *tag, device_t *owner, uint32_t clock)
	: device_t(mconfig, TIM011_AYCARD, tag, owner, clock)
	, device_tim011_expansion_interface(mconfig, *this)
	, m_psg(*this, "ay8912")
{
}


//-------------------------------------------------
//  device_start - device-specific startup
//-------------------------------------------------

void tim011_aycard_devices::device_start()
{
}


//**************************************************************************
//  IMPLEMENTATION
//**************************************************************************

uint8_t tim011_aycard_devices::iorq_r(offs_t offset)
{
	switch (offset)
	{
	case 0x1c:
		return m_psg->data_r();
		break;
	default:
		return 0xff;
	}
}

void tim011_aycard_devices::iorq_w(offs_t offset, uint8_t data)
{
	switch (offset)
	{
	case 0x14:
		m_psg->data_w(data);
		break;
	case 0x1c:
		m_psg->address_w(data);
		break;
	}
}
