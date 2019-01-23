// license:BSD-3-Clause
// copyright-holders:David Haywood

// has separate input / output addresses but still uses direction registers, or I've misunderstood this entirely.

#include "emu.h"
#include "xavix2002_io.h"

#define VERBOSE 0
#include "logmacro.h"

DEFINE_DEVICE_TYPE(XAVIX2002IO, xavix2002_io_device, "xavix2002io", "XaviX 2002 IO")

xavix2002_io_device::xavix2002_io_device(const machine_config &mconfig, const char *tag, device_t *owner, uint32_t clock)
	: device_t(mconfig, XAVIX2002IO, tag, owner, clock)
	, m_space_read0_cb(*this)
	, m_space_read1_cb(*this)
	, m_space_read2_cb(*this)
	, m_out0_cb(*this)
	, m_out1_cb(*this)
	, m_out2_cb(*this)
{
}

void xavix2002_io_device::device_start()
{
	m_space_read0_cb.resolve_safe(0xff);
	m_space_read1_cb.resolve_safe(0xff);
	m_space_read2_cb.resolve_safe(0xff);

	m_out0_cb.resolve_safe();
	m_out1_cb.resolve_safe();
	m_out2_cb.resolve_safe();

	save_item(NAME(m_sx_pio_dir));
	save_item(NAME(m_sx_pio_out));
}

void xavix2002_io_device::device_reset()
{
	for (int i = 0; i < 3; i++)
	{
		m_sx_pio_dir[i] = 0;
		m_sx_pio_out[i] = 0;
	}
}

WRITE8_MEMBER(xavix2002_io_device::pio_dir_w)
{
	LOG("%s: superxavix pio_dir_w (port %d) %02x\n", machine().describe_context(), offset, data);

	if (offset < 3)
	{
		m_sx_pio_dir[offset] = data;
		// update port?
	}
}

READ8_MEMBER(xavix2002_io_device::pio_dir_r)
{
	LOG("%s: superxavix pio_dir_r (port %d)\n", machine().describe_context(), offset);

	uint8_t ret = 0x00;

	if (offset < 3)
	{
		ret = m_sx_pio_dir[offset];
	}

	return ret;
}

WRITE8_MEMBER(xavix2002_io_device::pio_out_w)
{
	LOG("%s: superxavix pio_out_w (port %d) %02x\n", machine().describe_context(), offset, data);

	if (offset < 3)
	{
		m_sx_pio_out[offset] = data;

		// look at direction register and output
	}
}

READ8_MEMBER(xavix2002_io_device::pio_out_r)
{
	LOG("%s: superxavix pio_out_r (port %d)\n", machine().describe_context(), offset);

	uint8_t ret = 0x00;

	if (offset<3)
		ret = m_sx_pio_out[offset];

	return ret;
}
	

READ8_MEMBER(xavix2002_io_device::pio_in_r)
{
	LOG("%s: superxavix pio_in_r (port %d)\n", machine().describe_context(), offset);

	uint8_t ret = 0x00;

	switch (offset)
	{
		case 0: ret = m_space_read0_cb();
		case 1: ret = m_space_read1_cb();
		case 2: ret = m_space_read2_cb();
		default: ret = 0x00;
	}

	// mask with direction register before returning

	return ret;
}
