
# if using scoop
scoop bucket add extras
scoop install whkd
scoop install komorebi

# save the example configuration to ~/komorebi.json
Invoke-WebRequest 'https://raw.githubusercontent.com/joelvaneenwyk/komorebi/main/komorebi.example.json' -OutFile "$Env:USERPROFILE/komorebi.json"

# save the latest generated app-specific config tweaks and fixes
komorebic fetch-app-specific-configuration

# ensure the ~/.config folder exists
mkdir "$Env:USERPROFILE/.config" -ea 0

# save the sample whkdrc file with key bindings to ~/.config/whkdrc
Invoke-WebRequest 'https://raw.githubusercontent.com/joelvaneenwyk/komorebi/main/whkdrc.sample' -OutFile "$Env:USERPROFILE/.config/whkdrc"

# start komorebi and whkd
komorebic start -c "$Env:USERPROFILE/komorebi.json" --whkd
