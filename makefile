# FreeKSD is licensed under the GNU AFFERO GENERAL PUBLIC LICENSE
# Deriving from it's base, Kux's license.
all:
	g++ src/initial.cpp -std=c++11 -llua5.3 -o freeKSD
	
	g++ lib/http.cpp -std=c++11 -lcpr -shared -fPIC -llua5.3 -o ./libhttp.so
	g++ lib/posix_thread_sleep.cpp -std=c++11 -lcpr -shared -fPIC -llua5.3 -o ./libposix.so
	g++ lib/luafs.cpp -std=c++17 -lcpr -shared -fPIC -llua5.3 -o ./libfs.so
	g++ lib/libsys.cpp -std=c++17 -lcpr -shared -fPIC -llua5.3 -o ./libsyscalls.so
	g++ lib/System/MemoryIO.cpp -std=c++17 -lcpr -shared -fPIC -llua5.3 -o ./libmemio.so
	g++ lib/LinkLib.cpp -std=c++17 -lcpr -shared -fPIC -llua5.3 -o ./lua-dev.so
	gcc lib/symlib.c -fPIC -llua5.3 -shared -Wall -o ./symlib.so
	g++ lib/lsdir.cpp -std=c++17 -fPIC -llua5.3 -shared -Wall -o ./libsfs.so
