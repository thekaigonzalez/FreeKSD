local TermLoginManager = {}
function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end
function TermLoginManager:Invoke()
    if file_exists("etc/passwd") then
        require("freeKSD.system.Terminal"):Terminal(0x0001); -- The terminal checks for this sign that the login succeeded.
    else
        print("FreeKSD User setup")
        io.write("Enter a UserName: ")
        username = io.read()
        --- CHECK FOR READ ERRORS!
        if username == nil then
            print("username read error!")
            return nil
        else
            io.write("\nEnter a Password: ")
            password = io.read()
            if password == nil then
                print("password read error!")
                return nil
            else
                print("creating user...")
                local pwd = io.open("etc/passwd", "w")
                if pwd == nil then
                    print("filesystem error! invalid session.")
                    return nil
                else
                    pwd:write(username .. "\n" .. password)
                    pwd:close()
                    require("freeKSD.system.Terminal"):Terminal(0x0001);
                end
            end
        end
    end
end

return TermLoginManager