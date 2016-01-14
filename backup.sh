echo -e "Setting up Mackup"
unlink ~/.mackup.cfg
unlink ~/mackup
ln -s mackup/.mackup.cfg ~/.mackup.cfg
ln -s "$(pwd)/mackup/" ~/


echo "Restoring configuration using Mackup"
mackup -f backup
