
Option Explicit

Dim fso, ws, tempFolder, batPath, ts, cmd
Set fso = CreateObject("Scripting.FileSystemObject")
Set ws  = CreateObject("WScript.Shell")


tempFolder = ws.ExpandEnvironmentStrings("%TEMP%")
batPath = tempFolder & "\__show_wifi_passwords.bat"


If fso.FileExists(batPath) Then fso.DeleteFile batPath, True


Set ts = fso.CreateTextFile(batPath, True, False)

ts.WriteLine "@echo off"
ts.WriteLine "echo You may need to run this Command Prompt as Administrator to view passwords."
ts.WriteLine "echo."
ts.WriteLine "echo Listing saved Wi-Fi profiles..."
ts.WriteLine "setlocal enabledelayedexpansion"
ts.WriteLine ""
ts.WriteLine "for /f ""tokens=2 delims=:"" %%A in ('netsh wlan show profiles ^| findstr /c:""All User Profile"" /c:""User Profile""') do ("
ts.WriteLine "  set ""prof=%%A"""
ts.WriteLine "  rem trim leading spaces using an inner for /f"
ts.WriteLine "  for /f ""tokens=* delims= "" %%B in (""!prof!"") do set ""prof=%%B"""
ts.WriteLine "  echo ========================================"
ts.WriteLine "  echo Profile: !prof!"
ts.WriteLine "  netsh wlan show profile name=""!prof!"" key=clear"
ts.WriteLine "  echo."
ts.WriteLine ")"
ts.WriteLine ""
ts.WriteLine "endlocal"
ts.WriteLine "echo Done."
ts.WriteLine "echo."
ts.WriteLine "pause"
ts.Close


cmd = "cmd.exe /k """ & batPath & """"
ws.Run cmd, 1, False

WScript.Quit 0
