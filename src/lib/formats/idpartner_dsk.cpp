// license:BSD-3-Clause
// copyright-holders:Miodrag Milanovic
/*********************************************************************

    formats/idpartner_dsk.cpp

    Iskra Delta Partner format

*********************************************************************/

#include "formats/idpartner_dsk.h"

idpartner_format::idpartner_format() : upd765_format(formats)
{
}

const char *idpartner_format::name() const
{
	return "idpartner";
}

const char *idpartner_format::description() const
{
	return "Iskra Delta Partner disk image";
}

const char *idpartner_format::extensions() const
{
	return "img";
}

// Unverified gap sizes.
const idpartner_format::format idpartner_format::formats[] = {
	{
		floppy_image::FF_525, floppy_image::DSDD, floppy_image::FM,
		2000,
		18, 73, 2,
		256, {},
		1, {},
		40, 20, 12, 40 // need check
	},
	{}
};

const idpartner_format FLOPPY_IDPARTNER_FORMAT;
