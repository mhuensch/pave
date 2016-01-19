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




# CONFIGURATION

echo ""
echo "Hide unwanted icons"
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
  defaults write "${domain}" dontAutoLoad -array \
    "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
    "/System/Library/CoreServices/Menu Extras/Volume.menu" \
    "/System/Library/CoreServices/Menu Extras/User.menu"
done

# defaults write com.apple.systemuiserver menuExtras -array \
#   "/System/Library/CoreServices/Menu Extras/Bluetooth.menu"

echo ""
echo "Disable spotlight"
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search


echo ""
echo "Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo ""
echo "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo ""
echo "Saving to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

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
echo "Use list view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Nlsv

echo ""
echo "Showing all filename extensions in Finder by default"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo ""
echo "Showing status bar in Finder by default"
defaults write com.apple.finder ShowStatusBar -bool true

echo ""
echo "Allowing text selection in Quick Look/Preview in Finder by default"
defaults write com.apple.finder QLEnableTextSelection -bool true

echo ""
echo "Displaying full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

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
echo "Disable guest account"
sudo defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool NO
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool NO
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool NO

echo ""
echo "Set mouse scroll direction to normal"
sudo defaults write -g com.apple.swipescrolldirection -bool FALSE

echo ""
echo "Disable annoying sounds"
user=`ls -l /dev/console | cut -d " " -f4`

# Turn off "Play feedback when volume is changed
sudo "${user}" -c 'defaults write -g com.apple.sound.beep.feedback -integer 0'

# Turn off "Play user interface sound effects
sudo "${user}" -c 'defaults write com.apple.systemsound "com.apple.sound.uiaudio.enabled" -int 0'

# Turn the volume down the alert volume
sudo "${user}" -c 'defaults write com.apple.systemsound com.apple.sound.beep.volume -float 0'


cp -a -f -n .bash_profile ~/


secs=5
while [ $secs -gt 0 ]; do
   echo -ne "Restarting in: $secs\033[0K\r"
   sleep 1
   : $((secs--))
done
sudo shutdown -r now
