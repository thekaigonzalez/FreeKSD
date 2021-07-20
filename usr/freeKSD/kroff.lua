
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
        if args["FILE"] == nil then
            parser:send_help()
        end
        local warnings = false
        local outfile = args["output"]

        if args["verbosity"] == 1 then
            print("1.0-rc1")
        end

        if args["warn"] == "all" then
            warnings = true
        end

        if file_exists("usr/share/man-doc/" .. args["FILE"] .. ".lua") then
            --Name
            --Synopsis
            --Description
            --Copyright
            local doc = require("usr.share.man-doc." .. args["FILE"])
            if doc:Name() == nil and warnings == true then
                print("Warning! doc:Name() doesn't exist! Program may fail to compile. [-Wall] [-Wdoc-exist-nouse]")
            end
            if doc:Synopsis() == nil and warnings == true then
                print("Warning! doc:Synopsis() doesn't exist! Program may fail to compile. [-Wall] [-Wdoc-exist-nouse]")
            end
            if doc:Description() == nil and warnings == true then
                print("Warning! doc:Description() doesn't exist! Program may fail to compile. [-Wall] [-Wdoc-exist-nouse]")
            end
            if doc:Copyright() == nil and warnings == true then
                print("Warning! doc:Copyright() doesn't exist! Program may fail to compile. [-Wall] [-Wdoc-exist-nouse]")
            end
            --print(ar[2] .. "(" .. manpage.Position .. ") ".. manpage:Series() .. " " .. ar[2] .. "(" .. manpage.Position .. ") ")
            --print("\nNAME\n\t" .. manpage:Name() .. "\nDESCRIPTION\n\t" .. manpage:Description() .. "\nSYNOPSIS\n\t" .. manpage:Synopsis() .. "\nCOPYRIGHT\n\tThis document is licensed under the " .. manpage:Copyright())
            local file = io.open(args["output"], "w")

            file:write([[
<html lang="en-US">
<style>
h3 {
    color: #A00000;font-family:'helvetica', sans-serif;
    padding-top: 5%;
}
html, body {
    background-color: #fcfcfc;
    font-family: sans-serif;
    font-size: 100%;
    color: #181818;
}

body {
    margin-top: 0;
    margin-left: 0;
    margin-right: 0;
}
pre {
    margin-left: 8px;
}
h1, h2, h3, h4, h5, h5 {
    font-family: helvetica, sans-serif;
    font-weight: normal;
    margin-left: 8px;
    margin-right: 8px;
    margin-top: 25px;
}
pre{
    padding: 1px;
    font-size: 15px;
}

h2{ font-family: 'PT Mono', serif;font-size: 15px;text-align: center;}

</style>

<h2><strong>]] .. args["FILE"] .. [[(]] .. doc.Position .. [[) ]] .. doc:Series() .. [[ ]] .. args["FILE"] .. [[(]] .. doc.Position .. [[)</strong></h2>

<h3><strong>NAME</strong></h3>

<pre>
    ]] .. doc:Name() .. [[
</pre>


<h3><strong>DESCRIPTION</strong></h3>

<pre>
    ]] .. doc:Description() .. [[
</pre>


<h3><strong>SYNOPSIS</strong></h3>

<pre>
    ]] .. doc:Synopsis() .. [[
</pre>



<h3><strong>COPYRIGHT</strong></h3>

<pre>
    This project is licensed under the ]] .. doc:Copyright() .. [[.
</pre>
                ]])
            file:close()

        end
    end)
    if success then return 0x0001 else print("ERROR: " .. failmsg)return 0x0000 end -- just to silence errors
end

return self