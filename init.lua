
require "network"
require "messaging"
require "door"

tmr.alarm(0, 3000, 0, function() 
    connect_wifi(function()
        connect_mqtt(function(client) 
            door(client)
        end)
    end)
end)
