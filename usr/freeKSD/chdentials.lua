local GetCredentialsTable = require('freeKSD.helpers.GetCredentialsTable') -- is now the function.
local PassPrompt = require('freeKSD.helpers.PassPrompt')
local Self = {}


-- changes details

function Self:main(argv)
    if (PassPrompt() == 0x0001 --[[ SUCCESS ]]) then
        print("you've successfully opened the change credentials panel.")
        print("AKA Admin Panel.")
        print("Enter a new password below.")
        io.write("$ ")
        local np = io.read()
        if np == nil then
            print("stdin read error")
        else
            local oldname =GetCredentialsTable().username
            local new = io.open("etc/passwd", "w")
            new:write(oldname .. "\n" .. np)
            new:close()
        end
    else
        print("failed: PasswordPrompt() returned 0x0000 (F_FAILED)")
    end
end

return Self