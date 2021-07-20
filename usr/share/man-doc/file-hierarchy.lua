---copied template from pull.mandoc

local doc = {}

doc.Position = "7"

--- Shows up as "NAME" in the manpage
function doc:Name()
    return "file-hierarchy - General File Hierarchy and descriptions for files"
end
--- a brief overview of what it does and the commands
function doc:Synopsis()
    return "An Overview of the file hierarchy of FreeKSD."
end

function doc:Description()
    return [[
        /freeKSD/
            Contains freeKSD system Files and helper functions that help FreeKSD function correctly.

        /lib/
            Contains GKux C and C++ headers for Lua.

        /usr/
            Contains User Cache directories and development environments

        /usr/bin/
            Contains installer files and code.

        /usr/bootloader/
            FREEKSD 1.3 DEPRECATION:
                All System files are self-contained in /freeKSD.
                This no longer contains FreeKSD Files.
                This is archived for historical purposes and contains a FreeKSD API specifically tailored for running this.
            Contains DSH Bootloader files for loading the Default shell.

        /usr/dsh/
            FREEKSD 1.3 DEPRECATION:
                Command files are in /usr/freeKSD/
                No longer in usr/dsh.
                This is archived for historical purposes and is able to be used as a Command extension for FreeKSD.
            Contains commands for the `dsh`.

        /usr/dversion/
            FREEKSD 1.3 DEPRECATION:
                Version files are not available in FreeKSD as of 1.3.
                This is still in use by Default Shell APIs.
            Contains DSH Version manifests.

        /usr/freeKSD/
            Contains FreeKSD Command files and logic.

        /usr/include
            Contains Lua APIs used by include(2)

        /usr/sbin
            Contains Debug commands and core commands for freeKSD.

        /usr/share
            Contains shared files between commands. Place files HERE!

        /bootmgr/
            Contains boot managers and external boots for FreeKSD and general systems.

        /src/
            Source files for Kux.

        /etc/
            Contains SHARED SYSTEM FILES.

        /docs/
            HTML Documentation.

        /bin/
            FREEKSD 1.3 DEPRECATION:
                May not be available.
    ]]
end

function doc:Copyright()
    return "MIT License"
end

function doc:Series()
    return "GKux/FreeKSD System Overview"
end

return doc