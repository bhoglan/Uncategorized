#!/bin/sh

# This is specifically meant to run on an ESXi host that doesn't posess the dmidecode command.
# Run smbiosDump to collect the data then Sedify this thing and pull out the data we want
smbiosDump | sed \
	-e '/Memory\sDevice/b' -e '/Size\:/b' -e '/Form\sFactor\:/b' -e '/Locator\:/b' -e '/Speed\:/b' -e '/Serial\sNumber\:/b' -e '/Part\sNumber:/b' -e d \
	>> /tmp/memorySlots.txt
