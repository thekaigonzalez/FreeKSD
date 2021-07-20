# FreeKSD Terminal
## Hex Codes
### F_OK
F_OK (0x0001) is a hex code that signals the program has successfully executed.
### F_FAILED
F_FAILED (0x0000) Is a hex code signaling the program has FAILED to execute, Usually called after
checking nil values and successfully or unsuccessfully executing code.
### F_UPSTREAMEXECUTION
F_UPSTREAMEXECUTION (0x0003) Is a hex code signaling the program has
finished executing and has values which are to be passed into other apps.
## FreeKSD Errors
This section explains the meanings behind errors in Lua commands and programs.
### error in program

Severity: 1

Command Series: Default Shell `dsh`


The "error in program" Error happens when a `DSH_RuntimeError` occurs.

Runtime Errors are caused by broken lua code after certain periods of time,
or runtime errors caused by lua. (example, Out of lexical scope in a for loop.)

### Error in program Thread

Severity: 2

Command Series: FreeKSD `KSD`, CoreUtil `sbin`.

"Error in program thread" Shows when after **ALL** unit tests
are ran, If the program thread fails to run, the error will show.

### Program failed to Memory-Compile while trying to preload.

Severity: 5

Command Series: FreeKSD `KSD`, CoreUtil `sbin`, Default Shell `dsh`

FreeKSD commands are always preloaded to prevent issues in
runtime. 

That's why it's recommended to reset FreeKSD after installing Commands, etc.

The "PROG-Memfailure" occurs when a **LUA** error has occurred in the general program process.

Lua Syntax Errors, and Lexical Errors are usually the root of cause
for this message, but it could be a number of other reasons.

This is the most severe 