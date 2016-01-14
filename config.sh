# Ask for the administrator password upfront
sudo -v

###############################################################################
# General UI/UX
###############################################################################

echo ""
echo "Hide unwanted icons"
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
  defaults write "${domain}" dontAutoLoad -array \
    "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
    "/System/Library/CoreServices/Menu Extras/Volume.menu" \
    "/System/Library/CoreServices/Menu Extras/User.menu"
done

defaults write com.apple.systemuiserver menuExtras -array \
  "/System/Library/CoreServices/Menu Extras/Bluetooth.menu"

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

# echo ""
# echo "Setting trackpad & mouse speed to a reasonable number"
# defaults write -g com.apple.trackpad.scaling 2
# defaults write -g com.apple.mouse.scaling 2.5



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



# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you donâ€™t use
# the Dock to launch apps.
#defaults write com.apple.dock persistent-apps -array

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
