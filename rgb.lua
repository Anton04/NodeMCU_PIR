
pwm.setup(6, 500, 0)
pwm.setup(7, 500, 0)
pwm.setup(8, 500, 0)
pwm.start(6)
pwm.start(7)
pwm.start(8)

function led(r, g, b)
    pwm.setduty(6, g)
    pwm.setduty(7, b)
    pwm.setduty(8, r)
end
 
--led(512, 0, 0) --  set led to red
--led(0, 0, 512) -- set led to blue.

c = 0
v = 0
a = 0
 
tmr.alarm(1,50,tmr.ALARM_AUTO, function()
    v = (adc.read(0) - 70) * 1.5

    a = a + (v-c)/5

    if a > 20 then
        a=20
    end

    if a < -20 then 
        a=-20
    end
        
    c= c + a

    if c==v then
        a=0
    end

    if c>512 then
        c=512
    end

    if c<0 then
        c=0
    end
    
    led(c, c, c)

    print(v,c)
end)

