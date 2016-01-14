# To run this file, you must disable System Integrity Protection
# 1. Restart
# 2. As soon as black screen appears, hold down [command] + [R]
# 3. Click Utilities > Terminal
# 4. Run csrutil disable
# 5. Run this file
# 6. Follow steps 1-3 above
# 7. Run csrutil enable

# Ask for the administrator password upfront
sudo -v

# Remove unwanted applications
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
