function installing() {
	echo -e "\n\nInstalling: \033[0;32m$1\033[0m"
}

csrutil_status=$(csrutil status | awk '{print $5}')
if [[ $csrutil_status = 'enabled.' ]]; then
	echo "System Integrity Protection must be disabled before running this script."
	echo " Follow the following steps:"
	echo " 1. Restart"
	echo " 2. As soon as black screen appears, hold down [command] + [R]"
	echo " 3. Click Utilities > Terminal"
	echo " 4. Run csrutil disable"
	echo " 5. Run this file"
	echo " 6. Follow steps 1-3 above"
	echo " 7. Run csrutil enable"
	return
fi

echo -e "\n"
echo "---------------------------------------"
echo "  RUNNING OSX INSTALL & CONFIGURATION"
echo "---------------------------------------"
echo ""


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




# CONFIGURATION

echo ""
echo "Hide unwanted icons"
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
	defaults write "${domain}" dontAutoLoad -array \
		"/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
		"/System/Library/CoreServices/Menu Extras/Volume.menu" \
		"/System/Library/CoreServices/Menu Extras/User.menu"
done


echo ""
echo "Disable spotlight"
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

echo ""
echo "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo ""
echo "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

echo ""
echo "Increasing sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo ""
echo "Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo ""
echo "Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo ""
echo "Avoiding the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo ""
echo "Wipe all (default) app icons from the Dock"
defaults write com.apple.dock persistent-apps -array

echo ""
echo "Speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1

echo ""
echo "Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-time-modifier -float 0

echo ""
echo "Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo ""
echo "Disabling local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal

echo ""
echo "Disable annoying backswipe in Chrome"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

echo ""
echo "Disable boot chime"
sudo nvram SystemAudioVolume=%00

echo ""
echo "Switch to dark mode"
sudo defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark

echo ""
echo "Disable annoying sounds"
user=`ls -l /dev/console | cut -d " " -f4`

# Turn off "Play feedback when volume is changed
sudo defaults write -g com.apple.sound.beep.feedback -integer 0

# Turn off "Play user interface sound effects
sudo defaults write com.apple.systemsound "com.apple.sound.uiaudio.enabled" -int 0

# Turn the volume down the alert volume
sudo defaults write com.apple.systemsound com.apple.sound.beep.volume -float 0



secs=5
while [ $secs -gt 0 ]; do
	 echo -ne "Restarting in: $secs\033[0K\r"
	 sleep 1
	 : $((secs--))
done
sudo shutdown -r now
