// license:BSD-3-Clause
// copyright-holders:Miodrag Milanovic
/*********************************************************************

    formats/idpartner_format.h

    Iskra Delta Partner format

*********************************************************************/
#ifndef MAME_FORMATS_IDPARTNER_DSK_H
#define MAME_FORMATS_IDPARTNER_DSK_H

#pragma once

#include "upd765_dsk.h"

class idpartner_format : public upd765_format
{
public:
	idpartner_format();

	virtual const char *name() const override;
	virtual const char *description() const override;
	virtual const char *extensions() const override;

private:
	static const format formats[];
};

extern const idpartner_format FLOPPY_IDPARTNER_FORMAT;

#endif // MAME_FORMATS_IDPARTNER_DSK_H
