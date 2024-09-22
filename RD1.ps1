

Write-Host "Step 1"

Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force

Write-Host "Step 2"

$username = $env:USERNAME

Start-Process powershell -Verb RunAs

Write-Host "Step 3"

Unblock-File -Path "C:\Users\$username\Downloads\RD1.ps1"

Write-Host "Step 4"

# Define variables
$code = '4/0AQlEd8yWRe_yIYUgc_ohGcggMji0w-sn3JV37CKHxIuUvMS6L0OQWOYctjrL82cVVq4Oww'
$name = 'RDP'

Write-Host "Step 5"

# Download the Chrome Remote Desktop Host MSI
Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command Invoke-WebRequest https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi -OutFile chromeremotedesktophost.msi" -WindowStyle Hidden -Wait

Write-Host "Step 6"


Start-Process msiexec.exe -ArgumentList '/i chromeremotedesktophost.msi /norestart' -Wait

Write-Host "Step 7"

Start-Sleep -Seconds 5

# Start the Chrome Remote Desktop Host with the provided code and name
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit -Command & {& '${Env:PROGRAMFILES(X86)}\Google\Chrome Remote Desktop\CurrentVersion\remoting_start_host.exe' --code='$code' --redirect-url='https://remotedesktop.google.com/_/oauthredirect' --name='$name'}"

Write-Host "Step 8"

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
