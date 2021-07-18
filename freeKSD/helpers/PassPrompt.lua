return function ()
    local GetCredentialsTable = require('freeKSD.helpers.GetCredentialsTable')
    io.write("Enter your password: ")
    local u = io.read()
    if u == GetCredentialsTable().password then
        return 0x0001
    else
        return 0x0002
    end
end