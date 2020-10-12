# AWACS Bandog
solitary

## What does it do?
It functions as a watchdog. I used a raspi for this, but you could use anything. Don't put the DRAC on an internet exposed network, though.

## How do I use it?
You'll probably need to change IPs and all, but whatever. I used some cheapo Linksys router I found in a dumpster as a switch, connecting an ethernet port on my PE2950, the DRAC's ethernet port, and the raspi together.

## Is it good?
no

## What does it require?
Lua, LuaSockets, systemd

## systemd bad
yes