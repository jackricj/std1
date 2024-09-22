$username = $env:USERNAME


Unblock-File -Path "C:\Users\$username\Downloads\RD.ps1"



# Define variables
$code = '4/0AQlEd8xK1n5LUq1twKgaco_kgOYFKoWMBI8pTySQgKgj2uhjQCi6prytNEsAfSYAzE3mTA'
$name = 'Windows360'

# Download the Chrome Remote Desktop Host MSI
Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command Invoke-WebRequest https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi -OutFile chromeremotedesktophost.msi" -WindowStyle Hidden -Wait


Start-Process msiexec.exe -ArgumentList '/i chromeremotedesktophost.msi /norestart' -Wait

Start-Sleep -Seconds 5

# Start the Chrome Remote Desktop Host with the provided code and name
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit -Command & {& '${Env:PROGRAMFILES(X86)}\Google\Chrome Remote Desktop\CurrentVersion\remoting_start_host.exe' --code='$code' --redirect-url='https://remotedesktop.google.com/_/oauthredirect' --name='$name'}"

# Wait for the process to start
Start-Sleep -Seconds 5

# Simulate keystrokes to enter the PIN
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("123456")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("123456")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
