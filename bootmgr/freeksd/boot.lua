--- FREEKSD
local freeKSD           = {}
--[[

FreeKSD is a fast, interoperable Kux-based system for effeciently managing 
tasks.

]]

function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end


freeKSD_Sys = {}
freeKSD_Sys.argv = {}
function freeKSD.gAddArguments(string)
    local lns = split(string, " ")
    i = 0
    -- works!
    for _,V in ipairs(lns) do
        process.argv[i] = V;
        i = i + 1
    end
end

function OneTimeSplit(string)
    local tblt = {}
    local lns = split(string, " ")
    i = 0
    -- works!

    for _,V in ipairs(lns) do
        tblt[i] = V;
        i = i + 1
    end
    return tblt
end

freeKSD_Sys.argc = #

-- HTTP Functions
-- head/libraries/libhttp.html
require("libhttp")

-- Filesystem Listings functions
-- No documentation available currently!
require("libsfs")

-- We Need the Current working directory function.
-- head/libraries/libfs.html
require("libfs")

-- We Just need this for memory functions
-- head/libraries/libmemio.html
require("libmemio")

--- lets initialize our kernel with the obj:bmain() function.
function freeKSD:bmain()
    -- Kux at it's core Doesn't Implement any default functions or string libraries.
    -- we're planning to only use the standard libraries which means prevention of using OSDEV/shared.lua
    -- We can also implement functions into our program from OSDev.
    -- First, we're going to invoke a core System feature, TermLoginManager.
    require("freeKSD.system.TermLoginManager"):Invoke()
end

return freeKSD;
