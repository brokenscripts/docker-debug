# docker-debug
Includes:
- gdb [Peda & Gef]  
- Ghidra
- Checksec.sh
- FireEye FLOSS
- Radare2 [Cutter]
- xxd  
- binwalk
- ltrace
- strace
- binutils [readelf, strings, nm, ld, as, etc]
- python2
- python3

### Run Command Example
```docker run --rm -it --privileged -v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -v ${HOME}/Containers/DebugMe:/DebugMe -e "DISPLAY=unix${DISPLAY}" brokenscripts/debug```
