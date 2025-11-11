Requirements

Windows (10/11 or similar)

cscript.exe (built into Windows) — run from an elevated Command Prompt/PowerShell to show passwords

Usage

Open PowerShell or Command Prompt as Administrator, then run:

cd C:\path\to\folder
cscript.exe .\wifi.vbs


If run without elevation, the script will list profiles but may not display Key Content for some profiles.

Example output
Saved Wi-Fi profiles:
 - HomeNetwork
 - OfficeGuest

Profile: HomeNetwork
    Key Content    : mySecretPassword123

Profile: OfficeGuest
    Key Content    : (not available — requires elevated permissions)

Notes & Ethics

Use only on computers/networks you own or have explicit permission to inspect.
Initialize this script on your own purpose but yeah remember this thing it will run for windows
