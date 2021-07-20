# FreeKSD
FreeKSD is an production ready, Modern-day Unix-Shell based application which is based off of the original [Kux System](https://github.com/thekaigonzalez/Kux)

Open ./KSD to get started after building.

FreeKSD Works simultaneously with The default shell, as
well as run files in a venv which prevents crashes to the default shell.

FreeKSD Provides updates for the boot chooser,
Kux Shell, and the overall entire Kux filesystem.

FreeKSD as well as working with Kux's default shell,
can also run files made by the `dsh` and supports many other command pallets such as 
coreutils.

FreeKSD aims to provide more security compared to Kux,
And prevent crashes.

FreeKSD uses Kux, And Kux Contains

- Http library
- Symbol Searching Library
- Lua Loader
- Portable Sleeping Library
- Posix library
- Portable System Calls library
- Simple Loader
- Linux man-page style documentation (https://thekaigonzalez.github.io/Kux/head/)

Kux is completely from scratch. No external libraries except for maybe luarocks are used.

## Kux VS KTerminal VS FreeKSD: How do they compare?

Well, Kux is a performant, Dynamic terminal written in C++ and Lua, with a little C innit ;)

KTerminal, is a bulky bash replication written in Python

Kux

- written in lua & C
- Contains runtimes for running Kux apps
- Contains solid Lua APIs which interface with C++ standard apis.
- No Unnecessary Codes
- Open Source

KTerminal

- Written in Python
- Bulky and slow when it comes to HTTP Get Requests.
- Contains unnecessary codes which slow KTerminal up.
- Contains lots of commands
- Open Source

FreeKSD

- Support for native APIs, and the Kux Default shell
- Runs all code in Safe mode to prevent crashes
- Works with the Kux System and uses 100% pure headers
- Open Source
- Adds better native Support for external systems
- A Flavor of Kux instead of a rewrite


### Performance Comparison

Kux is approximately a SECOND faster than KTerminal.

## The Filesystem
The Filesystem rule is (Unix x86 Format).

# FreeKSD
