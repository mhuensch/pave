function installing() {
	echo -e "\n\nInstalling: \033[0;32m$1\033[0m"
}

echo -e "\n"
echo "---------------------------------------"
echo "  RUNNING OSX INSTALL & CONFIGURATION"
echo "---------------------------------------"
echo ""

csrutil_status=$(csrutil status | awk '{print $5}')
if [[ $csrutil_status = 'enabled.' ]]; then
	echo "System Integrity Protection must be disabled before running this script."
	echo "(see README.md for more information)"
	return
fi


# Ask for the administrator password upfront
sudo -v


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

installing "Bartender"
brew cask install bartender
# SEE: https://www.macbartender.com/B2/system-item-setup/ to disable spotlight

installing "CCleaner"
brew cask install ccleaner


installing "Docker"
brew cask install dockertoolbox


installing "GitHub Desktop"
brew cask install github-desktop


installing "Google Chrome"
brew cask install google-chrome


installing "Google Chrome Canary"
brew cask install google-chrome-canary


installing "Google Drive"
brew cask install google-drive


installing "XQuartz"
brew cask install xquartz


installing "Inkscape"
brew cask install inkscape


installing "iTerm"
brew cask install iterm2


installing "Karabiner"
brew cask install karabiner


installing "Keyboard Maestro"
brew cask install keyboard-maestro


installing "Lync"
brew cask install microsoft-lync


installing "Mongo Managment Studio"
brew cask install mongo-management-studio

l
installing "Moom"
brew cask install moom


installing "Office"
brew cask install microsoft-office


installing "Seashore"
brew cask install seashore


installing "Spotify"
brew cask install spotify


installing "VLC"
brew cask install vlc




# FONTS

installing "Source Code Pro FONT"
brew cask install font-source-code-pro


# Remove unwanted applications
installing "Removing unwanted applications"
sudo rm -rf "/Applications/Calendar.app"
sudo rm -rf "/Applications/Chess.app"
sudo rm -rf "/Applications/Contacts.app"
sudo rm -rf "/Applications/Dashboard.app"
sudo rm -rf "/Applications/Dictionary.app"
sudo rm -rf "/Applications/DVD Player.app"
sudo rm -rf "/Applications/Game Center.app"
sudo rm -rf "/Applications/iBooks.app"
sudo rm -rf "/Applications/iTunes.app"
sudo rm -rf "/Applications/Image Capture.app"
sudo rm -rf "/Applications/Launchpad.app"
sudo rm -rf "/Applications/Mail.app"
sudo rm -rf "/Applications/Maps.app"
sudo rm -rf "/Applications/Messages.app"
sudo rm -rf "/Applications/Notes.app"
sudo rm -rf "/Applications/Photo Booth.app"
sudo rm -rf "/Applications/Photos.app"
sudo rm -rf "/Applications/Reminders.app"
sudo rm -rf "/Applications/Stickies.app"
sudo rm -rf "/Applications/Time Machine.app"


brew cask cleanup
brew cleanup
