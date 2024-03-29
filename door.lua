function door(client)

    local IO_PIN = 1

    gpio.mode(IO_PIN, gpio.INPUT, gpio.PULLUP)

    last_state = gpio.read(IO_PIN)

    t = tmr.create()
    t:register(1000, tmr.ALARM_AUTO, function() 
        door_state = gpio.read(IO_PIN)
        print("Door state: " .. door_state)
        client:publish("/iot/cave/door0/" .. node.chipid(), door_state, 0, 0, function(client) print("sent") end)
    end)
    t:start()
end
