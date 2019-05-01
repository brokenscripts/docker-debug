FROM openjdk:11-slim
LABEL maintainer="Thomas"

# (?<=<code>)(.*)(?=  )
# (?<=<code>) -- Matches <code> without including it in the results (Positive Lookbehind)
# (.*) -- Capture group to get what I want AFTER <code>
# (?=  ) -- Matches two spaces after my group above and does not include it in results (Positve Lookahead)

# docker run --rm -it --privileged -v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -v ${HOME}/Containers/DebugMe:/DebugMe -e "DISPLAY=unix${DISPLAY}" brokenscripts/debug

RUN apt-get update \
    && apt-get install -y wget \
        curl \
        gettext-base \
        patch \
        gdb \
        binutils \
        binwalk \
        python \
        python3 \
        git \
        xxd \
        ltrace \
        strace \
        radare2 \
        openssl \
        procps \
        python-pip \
        python3-pip \
        python-dev \
        libssl-dev \
        libffi-dev \
        build-essential \
        fuse \
    && githubbase=https://github.com/ \
    && ghidra_ver=$(curl https://ghidra-sre.org/ | grep -oP "(?<=  )(ghidra.*zip)(?=</code>)") \
    && ghidra_ssh=$(curl https://ghidra-sre.org/ | grep -oP "(?<=<code>)(.*)(?=  )") \
    && wget --progress=bar:force -O /tmp/ghidra.zip "https://ghidra-sre.org/$ghidra_ver" \
    && echo "$ghidra_ssh /tmp/ghidra.zip" | sha256sum -c - \
    && unzip /tmp/ghidra.zip -d /ghidra \
    && rm /tmp/ghidra.zip \
    && mv /ghidra/*/* /ghidra \
    && chmod +x /ghidra/ghidraRun \
    && ln -s /ghidra/ghidraRun /usr/bin/ghidra \
    && wget -O ~/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py \
    && git clone https://github.com/longld/peda.git ~/peda \
    && echo source ~/peda/peda.py >> ~/.gdbinit \
    && git clone --depth 1 https://github.com/slimm609/checksec.sh \
    && ln -s /checksec.sh/checksec /usr/bin/checksec \
    && wget -O /usr/bin/floss https://s3.amazonaws.com/build-artifacts.floss.flare.fireeye.com/travis/linux/dist/floss \
    && chmod +x /usr/bin/floss \
    && cutteruri=$(curl -L https://github.com/radareorg/cutter/releases/latest | grep -oP "(?<=href=\"/)(radareorg.*AppImage)(?=\")") \
    && wget --progress=bar:force -O /usr/bin/cutter $githubbase$cutteruri \
    && chmod +x /usr/bin/cutter \
    && rm -rf /var/lib/apt/lists/* \
        /var/cache/apt/archives \
        /tmp/* \
        /var/tmp/* \
        /ghidra/docs

ENTRYPOINT [ "bash" ]
