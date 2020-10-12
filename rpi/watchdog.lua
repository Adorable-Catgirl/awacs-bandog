#!/usr/bin/env lua
local password = ""
do
	local h = io.open("/pwd.txt", "r")
	password = h:read("*a")
	h:close()
end
local socket = require("socket")
local s = socket.bind("*", 10000)
s:settimeout(0.1)
local nextcycle = os.time()
while true do
	local c = s:accept()
	if c then
		c:write("Updated.\n")
		c:close()
		nextcycle = os.time()+(60*4)
	elseif (os.time() > nextcycle) then
		os.execute("ipmitool -H 192.168.1.100 -U root -P "..password.." chassis power off")
		os.execute("sleep 15")
		os.execute("ipmitool -H 192.168.1.100 -U root -P "..password.." chassis power on")
		nextcycle = os.time()+(60*4)
	end
end
