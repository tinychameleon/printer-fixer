# Windows 10 Printer Fixer

Reset the printer service in Windows 10 when your printer is "Offline"


## Installation

The [printer_fixer.ps1](./printer_fixer.ps1) file can be placed anywhere. Once
saved create a shortcut file that launches Powershell and the script via the
"Target" field:
```
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -command "& C:\Path\To\printer_fixer.ps1" -NoProfile
```

When you run it, if it does not have Administrator privilege, it will request
those permissions automatically.


## What Does This Do... and Why?

Windows 10 seems to cache the network address of any printer it finds, and
subsequently never bothers to probe the network again. If your printer changes
network address Windows 10 will report it as "Offline" because it can't connect
to the printer using the old address.

What does this script do? It requests Administrator permissions then restarts
the `Spooler` service which flushes the caches and allows Windows 10 to once
again fulfil the basic task of printing.
