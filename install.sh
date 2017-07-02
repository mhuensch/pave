function installing() {
	echo -e "\n\nInstalling: \033[0;32m$1\033[0m"
}

echo -e "\n"
echo "---------------------------------------"
echo "  RUNNING OSX INSTALL & CONFIGURATION"
echo "---------------------------------------"
echo ""




# BASH PROFILE

installing "Bash profile"
cp -a -f -n .bash_profile ~/




# UTILITIES

installing "Alfred"
curl -L -o Alfred.zip "https://cachefly.alfredapp.com/Alfred_2.8.2_432.zip"
unzip -q -o Alfred.zip
rm Alfred.zip
mv "Alfred 2.app" /Applications
rm -fr 'Alfred 2.app'


installing "XCode"
xcode-select --install
read -p "Press [Enter] after xcode is installed"


installing "Homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Update homebrew recipes
brew update


installing "Homebrew Cask"
brew install caskroom/cask/brew-cask


installing "Homebrew Versions"
brew tap caskroom/versions


installing "Homebrew Fonts"
brew tap caskroom/fonts




# APPLICATIONS

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

installing "Atom"
brew cask install atom
apm install `cat atom.packages.list`


installing "Bartender"
brew cask install bartender
# SEE: https://www.macbartender.com/B2/system-item-setup/ to disable spotlight


installing "Kaleidoscope"
brew cask install kaleidoscope


installing "CCleaner"
brew cask install ccleaner


installing "Google Chrome"
brew cask install google-chrome


installing "Google Drive"
brew cask install google-drive


installing "Sketch"
brew cask install sketch


installing "Mongo Managment Studio"
brew cask install mongo-management-studio


installing "Moom"
brew cask install moom


installing "Node Version Manager"
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash


installing "Spotify"
brew cask install spotify


installing "Total Finder"
brew cask install totalfinder




# FONTS

installing "Source Code Pro FONT"
brew cask install font-source-code-pro




brew cask cleanup
brew cleanup




secs=5
while [ $secs -gt 0 ]; do
	 echo -ne "Restarting in: $secs\033[0K\r"
	 sleep 1
	 : $((secs--))
done
sudo shutdown -r now
