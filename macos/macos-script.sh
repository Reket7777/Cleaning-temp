#!/usr/bin/env bash
# https://privacy.sexy — v0.13.0 — Mon, 26 Feb 2024 15:19:41 GMT
if [ "$EUID" -ne 0 ]; then
    script_path=$([[ "$0" = /* ]] && echo "$0" || echo "$PWD/${0#./}")
    sudo "$script_path" || (
        echo 'Administrator privileges are required.'
        exit 1
    )
    exit 0
fi


# ----------------------------------------------------------
# --------------------Clear bash history--------------------
# ----------------------------------------------------------
echo '--- Clear bash history'
rm -f ~/.bash_history
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------------------Clear zsh history---------------------
# ----------------------------------------------------------
echo '--- Clear zsh history'
rm -f ~/.zsh_history
# ----------------------------------------------------------


# ----------------------------------------------------------
# ------------------Clear diagnostics logs------------------
# ----------------------------------------------------------
echo '--- Clear diagnostics logs'
sudo rm -rfv /private/var/db/diagnostics/*
sudo rm -rfv /var/db/diagnostics/*
# ----------------------------------------------------------


# ----------------------------------------------------------
# -------------Clear shared cache strings data--------------
# ----------------------------------------------------------
echo '--- Clear shared cache strings data'
sudo rm -rfv /private/var/db/uuidtext/
sudo rm -rfv /var/db/uuidtext/
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------------Clear Apple System Logs (ASL)---------------
# ----------------------------------------------------------
echo '--- Clear Apple System Logs (ASL)'
sudo rm -rfv /private/var/log/asl/*
sudo rm -rfv /var/log/asl/*
sudo rm -fv /var/log/asl.log # Legacy ASL (10.4)
sudo rm -fv /var/log/asl.db
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------------------Clear install logs--------------------
# ----------------------------------------------------------
echo '--- Clear install logs'
sudo rm -fv /var/log/install.log
# ----------------------------------------------------------


# ----------------------------------------------------------
# ------Clear all system logs in `/var/log/` directory------
# ----------------------------------------------------------
echo '--- Clear all system logs in `/var/log/` directory'
sudo rm -rfv /var/log/*
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------------Clear system application logs---------------
# ----------------------------------------------------------
echo '--- Clear system application logs'
sudo rm -rfv /Library/Logs/*
# ----------------------------------------------------------


# ----------------------------------------------------------
# ---------------------Clear Mail logs----------------------
# ----------------------------------------------------------
echo '--- Clear Mail logs'
rm -rfv ~/Library/Containers/com.apple.mail/Data/Library/Logs/Mail/*
# ----------------------------------------------------------


# Clear user activity audit logs (login, logout, authentication, etc.)
echo '--- Clear user activity audit logs (login, logout, authentication, etc.)'
sudo rm -rfv /var/audit/*
sudo rm -rfv /private/var/audit/*
# ----------------------------------------------------------


# ----------------------------------------------------------
# ------------------Clear user report logs------------------
# ----------------------------------------------------------
echo '--- Clear user report logs'
sudo rm -rfv ~/Library/Logs/*
# ----------------------------------------------------------


# ----------------------------------------------------------
# ---------------------Clear daily logs---------------------
# ----------------------------------------------------------
echo '--- Clear daily logs'
sudo rm -fv /System/Library/LaunchDaemons/com.apple.periodic-*.plist
# ----------------------------------------------------------


# ----------------------------------------------------------
# ------Clear receipt logs for installed packages/apps------
# ----------------------------------------------------------
echo '--- Clear receipt logs for installed packages/apps'
sudo rm -rfv /var/db/receipts/*
sudo rm -vf /Library/Receipts/InstallHistory.plist
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------------Clear Chrome browsing history---------------
# ----------------------------------------------------------
echo '--- Clear Chrome browsing history'
rm -rfv ~/Library/Application\ Support/Google/Chrome/Default/History &>/dev/null
rm -rfv ~/Library/Application\ Support/Google/Chrome/Default/History-journal &>/dev/null
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------------------Clear Chrome cache--------------------
# ----------------------------------------------------------
echo '--- Clear Chrome cache'
sudo rm -rfv ~/Library/Application\ Support/Google/Chrome/Default/Application\ Cache/* &>/dev/null
# ----------------------------------------------------------


# ----------------------------------------------------------
# ------Clear Safari cached blobs, URLs and timestamps------
# ----------------------------------------------------------
echo '--- Clear Safari cached blobs, URLs and timestamps'
rm -f ~/Library/Caches/com.apple.Safari/Cache.db
# ----------------------------------------------------------


# ----------------------------------------------------------
# -----------Clear Safari URL bar web page icons------------
# ----------------------------------------------------------
echo '--- Clear Safari URL bar web page icons'
rm -f ~/Library/Safari/WebpageIcons.db
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------Clear Safari webpage previews (thumbnails)--------
# ----------------------------------------------------------
echo '--- Clear Safari webpage previews (thumbnails)'
rm -rfv ~/Library/Caches/com.apple.Safari/Webpage\ Previews
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------------Clear Safari browsing history---------------
# ----------------------------------------------------------
echo '--- Clear Safari browsing history'
rm -f ~/Library/Safari/History.db
rm -f ~/Library/Safari/History.db-lock
rm -f ~/Library/Safari/History.db-shm
rm -f ~/Library/Safari/History.db-wal
# For older versions of Safari
rm -f ~/Library/Safari/History.plist # URL, visit count, webpage title, last visited timestamp, redirected URL, autocomplete
rm -f ~/Library/Safari/HistoryIndex.sk # History index
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------------Clear Safari downloads history--------------
# ----------------------------------------------------------
echo '--- Clear Safari downloads history'
rm -f ~/Library/Safari/Downloads.plist
# ----------------------------------------------------------


# ----------------------------------------------------------
# ----------Clear Safari frequently visited sites-----------
# ----------------------------------------------------------
echo '--- Clear Safari frequently visited sites'
rm -f ~/Library/Safari/TopSites.plist
# ----------------------------------------------------------


# ----------------------------------------------------------
# ------Clear Safari last session (open tabs) history-------
# ----------------------------------------------------------
echo '--- Clear Safari last session (open tabs) history'
rm -f ~/Library/Safari/LastSession.plist
# ----------------------------------------------------------


# ----------------------------------------------------------
# ----------------Clear Safari history copy-----------------
# ----------------------------------------------------------
echo '--- Clear Safari history copy'
rm -rfv ~/Library/Caches/Metadata/Safari/History
# ----------------------------------------------------------


# ----------------------------------------------------------
# -Clear search term history embedded in Safari preferences-
# ----------------------------------------------------------
echo '--- Clear search term history embedded in Safari preferences'
defaults write ~/Library/Preferences/com.apple.Safari RecentSearchStrings '( )'
# ----------------------------------------------------------


# ----------------------------------------------------------
# -------------------Clear Safari cookies-------------------
# ----------------------------------------------------------
echo '--- Clear Safari cookies'
rm -f ~/Library/Cookies/Cookies.binarycookies
# Used before Safari 5.1
rm -f ~/Library/Cookies/Cookies.plist
# ----------------------------------------------------------


# ----------------------------------------------------------
# -------Clear Safari zoom level preferences per site-------
# ----------------------------------------------------------
echo '--- Clear Safari zoom level preferences per site'
rm -f ~/Library/Safari/PerSiteZoomPreferences.plist
# ----------------------------------------------------------


# ----------------------------------------------------------
# -------Clear allowed URLs for Safari notifications--------
# ----------------------------------------------------------
echo '--- Clear allowed URLs for Safari notifications'
rm -f ~/Library/Safari/UserNotificationPreferences.plist
# ----------------------------------------------------------


# Clear Safari preferences for downloads, geolocation, pop-ups, and autoplay per site
echo '--- Clear Safari preferences for downloads, geolocation, pop-ups, and autoplay per site'
rm -f ~/Library/Safari/PerSitePreferences.db
# ----------------------------------------------------------


# ----------------------------------------------------------
# -------------------Clear Firefox cache--------------------
# ----------------------------------------------------------
echo '--- Clear Firefox cache'
sudo rm -rf ~/Library/Caches/Mozilla/
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/netpredictions.sqlite
# ----------------------------------------------------------


# ----------------------------------------------------------
# ----------------Clear Firefox form history----------------
# ----------------------------------------------------------
echo '--- Clear Firefox form history'
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/formhistory.sqlite
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/formhistory.dat
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------------Clear Firefox site preferences--------------
# ----------------------------------------------------------
echo '--- Clear Firefox site preferences'
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/content-prefs.sqlite
# ----------------------------------------------------------


# Clear Firefox session restore data (loads after the browser closes or crashes)
echo '--- Clear Firefox session restore data (loads after the browser closes or crashes)'
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/sessionCheckpoints.json
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/sessionstore*.js*
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/sessionstore.bak*
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/sessionstore-backups/previous.js*
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/sessionstore-backups/recovery.js*
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/sessionstore-backups/recovery.bak*
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/sessionstore-backups/previous.bak*
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/sessionstore-backups/upgrade.js*-20*
# ----------------------------------------------------------


# ----------------------------------------------------------
# -----------------Clear Firefox passwords------------------
# ----------------------------------------------------------
echo '--- Clear Firefox passwords'
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/signons.txt
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/signons2.txt
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/signons3.txt
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/signons.sqlite
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/logins.json
# ----------------------------------------------------------


# ----------------------------------------------------------
# ---------------Clear Firefox HTML5 cookies----------------
# ----------------------------------------------------------
echo '--- Clear Firefox HTML5 cookies'
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/webappsstore.sqlite
# ----------------------------------------------------------


# ----------------------------------------------------------
# ---------------Clear Firefox crash reports----------------
# ----------------------------------------------------------
echo '--- Clear Firefox crash reports'
rm -rfv ~/Library/Application\ Support/Firefox/Crash\ Reports/
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/minidumps/*.dmp
# ----------------------------------------------------------


# ----------------------------------------------------------
# ----------------Clear Firefox backup files----------------
# ----------------------------------------------------------
echo '--- Clear Firefox backup files'
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/bookmarkbackups/*.json
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/bookmarkbackups/*.jsonlz4
# ----------------------------------------------------------


# ----------------------------------------------------------
# ------------------Clear Firefox cookies-------------------
# ----------------------------------------------------------
echo '--- Clear Firefox cookies'
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/cookies.txt
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/cookies.sqlite
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/cookies.sqlite-shm
rm -fv ~/Library/Application\ Support/Firefox/Profiles/*/cookies.sqlite-wal
rm -rfv ~/Library/Application\ Support/Firefox/Profiles/*/storage/default/http*
# ----------------------------------------------------------


# ----------------------------------------------------------
# ------------Clear privacy.sexy script history-------------
# ----------------------------------------------------------
echo '--- Clear privacy.sexy script history'
# Clear directory contents: "$HOME/Library/Application Support/privacy.sexy/runs"
glob_pattern="$HOME/Library/Application Support/privacy.sexy/runs/*"
rm -rfv $glob_pattern
# ----------------------------------------------------------


# ----------------------------------------------------------
# -------------Clear privacy.sexy activity logs-------------
# ----------------------------------------------------------
echo '--- Clear privacy.sexy activity logs'
# Clear directory contents: "$HOME/Library/Logs/privacy.sexy"
glob_pattern="$HOME/Library/Logs/privacy.sexy/*"
rm -rfv $glob_pattern
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------------------Clear Adobe cache---------------------
# ----------------------------------------------------------
echo '--- Clear Adobe cache'
sudo rm -rfv ~/Library/Application\ Support/Adobe/Common/Media\ Cache\ Files/* &>/dev/null
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------------------Clear Gradle cache--------------------
# ----------------------------------------------------------
echo '--- Clear Gradle cache'
if [ -d "~/.gradle/caches" ]; then
    rm -rfv ~/.gradle/caches/ &> /dev/null
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# -------------------Clear Dropbox cache--------------------
# ----------------------------------------------------------
echo '--- Clear Dropbox cache'
if [ -d "~/Dropbox/.dropbox.cache" ]; then
    sudo rm -rfv ~/Dropbox/.dropbox.cache/* &>/dev/null
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# -----------Clear Google Drive File Stream cache-----------
# ----------------------------------------------------------
echo '--- Clear Google Drive File Stream cache'
killall "Google Drive File Stream"
rm -rfv ~/Library/Application\ Support/Google/DriveFS/[0-9a-zA-Z]*/content_cache &>/dev/null
# ----------------------------------------------------------


# ----------------------------------------------------------
# -------------------Clear Composer cache-------------------
# ----------------------------------------------------------
echo '--- Clear Composer cache'
if type "composer" &> /dev/null; then
    composer clearcache &> /dev/null
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# -------------------Clear Homebrew cache-------------------
# ----------------------------------------------------------
echo '--- Clear Homebrew cache'
if type "brew" &>/dev/null; then
    brew cleanup -s &>/dev/null
    rm -rfv $(brew --cache) &>/dev/null
    brew tap --repair &>/dev/null
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# ---------------Clear old Ruby gem versions----------------
# ----------------------------------------------------------
echo '--- Clear old Ruby gem versions'
if type "gem" &> /dev/null; then
    gem cleanup &>/dev/null
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# -----------------Clear unused Docker data-----------------
# ----------------------------------------------------------
echo '--- Clear unused Docker data'
if type "docker" &> /dev/null; then
    docker system prune -af
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# ---------------Clear Pyenv-Virtualenv cache---------------
# ----------------------------------------------------------
echo '--- Clear Pyenv-Virtualenv cache'
if [ "$PYENV_VIRTUALENV_CACHE_PATH" ]; then
    rm -rfv $PYENV_VIRTUALENV_CACHE_PATH &>/dev/null
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# ---------------------Clear NPM cache----------------------
# ----------------------------------------------------------
echo '--- Clear NPM cache'
if type "npm" &> /dev/null; then
    npm cache clean --force
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# ---------------------Clear Yarn cache---------------------
# ----------------------------------------------------------
echo '--- Clear Yarn cache'
if type "yarn" &> /dev/null; then
    echo 'Cleanup Yarn Cache...'
    yarn cache clean --force
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# -------------Clear iOS app copies from iTunes-------------
# ----------------------------------------------------------
echo '--- Clear iOS app copies from iTunes'
rm -rfv ~/Music/iTunes/iTunes\ Media/Mobile\ Applications/* &>/dev/null
# ----------------------------------------------------------


# ----------------------------------------------------------
# ------------------Clear iOS photo cache-------------------
# ----------------------------------------------------------
echo '--- Clear iOS photo cache'
rm -rf ~/Pictures/iPhoto\ Library/iPod\ Photo\ Cache/*
# ----------------------------------------------------------


# ----------------------------------------------------------
# -----------------Clear iOS Device Backups-----------------
# ----------------------------------------------------------
echo '--- Clear iOS Device Backups'
rm -rfv ~/Library/Application\ Support/MobileSync/Backup/* &>/dev/null
# ----------------------------------------------------------


# ----------------------------------------------------------
# -------------------Clear iOS simulators-------------------
# ----------------------------------------------------------
echo '--- Clear iOS simulators'
if type "xcrun" &>/dev/null; then
    osascript -e 'tell application "com.apple.CoreSimulator.CoreSimulatorService" to quit'
    osascript -e 'tell application "iOS Simulator" to quit'
    osascript -e 'tell application "Simulator" to quit'
    xcrun simctl shutdown all
    xcrun simctl erase all
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# -----------Clear list of connected iOS devices------------
# ----------------------------------------------------------
echo '--- Clear list of connected iOS devices'
sudo defaults delete /Users/$USER/Library/Preferences/com.apple.iPod.plist "conn:128:Last Connect"
sudo defaults delete /Users/$USER/Library/Preferences/com.apple.iPod.plist Devices
sudo defaults delete /Library/Preferences/com.apple.iPod.plist "conn:128:Last Connect"
sudo defaults delete /Library/Preferences/com.apple.iPod.plist Devices
sudo rm -rfv /var/db/lockdown/*
# ----------------------------------------------------------


# ----------------------------------------------------------
# ---------------Clear CUPS printer job cache---------------
# ----------------------------------------------------------
echo '--- Clear CUPS printer job cache'
sudo rm -rfv /var/spool/cups/c0*
sudo rm -rfv /var/spool/cups/tmp/*
sudo rm -rfv /var/spool/cups/cache/job.cache*
# ----------------------------------------------------------


# ----------------------------------------------------------
# ----------------Empty trash on all volumes----------------
# ----------------------------------------------------------
echo '--- Empty trash on all volumes'
# on all mounted volumes
sudo rm -rfv /Volumes/*/.Trashes/* &>/dev/null
# on main HDD
sudo rm -rfv ~/.Trash/* &>/dev/null
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------------------Clear system cache--------------------
# ----------------------------------------------------------
echo '--- Clear system cache'
sudo rm -rfv /Library/Caches/* &>/dev/null
sudo rm -rfv /System/Library/Caches/* &>/dev/null
sudo rm -rfv ~/Library/Caches/* &>/dev/null
# ----------------------------------------------------------


# ----------------------------------------------------------
# ---------Clear Xcode's derived data and archives----------
# ----------------------------------------------------------
echo '--- Clear Xcode'\''s derived data and archives'
rm -rfv ~/Library/Developer/Xcode/DerivedData/* &>/dev/null
rm -rfv ~/Library/Developer/Xcode/Archives/* &>/dev/null
rm -rfv ~/Library/Developer/Xcode/iOS Device Logs/* &>/dev/null
# ----------------------------------------------------------


# ----------------------------------------------------------
# ---------------------Clear DNS cache----------------------
# ----------------------------------------------------------
echo '--- Clear DNS cache'
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder
# ----------------------------------------------------------


# ----------------------------------------------------------
# ------------------Clear inactive memory-------------------
# ----------------------------------------------------------
echo '--- Clear inactive memory'
sudo purge
# ----------------------------------------------------------


# ----------------------------------------------------------
# ---------------Clear **"All"** permissions----------------
# ----------------------------------------------------------
echo '--- Clear **"All"** permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='All'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# ----------------Clear "Camera" permissions----------------
# ----------------------------------------------------------
echo '--- Clear "Camera" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='Camera'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------------Clear "Microphone" permissions--------------
# ----------------------------------------------------------
echo '--- Clear "Microphone" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='Microphone'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# ------------Clear "Accessibility" permissions-------------
# ----------------------------------------------------------
echo '--- Clear "Accessibility" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='Accessibility'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# ------------Clear "Screen Capture" permissions------------
# ----------------------------------------------------------
echo '--- Clear "Screen Capture" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='ScreenCapture'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------------Clear "Reminders" permissions---------------
# ----------------------------------------------------------
echo '--- Clear "Reminders" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='Reminders'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# ----------------Clear "Photos" permissions----------------
# ----------------------------------------------------------
echo '--- Clear "Photos" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='Photos'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# ---------------Clear "Calendar" permissions---------------
# ----------------------------------------------------------
echo '--- Clear "Calendar" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='Calendar'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# -----------Clear "Full Disk Access" permissions-----------
# ----------------------------------------------------------
echo '--- Clear "Full Disk Access" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='SystemPolicyAllFiles'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# ---------------Clear "Contacts" permissions---------------
# ----------------------------------------------------------
echo '--- Clear "Contacts" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='AddressBook'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# ------------Clear "Desktop Folder" permissions------------
# ----------------------------------------------------------
echo '--- Clear "Desktop Folder" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='SystemPolicyDesktopFolder'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# -----------Clear "Documents Folder" permissions-----------
# ----------------------------------------------------------
echo '--- Clear "Documents Folder" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='SystemPolicyDocumentsFolder'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# -----------Clear "Downloads Folder" permissions-----------
# ----------------------------------------------------------
echo '--- Clear "Downloads Folder" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='SystemPolicyDownloadsFolder'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# -------------Clear "Apple Events" permissions-------------
# ----------------------------------------------------------
echo '--- Clear "Apple Events" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='AppleEvents'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------Clear "File Provider Presence" permissions--------
# ----------------------------------------------------------
echo '--- Clear "File Provider Presence" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='FileProviderPresence'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# ------------Clear "Listen Events" permissions-------------
# ----------------------------------------------------------
echo '--- Clear "Listen Events" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='ListenEvent'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# ------------Clear "Media Library" permissions-------------
# ----------------------------------------------------------
echo '--- Clear "Media Library" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='MediaLibrary'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# --------------Clear "Post Event" permissions--------------
# ----------------------------------------------------------
echo '--- Clear "Post Event" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='PostEvent'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# ----------Clear "Speech Recognition" permissions----------
# ----------------------------------------------------------
echo '--- Clear "Speech Recognition" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='SpeechRecognition'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# -----------Clear "App Modification" permissions-----------
# ----------------------------------------------------------
echo '--- Clear "App Modification" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='SystemPolicyAppBundles'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# -----------Clear "Application Data" permissions-----------
# ----------------------------------------------------------
echo '--- Clear "Application Data" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='SystemPolicyAppData'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# -----------Clear "Network Volumes" permissions------------
# ----------------------------------------------------------
echo '--- Clear "Network Volumes" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='SystemPolicyNetworkVolumes'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# ----------Clear "Removable Volumes" permissions-----------
# ----------------------------------------------------------
echo '--- Clear "Removable Volumes" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='SystemPolicyRemovableVolumes'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


# ----------------------------------------------------------
# -----Clear "System Administration Files" permissions------
# ----------------------------------------------------------
echo '--- Clear "System Administration Files" permissions'
if ! command -v 'tccutil' &> /dev/null; then
    echo 'Skipping because "tccutil" is not found.'
else
    declare serviceId='SystemPolicySysAdminFiles'
declare reset_output reset_exit_code
{
    reset_output=$(tccutil reset "$serviceId" 2>&1)
    reset_exit_code=$?
}
if [ $reset_exit_code -eq 0 ]; then
    echo "Successfully reset permissions for \"${serviceId}\"."
elif [ $reset_exit_code -eq 70 ]; then
    echo "Skipping, service ID \"${serviceId}\" is not supported on your operating system version."
elif [ $reset_exit_code -ne 0 ]; then
    >&2 echo "Failed to reset permissions for \"${serviceId}\". Exit code: $reset_exit_code."
    if [ -n "$reset_output" ]; then
        echo "Output from \`tccutil\`: $reset_output."
    fi
fi
fi
# ----------------------------------------------------------


echo 'Your privacy and security is now hardened 🎉💪'
echo 'Press any key to exit.'
read -n 1 -s