# brew
Script to setup new install of OSX

```bash
mkdir -p /tmp/pave \
&& curl -L -o /tmp/pave/install.sh "https://github.com/DavidDugan/brew/install.sh" \
&& sh /tmp/pave/brew-master/install.sh \
&& curl -L -o /tmp/pave/config.sh "https://github.com/DavidDugan/brew/config.sh" \
&& sh /tmp/pave/brew-master/config.sh
```
