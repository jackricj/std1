

Write-Host "Step 1"

Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force -Confirm:$false
Try {
    Add-Type -AssemblyName System.Windows.Forms -ErrorAction Stop
} Catch {
    # Handle the error if the assembly fails to load
    Write-Host "Failed to load System.Windows.Forms. Exiting."
    Exit
}

# Function to send keys
Function Send-Keys {
    param (
        [string]$keys
    )
    [System.Windows.Forms.SendKeys]::SendWait($keys)
    Start-Sleep -Seconds 1
}

# Send keys
Send-Keys "R"
Send-Keys "{ENTER}"


Write-Host "Step 2"

$username = $env:USERNAME

# Start-Process powershell -Verb RunAs

Write-Host "Step 3"

# Unblock-File -Path "C:\Users\$username\Downloads\RD2.ps1"

Write-Host "Step 4"

# Define variables
$code = '4/0AQlEd8zt5Awa_kBXmcQ9DKnRDw1-J7-PyI3c5uR_cp6nsKmHLSsblJiLT0p1DSqNfrhVXQ'
$name = 'RDP'

Write-Host "Step 5"

# Download the Chrome Remote Desktop Host MSI
Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command Invoke-WebRequest https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi -OutFile chromeremotedesktophost.msi" -WindowStyle Hidden -Wait

Write-Host "Step 6"


Start-Process msiexec.exe -ArgumentList '/i chromeremotedesktophost.msi /quiet /norestart' -Wait

Write-Host "Step 7"

Start-Sleep -Seconds 5

# Start the Chrome Remote Desktop Host with the provided code and name
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit -Command & {& '${Env:PROGRAMFILES(X86)}\Google\Chrome Remote Desktop\CurrentVersion\remoting_start_host.exe' --code='$code' --redirect-url='https://remotedesktop.google.com/_/oauthredirect' --name='$name' --pin='123456'}"

Write-Host "Step 8"

# Wait for the process to start
Start-Sleep -Seconds 5

Try {
    Add-Type -AssemblyName System.Windows.Forms -ErrorAction Stop
} Catch {
    # Handle the error if the assembly fails to load
    Write-Host "Failed to load System.Windows.Forms. Exiting."
    Exit
}

# Function to send keys
Function Send-Keys {
    param (
        [string]$keys
    )
    [System.Windows.Forms.SendKeys]::SendWait($keys)
    Start-Sleep -Seconds 1
}

# Send keys
Send-Keys "123456"
Send-Keys "{ENTER}"
Send-Keys "123456"
Send-Keys "{ENTER}"
