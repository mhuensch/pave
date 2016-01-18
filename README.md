# brew
Script to setup new install of OSX

```bash
mkdir -p /tmp/pave \
&& curl -L -o /tmp/pave/pave.zip "https://github.com/run00/brew/archive/master.zip" \
&& unzip -q -o -d /tmp/pave /tmp/pave/pave.zip \
&& sh /tmp/pave/brew-master/install.sh \
&& sh /tmp/pave/brew-master/config.sh
```

# To run this file, you must disable System Integrity Protection
# 1. Restart
# 2. As soon as black screen appears, hold down [command] + [R]
# 3. Click Utilities > Terminal
# 4. Run csrutil disable
# 5. Run this file
# 6. Follow steps 1-3 above
# 7. Run csrutil enable
