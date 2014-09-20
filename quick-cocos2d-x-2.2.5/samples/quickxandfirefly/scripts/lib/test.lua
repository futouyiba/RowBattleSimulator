bit = require("bit")
send = require("send")
netManager = require("netManager")

local config = {
    HEAD_0 = 0,
    HEAD_1 = 0,
    HEAD_2 = 0,
    HEAD_3 = 0,
    ProtoVersion = 0,
    ServerVersion = 0,
}

client = netManager:getConnect("50.116.12.177", 1000, config)


client:send("firest", 2)
client:send("second", 1)
print (client:recv())
print (client:recv())

client:close()
