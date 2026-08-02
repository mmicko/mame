// license:BSD-3-Clause
// copyright-holders:Vas Crabb
/***************************************************************************

    nanosvg.h

    NanoSVG helpers.

***************************************************************************/
#ifndef MAME_LIB_UTIL_NANOSVG_H
#define MAME_LIB_UTIL_NANOSVG_H

#include "thorvg/inc/thorvg.h"

#include <memory>


namespace util {

struct tvg_deleter
{
	void operator()(tvg::Picture *ptr) const
	{
		if (ptr)
			ptr->unref();
	}
};

using tvg_picture_ptr = std::unique_ptr<tvg::Picture, tvg_deleter>;

} // namespace util

#endif // MAME_LIB_UTIL_NANOSVG_H
