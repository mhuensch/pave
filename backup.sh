cp -f mackup/.mackup.cfg ~/.mackup.cfg

unlink ~/mackup
ln -s "$(pwd)/mackup/" ~/

mackup -f backup
