#!/bin/bash

# This is specifically meant to run on an ESXi host that doesn't posess the dmidecode command.
# Run smbiosDump to collect the data then Sedify this thing and pull out the data we want
smbiosDump | sed -nr \
        '/^(Memory\ Device\|Size\:\|Form\ Factor\:\|Locator\:\|Speed\:\|Serial\ Number\:|Part\ Number\:)$/p' \
        >> /tmp/memorySlots.txt
