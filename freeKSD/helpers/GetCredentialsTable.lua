return function ()
    local ctable = {}
    local i = 0
    for V in io.open("etc/passwd"):lines() do
        if i == 0 then
            ctable.username = V
        elseif i == 1 then
            ctable.password = V
        end
        i = i + 1
    end
    return ctable
end