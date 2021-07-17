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
        while LOGIN_CODE == 0x0001 do
            -- lets not do while (true), Because we want a layer of security to prevent crashes on the system itself.
            io.write("> ")
            local uxinput = io.read()

            local argv = OneTimeSplit(uxinput)

            local DSHPath = "usr/dsh/" .. argv[0] .. ".lua"
            local FreeKSDPath = "usr/freeKSD/" .. argv[0] .. ".lua"
            local CoreUtilObject = "usr/sbin/" .. argv[0] .. ".lua"
            if file_exists(DSHPath) then
                if loadfile("usr/dsh/" .. argv[0] .. ".lua") then
                    local dshobject = require('usr.dsh.' .. argv[0])
                    if pcall(function()
                        dshobject:Main(argv)
                    end) then

                    else
                        print("error in program")
                    end
                else
                    print(argv[0] .. ".lua: " .. " Program failed to Memory-Compile while trying to preload.")
                end


            elseif file_exists(FreeKSDPath) then

                if loadfile("usr/freeKSD/" .. argv[0] .. ".lua") then

                    local freeKSDObject = require('usr.freeKSD.' .. argv[0])
                    local status, err = pcall(function()
                        freeKSDObject:main(argv)
                    end)
                    if status then
                        --- do nothing!
                    else
                        print("Error in program thread: " .. err)
                    end
                else
                    print(argv[0] .. ".lua: " .. " Program failed to Memory-Compile while trying to preload.")
                end

            elseif file_exists(CoreUtilObject) then
                if loadfile("usr/sbin/" .. argv[0] .. ".lua") then

                    local CoreUtilObjectT = require('usr.sbin.' .. argv[0])
                    if pcall(function()
                        CoreUtilObjectT:main(argv)
                    end) then
                        --- do nothing!
                    else
                        local success, err = pcall(function()
                            CoreUtilObjectT:Main(argv)
                        end)
                        if not success then
                            print("Error in program thread: " .. err)
                        end
                    end
                else
                    print(argv[0] .. ".lua: " .. " Program failed to Memory-Compile while trying to preload.")
                end


            else
                print(argv[0] .. ": Command not found.")
            end
        end

    else
        -- if token/LOGIN_CODE is not F_OK, It's not the process we're looking for.
        print("couldn't start process Terminal.Terminal: invalid token")
        return nil
    end
end

return Terminal