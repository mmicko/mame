// license:BSD-3-Clause
// copyright-holders:Nicola Salmoria, Aaron Giles
/***************************************************************************

    main.cpp

    Controls execution of the core MAME system.

***************************************************************************/

#include "emu.h"
#include "main.h"

#include "emuopts.h"
#include "http.h"

#include "thorvg/inc/thorvg.h"

machine_manager::machine_manager(emu_options& options, osd_interface& osd) :
	m_osd(osd),
	m_options(options),
	m_machine(nullptr)
{
	tvg::Initializer::init();
}


machine_manager::~machine_manager()
{
	tvg::Initializer::term();
}


void machine_manager::start_http_server()
{
	m_http = std::make_unique<http_manager>(options().http(), options().http_port(), options().http_root());
}


http_manager *machine_manager::http()
{
  return m_http.get();
}
