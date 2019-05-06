# docker-debug
Includes:
- gdb 
    - PEDA (https://github.com/longld/peda)
    - GEF (https://github.com/hugsy/gef)
- Ghidra (https://ghidra-sre.org/)
- Checksec.sh (https://github.com/slimm609/checksec.sh)
- FireEye FLOSS (https://github.com/fireeye/flare-floss)
- Radare2 (https://rada.re/r/) 
    - Cutter (https://github.com/radareorg/cutter)
- xxd  
- binwalk
- ltrace
- strace
- binutils [readelf, strings, nm, ld, as, etc]
- python2 
    - PWNTools (http://docs.pwntools.com/en/stable/) 
    - ROPGadget (https://github.com/JonathanSalwan/ROPgadget)
    - Capstone (http://www.capstone-engine.org/) 
- python3
- Veles (https://codisec.com/veles/)

### Run Command Example
```
docker run --rm -it --privileged \
-v /etc/localtime:/etc/localtime:ro \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v ${HOME}/Containers/DebugMe:/DebugMe \
-e "DISPLAY=unix${DISPLAY}" \
brokenscripts/debug
```
