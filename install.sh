function installing() {
	echo -e "\n\nInstalling: \033[0;32m$1\033[0m"
}

echo -e "\n"
echo "---------------------------------------"
echo "  RUNNING OSX INSTALL & CONFIGURATION"
echo "---------------------------------------"
echo ""


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


installing "Mackup"
brew install mackup


# APPLICATIONS

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

installing "Atom"
brew cask install atom


installing "CCleaner"
brew cask install ccleaner


installing "Docker"
brew cask install dockertoolbox


installing "GitHub Desktop"
brew cask install github-desktop

installing "Dropbox"
brew cask install dropbox


installing "Google Drive"
brew cask install google-drive


installing "Inkscape"
brew cask install inkscape


installing "iTerm"
brew cask install iterm2


installing "Mongo Managment Studio"
brew cask install mongo-management-studio

l
installing "Moom"
brew cask install moom


installing "Seashore"
brew cask install seashore

installing "RDP"
brew cask install remote-desktop-connection


# FONTS

installing "Source Code Pro FONT"
brew cask install font-source-code-pro


# CONFIG

echo -e "\nCopying Mackup config to Root Dir"
# TODO: Fix this ref location!!
cp -f  mackup/mackup.cfg ~/.mackup.cfg
ln -s "$(pwd)/mackup/" ~/


echo "Restoring configuration using Mackup"
mackup restore
unlink ~/mackup


brew cask cleanup
brew cleanup
