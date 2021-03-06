# loginctl_switch
Small shell script to switch to the active desktop of a certain user. It is meant as a workaround. 

The recent versions of KDE have a bug that prevents user switching. See this issue:  
https://bugs.kde.org/show_bug.cgi?id=423526

However it is possible to switch users via the loginctl command. This script will try to find out if the user is logged in and then switch to the desktop of that user. You can create a desktop icon that will call this script for every user. 

In order to use this method, some extra measures are needed:
  - Disable the screenlocks
  - Make sure no programs linger after logging out. Otherwise the list with sessions gets really long. 
  - Install the desktop file with the launcher to the script in $HOME/.local/share/applications

Since loginctl keeps some sessions alive or lingered, the script also needs to check which session of that user is the correct one. This is checked if the Session State equals 'online'.

