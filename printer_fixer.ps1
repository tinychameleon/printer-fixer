$identity = [Security.Principal.WindowsPrincipal] `
            [Security.Principal.WindowsIdentity]::GetCurrent()

if (!$identity.IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
    Write-Host "Going to run script as Administrator..."
    Start-Sleep 1
    Start-Process powershell.exe `
        -ArgumentList ("-ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) `
        -Verb RunAs
    exit
}

Write-Host "Restarting the printer service..."
Start-Sleep 1
Restart-Service -Name "Spooler"
Write-Host "Done"
Start-Sleep 2
