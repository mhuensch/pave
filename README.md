# brew
Script to setup new install of OSX


mkdir -p /tmp/pave \
&& curl -L -o /tmp/pave/pave.zip "https://github.com/run00/brew/archive/master.zip" \
&& unzip -q -o -d /tmp/pave /tmp/pave/pave.zip \
&& sh /tmp/pave/brew-master/install.sh \
&& sh /tmp/pave/brew-master/config.sh
