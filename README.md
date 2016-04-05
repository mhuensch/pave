# brew
Script to setup new install of OSX

```bash
mkdir -p /tmp/pave \
&& curl -L -o /tmp/pave/pave.zip "https://github.com/run00/pave/archive/master.zip" \
&& unzip -q -o -d /tmp/pave /tmp/pave/pave.zip \
&& cd /tmp/pave/pave-master \
&& sh install.sh
```
