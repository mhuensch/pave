# brew
Script to setup new install of OSX.  System Integrity Protection must be disabled before running this script.

### Follow the following steps:
1. Restart
2. As soon as black screen appears, hold down [command] + [R]
3. Click Utilities > Terminal
4. Run csrutil disable
5. Run
```bash
mkdir -p /tmp/pave \
&& curl -L -o /tmp/pave/pave.zip "https://github.com/run00/pave/archive/master.zip" \
&& unzip -q -o -d /tmp/pave /tmp/pave/pave.zip \
&& cd /tmp/pave/pave-master \
&& sh install.sh
```
6. Follow steps 1-3 above
7. Run csrutil enable


To Backup Atom
apm list --installed --bare > atom.packages.list
