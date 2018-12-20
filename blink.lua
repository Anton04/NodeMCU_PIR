function blink() 
    gpio.write(4,0)
    --gpio.write(4,0)
    --gpio.write(4,0)
    --gpio.write(4, 1)
    tmr.alarm(1, 1, 0, function () gpio.write(4, 1) end)
end

gpio.mode(4, gpio.OUTPUT)
tmr.alarm(0, 500, 1, blink)