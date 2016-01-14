echo -e "Setting up Mackup"
ln -s mackup/.mackup.cfg ~/.mackup.cfg
ln -s "$(pwd)/mackup/" ~/


echo "Restoring configuration using Mackup"
mackup -f backup

# echo "Tearing Down Setup"
# unlink ~/.mackup.cfg
# unlink ~/mackup
