return function (strcode)
    if strcode == "F_OK" then
        return 0x0001
    elseif strcode == "F_FAILED" then
        return 0x0000
    elseif strcode == "F_UPSTREAMEXECUTION" then
        return 0x0003
    else
        return
    end
end