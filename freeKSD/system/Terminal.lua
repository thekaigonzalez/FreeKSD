require('freeKSD.system.HexDecoder')

local Terminal = {}

function Terminal:Terminal(LOGIN_CODE)
    if GetHString(LOGIN_CODE) == "F_OK" then
        print("successful login at " .. os.date())
        local log_tmp = io.open("etc/sudo.log", "a")
        if log_tmp == nil then
            print("log read/write error.")
        else
            log_tmp:write("[User] login shell initialized at " .. os.date() .. "\n")
            log_tmp:close()
            print("log has been saved to etc/sudo.log")
        end
        print("\nType 'help' for a list of commands.")
        while LOGIN_CODE == 0x0001 do -- lets not do while (true), Because we want a layer of security to prevent crashes on the system itself.
            local uxinput = io.read()

            local argv = OneTimeSplit(uxinput)
            --- objects usually don't throw exceptions until they're indexed. So lets try this..
            local dshobject = require('usr.dsh.' .. argv[0])
            local freeKSDObject = require('usr.FreeKSD.' .. argv[0])
            local CoreUtilObject = require('usr.sbin.' .. argv[0])
        end

    else
        -- if token/LOGIN_CODE is not F_OK, It's not the process we're looking for.
        print("couldn't start process Terminal.Terminal: invalid token")
        return nil
    end
end


return Terminal