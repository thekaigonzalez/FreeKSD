
local self = {}

function self:main(argv)
    local success,failmsg = pcall(function ()
        local nparser = include("libparse") -- "include" instead of "require" using FreeKSD Standard 1.2.
        local parser = nparser("kroff", "A simple command line utility which builds FreeKSD-Based Manual Page Files.")

        parser:argument("FILE", "FILE to be transpiled. Must end in .lua and be available in local filesystem.")
        parser:flag("-v --version", "sends version information")
              :count "*"
              :target "verbosity"
        parser:option("-o --output", "Chooses an output file usually ending with *.html", "a.html")
        parser:option("-W --warn", "Sets WARNINGS.")

        local args = parser:parse(argv)

        local warnings = false
        local outfile = args["output"]

        if args["verbosity"] == 1 then
            print("1.0-rc1")
        end

        if args["warn"] == true then
            warnings = true
        end


        print("warnings: " .. args["warn"] .. "\nOutput: " .. outfile .. "\n")
        end)
    if not success then return 0x0001 else return 0x0000 end -- just to silence errors
end

return self