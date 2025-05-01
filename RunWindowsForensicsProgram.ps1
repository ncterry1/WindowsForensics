Import-Module WindowsForensicsModule -Force

function Display-MainMenu {
    Write-Host("
|======================================================================|
|==================--- Windows Forensics Program ---===================|
|======================================================================|") # END WRITE-HOST
    #
    Write-Host("`n Selections:
------------------------------------------------------------------------`n")
    Write-Host -ForegroundColor Yellow " 1) Event Log Analysis"
    Write-Host -ForegroundColor Yellow " 2) Registry Analysis"
    Write-Host -ForegroundColor Yellow " 3) Network Analysis"
    Write-Host -ForegroundColor Yellow " h) Help | q) Quit"
}

do {
    Clear-Host
    Display-MainMenu
    $choice = (Read-Host "Enter Selection").Trim().ToLower()

    switch ($choice) {
        '1' { .\Menus\EventLogMenu.ps1 }
        '2' { .\Menus\RegistryMenu.ps1 }
        '3' { .\Menus\NetworkMenu.ps1 }
        'h' { Get-Help WindowsForensicsProgram }
        'q' { break }
        default {
            Write-Warning "Invalid choice '$choice'. Please select again."
            Start-Sleep -Seconds 2
        }
    }
} while ($true)
