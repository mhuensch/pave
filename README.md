# brew
Script to setup new install of OSX


mkdir -p /tmp/pave \
  && cd /tmp/pave \
  && curl -L -o pave.zip "https://github.com/run00/brew/archive/master.zip" | unzip -q -o pave.zip \
  && cd brew-master \
  && sh ./install.sh \
  && sh ./config.sh
