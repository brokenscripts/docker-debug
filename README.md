# docker-debug

### Run Command Example
docker run --rm -it --privileged -v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -v ${HOME}/Containers/DebugMe:/DebugMe -e "DISPLAY=unix${DISPLAY}" brokenscripts/debug
