// license:BSD-3-Clause
// copyright-holders:Marko Solajic, Miodrag Milanovic
/**********************************************************************

        TIM-011 Expansion Port emulation

**********************************************************************/

#include "emu.h"
#include "exp.h"


//**************************************************************************
//  DEVICE DEFINITIONS
//**************************************************************************

DEFINE_DEVICE_TYPE(TIM011_EXPANSION_SLOT, tim011_expansion_slot_device, "tim011_expansion_slot", "TIM-011 Expansion port")


//**************************************************************************
//  DEVICE TIM011_EXPANSION CARD INTERFACE
//**************************************************************************

//-------------------------------------------------
//  device_tim011_expansion_interface - constructor
//-------------------------------------------------

device_tim011_expansion_interface::device_tim011_expansion_interface(const machine_config &mconfig, device_t &device) :
	device_interface(device, "tim011exp")
{
	m_slot = dynamic_cast<tim011_expansion_slot_device *>(device.owner());
}


//**************************************************************************
//  LIVE DEVICE
//**************************************************************************

//-------------------------------------------------
//  tim011_expansion_slot_device - constructor
//-------------------------------------------------

tim011_expansion_slot_device::tim011_expansion_slot_device(const machine_config &mconfig, const char *tag, device_t *owner, uint32_t clock) :
	device_t(mconfig, TIM011_EXPANSION_SLOT, tag, owner, clock),
	device_single_card_slot_interface<device_tim011_expansion_interface>(mconfig, *this),
	m_card(nullptr),
	m_irq_handler(*this),
	m_nmi_handler(*this)
{
}


//-------------------------------------------------
//  device_start - device-specific startup
//-------------------------------------------------

void tim011_expansion_slot_device::device_start()
{
	m_card = get_card_device();

	// resolve callbacks
	m_irq_handler.resolve_safe();
	m_nmi_handler.resolve_safe();
}

//-------------------------------------------------
//  iorq_r
//-------------------------------------------------

uint8_t tim011_expansion_slot_device::iorq_r(offs_t offset)
{
	if (m_card)
		return m_card->iorq_r(offset);
	else
		return 0xff;
}

//-------------------------------------------------
//  iorq_w
//-------------------------------------------------

void tim011_expansion_slot_device::iorq_w(offs_t offset, uint8_t data)
{
	if (m_card)
		m_card->iorq_w(offset, data);
}

//-------------------------------------------------
//  SLOT_INTERFACE( tim011_expansion_devices )
//-------------------------------------------------


// slot devices
#include "aycard.h"

void tim011_expansion_devices(device_slot_interface &device)
{
	device.option_add("ay", TIM011_AYCARD);
}

