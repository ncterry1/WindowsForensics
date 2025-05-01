# Primary program run from '\WindowsForensicsModule\'
# .\RunWindowsForensicsProgram.ps1
#
# This Preparation Phase menu can be run on its own, with all options.
# .\1_PreparationPhaseMenu.ps1
#-------------------------------------------------
function Get-ForensicsPreparationMenu {
    Write-Host("
|======================================================================|
|==================--- Windows Forensics Prep Phase ---===============|
|======================================================================|`n")
    Write-Host(" Selections:
------------------------------------------------------------------------")
    Write-Host -ForegroundColor Yellow ("`n   1) Document System Details               `tEnter: 1")
    Write-Host -ForegroundColor Yellow ("`n   2) Establish Chain of Custody             `tEnter: 2")
    Write-Host -ForegroundColor Yellow ("`n   3) Ensure Time Zone & Clock Sync          `tEnter: 3")
    Write-Host -ForegroundColor Yellow ("`n   4) Create Forensic Image                   `tEnter: 4")
    Write-Host -ForegroundColor Yellow ("`n   5) Verify Image Integrity                  `tEnter: 5")
    Write-Host("`n------------------------------------------------------------------------")
    Write-Host -ForegroundColor Yellow ("`n   0) Return to Prior Menu                   `tEnter: 0`n")
    Write-Host("------------------------------------------------------------------------")
    Write-Host -ForegroundColor Yellow ("`n   HELP   - Enter the number + h  (1h, 2h, ... 5h)  `tEnter: '#h'`n")
    Write-Host -ForegroundColor Red    ("   QUIT   - End the Forensics Program        `tEnter: 'quit'`n")
    Write-Host("------------------------------------------------------------------------")
} # End function Get-ForensicsPreparationMenu

# Loop until user returns or quits
do {
    Clear-Host
    Get-ForensicsPreparationMenu

    $choice = Read-Host "`nEnter Choice"
    Clear-Host
    $choice = $choice -replace '\s', ''
    $choice = $choice.ToLower()

    switch ($choice) {
        '1' {
            #Document-SystemDetails
            Write-Host -ForegroundColor Yellow ("`n------------------`n")
            Pause
        }
        '1h' {
            Show-ForensicsHelp -section "1.1"
            Pause
        }
        '2' {
            Establish-ChainOfCustody
            Write-Host -ForegroundColor Yellow ("`n------------------`n")
            Pause
        }
        '2h' {
            Show-ForensicsHelp -section "1.2"
            Pause
        }
        '3' {
            Sync-ClockAndTimezone
            Write-Host -ForegroundColor Yellow ("`n------------------`n")
            Pause
        }
        '3h' {
            Show-ForensicsHelp -section "1.3"
            Pause
        }
        '4' {
            Create-ForensicImage
            Write-Host -ForegroundColor Yellow ("`n------------------`n")
            Pause
        }
        '4h' {
            Show-ForensicsHelp -section "1.4"
            Pause
        }
        '5' {
            Verify-ImageIntegrity
            Write-Host -ForegroundColor Yellow ("`n------------------`n")
            Pause
        }
        '5h' {
            Show-ForensicsHelp -section "1.5"
            Pause
        }
        'quit' {
            $Global:quit = $true
            break
        }
    }
} until ($choice -eq '0' -or $Global:quit)
