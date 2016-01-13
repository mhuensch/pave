# brew
Script to setup new install of OSX


mkdir -p /tmp/pave \
&& cd /tmp/pave \
&& curl -L -o pave.zip "https://github.com/run00/brew/archive/master.zip" \
   | unzip -q -o pave.zip \
   | sh ./brew-master/install.sh \
&& sh ./brew-master/config.sh
