<###########################################################################
# This script, "RunWindowsForensicsProgram.ps1" depends on if "InstallWindowsForensicsModule.ps1" has been run first.
# If "InstallWindowsForensicsModule.ps1" has been executed, just that first time, you can then execute
#     "RunWindowsForensicsProgram.ps1" any time after that.
#
# From PowerShell 
#     > .\RunWindowsForensicsProgram.ps1
#
# Or right click on "RunWindowsForensicsProgram.ps1" and click:
#     "Run with PowerShell"
#
# ALSO - once "InstallWindowsForensicssModule.ps1" has been run, and WindowsForensicsModule has been 
# installed in the PowerShell cache, you can then copy the "RunWindowsForensicsProgram - Shortcut" anywhere
# on the machine. For example, once "WindowsForensicsModule" has been installed, 
#     Right click on "RunWindowsForensicsProgram - Shortcut"
#     Click:  "Pin to Taskbar"
# 
#     Now if you click on this Taskbar icon, the WindowsForensicsModule will run anytime.
# 
# 
# Within the 'WindowsForensicsModule' directory, the 'RunWindowsForensicsProgram' can be run from 
# any location on the machine; however, regardless of where it is executed from, 
# the default location that the 'WindowsForensicsProgram' will always use for data, reports, 
# backups etc., is the 'WindowsPowerShell' location that the program copies 
# itself to during execution:
# 
#   'C:\Program Files\WindowsPowerShell\Modules\WindowsForensicsModule'
# ###########################################################################
#
#
# This WindowsForensicsprogram is directly tied to the WindowsForensicsModule
# Inside the WindowsForensicsModule directory is the "WindowsForensicsModule.psm1"
# This only works once the WindowsForensicsModule has been placed=copied=installed into a PowerShell Directory
# If the Copy-Item above does not work, such as user has no admin privs, it cant import then.
# Import uses the instructions on that local "WindowsForensicsModule.psm1"
#>
#------------------------------------
function Refresh-Screen {
    Write-Host("`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n") # The screen can leave residual text. This overwrites before clear
        Clear-Host
}# End function Refresh-Screen
#------------------------------------
Import-Module WindowsForensicsModule -Force

function Display-MainMenu {
    Write-Host("
|======================================================================|
|==================--- Windows Forensics Program ---===================|
|======================================================================|") # END WRITE-HOST
    #
    Write-Host("`n Selections:
-----------------------------------------------------------------------`n")
    Write-Host -ForegroundColor Yellow " 1. Preparation Phase"
    Write-Host -ForegroundColor Yellow " 2. Volatile Data Collection (Memory Forensics)"
    Write-Host -ForegroundColor Yellow " 3. Non-Volatile Data Collection (Disk Analysis)s"
    Write-Host -ForegroundColor Yellow " 4. Log Analysis"
    Write-Host -ForegroundColor Yellow " 5. Malware and Persistence Analysis"
    Write-Host -ForegroundColor Yellow " 6. Network Activity & Connections"
    Write-Host -ForegroundColor Yellow " 7. Advanced Analysis (if applicable)"
    Write-Host -ForegroundColor Yellow " 8. Documentation and Reporting"

    #

    Write-Host("------------------------------------------------------------------------")
    Write-Host -ForegroundColor Yellow ("`n   README - Program Summary `t`t`t`tEnter: `'readme`'`n")
    Write-Host("------------------------------------------------------------------------")
    Write-Host -ForegroundColor Yellow ("`n   HELP   - Enter the number + h  (1h, 2h, 3h...) `t`tEnter: `'#h`'`n")
    Write-Host -ForegroundColor Red ("   QUIT   - End the Windows Forensics Program `t`t`tEnter: `'quit`'`n") 
    Write-Host("------------------------------------------------------------------------")
} # End Function Display-MainMenu
#========================================================================
#--------------------------
#--------------------------
# Continuing do loop unless user quits
# Other menus/functions will resort back here when they are completed.
$Global:quit = ""   # Var allows for a full session quit from sub menus.
#--------------------------------------------------
do
{
    If ($Global:quit -eq "quit") {break}
    Refresh-Screen # Sub-Function
    Display-MainMenu      # Call local function. Print menu to screen
    $choice = Read-Host "`nEnter Choice"  #Ask user for menu choice
    Refresh-Screen # Sub-Function
    $choice = $choice -replace '\s', ''   #In case user enters spaces
    $choice = $choice.ToLower()           #In case user uses any capitol letters.
    #--------------------------------------------------
    #--------------------------------------------------
    #--------------------------------------------------
    #--------------------------------------------------
    #--------------------------------------------------
    switch ($choice)  # If menu options are chosen correctly.
    {
        # Option 1. Preparation Phase
        '1' 
        {
            Write-Host "1) Preparation Phase"
            #.\Menu\1_GPOsDomainMenu.ps1    # Execute GPO Search Menu script.
            <#
            
            #>
            If ($Global:quit -eq "quit") {break}
            
        }#END option 1-------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        '1h' # Help/Information for 1
        {
# Write-Host ==> Pressed left for formatting; Leave on the left.
Write-Host -ForegroundColor Yellow ("
----------
1h) Preparation Phase
        1) Document System Details (Hostname, OS version, IP/MAC addresses)
        2) Establish Chain of Custody
        3) Ensure Time Zone and Clock Synchronization (Record current system time)
        4) Create Forensic Image (use FTK Imager, dd, or equivalent tool)
        5) Verify Image Integrity (hash verification - MD5/SHA-256") # END WRITE-HOST

            Pause

        } # End 1h-----------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        # Option 2. Volatile Data Collection (Memory Forensics)
        '2' 
        {
            Write-Host "2. Volatile Data Collection (Memory Forensics)"

            If ($Global:quit -eq "quit") {break}
            
        }#END option 2-------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        '2h' # Help/Information for 2
        {
# Write-Host ==> Pressed left for formatting; Leave on the left.
Write-Host -ForegroundColor Yellow ("
----------
2. Volatile Data Collection (Memory Forensics)
        1) RAM Acquisition (Volatility, DumpIt, FTK Imager)
        2) Active Processes (tasklist, pslist)
        3) Open Network Connections (netstat -ano, TCPView)
        4) Current Logged-In Users (quser, logonsessions)
        5) Clipboard Data Capture (optional, depending on case)") # END WRITE-HOST

            Pause

        } # End 2h-----------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        # Option 3. Non-Volatile Data Collection (Disk Analysis) 
        '3' 
        {
            Write-Host "3. Non-Volatile Data Collection (Disk Analysis)"

            If ($Global:quit -eq "quit") {break}
            
        }#END option 3-------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        '3h' # Help/Information for 3
        {
# Write-Host ==> Pressed left for formatting; Leave on the left.
Write-Host -ForegroundColor Yellow ("
----------
3h. Non-Volatile Data Collection (Disk Analysis)
        System Artifacts
            * Registry Hives (SYSTEM, SECURITY, SOFTWARE, SAM, NTUSER.DAT)
            * Prefetch Files (C:\Windows\Prefetch)
            * Scheduled Tasks (schtasks, Task Scheduler Library)
            * Services (services.msc, sc query)
        User Activity
            * Recent Files (C:\Users\<User>\AppData\Roaming\Microsoft\Windows\Recent)
            * Jump Lists (%AppData%\Microsoft\Windows\Recent\AutomaticDestinations)
            * Browser History (Edge, Chrome, Firefox artifacts)
            * Downloads Folder (C:\Users\<User>\Downloads)
        File System Analysis
            * Analyze NTFS timestamps (MACE - Modified, Accessed, Created, Entry Modified)
            * Identify Hidden or Deleted Files (Recycle Bin, file carving)
            * Check Alternate Data Streams (ADS)
            * Identify and document encrypted or password-protected files") # END WRITE-HOST

            Pause

        } # End 3h-----------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        # Option 4. Log Analysis
        '4' 
        {
            Write-Host "4. Log Analysis"

            If ($Global:quit -eq "quit") {break}
            
        }#END option 4-------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        '4h' # Help/Information for 4
        {
# Write-Host ==> Pressed left for formatting; Leave on the left.
Write-Host -ForegroundColor Yellow ("
----------
4h. Log Analysis 
        * Event Logs (Application, Security, System) (Event Viewer, wevtutil)
        * PowerShell logs (%SystemRoot%\System32\winevt\Logs\Windows PowerShell.evtx)
        * Firewall Logs (Windows Defender Firewall)
        * Authentication Logs (Security.evtx, failed/successful logins)") # END WRITE-HOST

            Pause

        } # End 4h-----------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        # Option 5.
        '5' 
        {
            Write-Host "5. Malware and Persistence Analysis "

            If ($Global:quit -eq "quit") {break}
            
        }#END option 5-------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        '5h' # Help/Information for 5
        {
# Write-Host ==> Pressed left for formatting; Leave on the left.
Write-Host -ForegroundColor Yellow ("
----------
5h. Malware and Persistence Analysis 
        * Autorun Locations (Autoruns, registry run keys)
        * Known Startup Locations (Startup folders, Registry keys)
        * Examine Scheduled Tasks for persistence
        * Malware scans (Defender, Malwarebytes, custom indicators)") # END WRITE-HOST

            Pause

        } # End 5h-----------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        # Option 6. Network Activity & Connections
        '6' 
        {
            Write-Host "6. Network Activity & Connections "

            If ($Global:quit -eq "quit") {break}
            
        }#END option 6-------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        '6h' # Help/Information for 6
        {
# Write-Host ==> Pressed left for formatting; Leave on the left.
Write-Host -ForegroundColor Yellow ("
----------
6h. Network Activity & Connections 
        * DNS Cache (ipconfig /displaydns)
        * ARP Cache (arp -a)
        * Packet Captures (Wireshark, pktmon logs)
        * Network Shares and Mounted Drives (net use)") # END WRITE-HOST

            Pause

        } # End 6h-----------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        # Option 7. Advanced Analysis (if applicable)
        '7' 
        {
            Write-Host "7. Advanced Analysis (if applicable)"

            If ($Global:quit -eq "quit") {break}
            
        }#END option 7-------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        '7h' # Help/Information for 7
        {
# Write-Host ==> Pressed left for formatting; Leave on the left.
Write-Host -ForegroundColor Yellow ("
----------
7h. Advanced Analysis (if applicable)
        * Shellbags Analysis (Registry Explorer, Shellbags Explorer)
        * Volume Shadow Copies Analysis (vssadmin list shadows, access via forensic tools)
        * UserAssist keys analysis (Registry artifacts)") # END WRITE-HOST

            Pause

        } # End 7h-----------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        # Option 8. Documentation and Reporting
        '8' 
        {
            Write-Host "8. Documentation and Reporting"

            If ($Global:quit -eq "quit") {break}
            
        }#END option 8-------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        '8h' # Help/Information for 8
        {
# Write-Host ==> Pressed left for formatting; Leave on the left.
Write-Host -ForegroundColor Yellow ("
----------
8. Documentation and Reporting
        * Maintain accurate logs and documentation for every step performed
        * Capture screenshots of relevant findings and evidences
        * Prepare concise technical report highlighting key artifacts, analysis, timeline reconstruction, and conclusions.") # END WRITE-HOST

            Pause

        } # End 8h-----------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        # Option 8 - View all functions created for WindowsForensicsModule-----------------------
        '8' 
        {
            # Assumes execution of .\RunWindowsForensicsProgram.ps1 was done from inside \GPOProgam
            $functionPath = "C:\Program Files\WindowsPowerShell\Modules\WindowsForensicsModule"
            $functionList = Get-ChildItem "$functionPath\Functions\" -Force -Name
            do {
              $pick, $choiceName = ""
              Refresh-Screen # Sub-Function


              do {
                  $count=0
                  Clear-Host
                  Write-Host -ForegroundColor Yellow ("-------------`nWindowsForensicsModule Functions `n-------------`nThese functions are built to be used by the RunWindowsForensicsProgram, but nearly all can be used independantly. `nBy running this RunWindowsForensicsProgram, these functions have been imported into the WindowsPowerShell module/memory cache. `nThis section is to provide details on what actions are being taken, while in the RunWindowsForensicsProgram:`n-------------")
                  ForEach ($function in $functionList) {
                    $count++
                    # TrimEnd() ends up trimming too much, we need to be very selective
                    $function = $function.Substring(0, ($function).IndexOf(".ps1"))
                    Write-Host("$count`) $function")
                  } # End ForEach-------------------------------
      
                  
                  Write-Host -ForegroundColor Yellow ("-------------`nEnter 0 to Return the Prior Menu `nPick which WindowsForensicsModule function to view the help-summary on:")
                  $pick = Read-Host("`(1 - $count`)")
                  If ($pick -eq 0) {break}
              } until($pick -in 1..$count)
              

              If ($Global:quit -eq "quit") {break}
              If ($pick -eq 0) {
                Clear-Host
                break

              # Account for a single value list (not possible, but safety)
              } ElseIf (($pick -eq 1) -AND ($count -eq 1)) {
                $choiceName = $functionList
                $choiceName = $choiceName.Substring(0, ($choiceName).IndexOf(".ps1"))

              } ElseIf (($pick -in 1..$count) -AND ($count -gt 1)) {
                $choiceName = $functionList[$pick - 1]
                $choiceName = $choiceName.Substring(0, ($choiceName).IndexOf(".ps1"))
              } # End If/ElseIf


              Clear-Host
              Get-WindowsForensicsSummary -function $choiceName
              Pause
          } until($pick -eq 0)
            
        }#END option 8-------------------------------------
        #--------------------------------------------------
        '8h' # Help/Information for 8
        {
# Write-Host ==> Pressed left for formatting; Leave on the left.
Write-Host -ForegroundColor Yellow ("
----------
8) Get-Help WindowsForensicsModule Functions
----------
This section offers the ability to view the individual functions help sections. These 
functions have been imported into the WindowsPowerShell cache, and outside of this 
RunWindowsForensicsProgram, their help sections can be viewed with the standard PowerShell help:

    > Get-Help <functionName> -Full
    > Get-Help <functionName> -Synopsis
    > Get-Help <functionName> -Examples
    
However, while using the RunWindowsForensicsProgram in real-time, these PowerShell Get-Help functions
can overwrite, and simply be messy in the terminal. This section has just re-created the
Get-Help sections for each WindowsForensicsModule function, which can then be individually
searched for, and displayed while still using the RunWindowsForensicsProgram.
    ") # END WRITE-HOST

            Pause
        } # End 8h-----------------------------------------
        #--------------------------------------------------
        'readme' # Help/Information for main
        {
# Write-Host ==> Pressed left for formatting; Leave on the left.
Write-Host -ForegroundColor Yellow ("
-------------------------------------------------
README - WindowsForensicsModule and RunWindowsForensicsProgram Summary
-------------------------------------------------

  The 'WindowsForensicsModule' was built to accomplish 
  extensic Windows Forensics gathering.

    > Get-Help <function name> -full


  Step1: Install the WindowsForensicsModule
  Once downloaded, or cloned, then move to the downloaded 
  `"WindowsForensicsModule`" directory.
  ----------------
  From PowerShell:    
  	  > .\InstallWindowsForensicsModule.ps1
  

  This is the installation file for the entire module.
  Run this and the entire WindowsForensicsModule will be installed as a PowerShell module.
  You can also right-click on `"InstallWindowsForensicsModule.ps1`" and click:
    `"Run with Powershell`"


  You only need to run this once, and it will be installed. 
  Once installed, you can run functions individually or run the `"RunWindowsForensicsProgram`".



  All functions associated were built to be run primarily from the 'RunWindowsForensicsProgram'.
  Once `"InstallWindowsForensicsModule.ps1`" has been installed,
  From the directory location:       .....\WindowsForensicsModule\RunWindowsForensicsProgram\
  From PowerShell:
      > .\RunWindowsForensicsProgram.ps1

      Or you can right click on `"RunWindowsForensicsProgram.ps1`" and click `"Run with PowerShell`"


  ALSO - once `"InstallWindowsForensicsModule.ps1`" has been run, and WindowsForensicsModule has been 
  installed in the PowerShell cache, you can then copy the `"RunWindowsForensicsProgram - Shortcut`" anywhere
  on the machine. For example, once `"WindowsForensicsModule`" has been installed, 
      Right click on  `"RunWindowsForensicsProgram - Shortcut`"
      Click:  `"Pin to Taskbar`"


  Now if you click on this Taskbar icon, the WindowsForensicsModule will run anytime.
  However, regardless of where it is executed from, the default location that 
  the 'RunWindowsForensicsProgram' will always use for data, reports, backups etc., is the 
  'WindowsPowerShell' location that the program copies itself to during execution:

    'C:\Program Files\WindowsPowerShell\Modules\WindowsForensicsModule'



  ------------------------------------------------------------------
  This Module setup can be done automatically by running the 'InstallWindowsForensicsModule.ps1'.
  As an Administrator in PowerShell:


	1) Move to where the directory was downloaded to 'cd ....\WindowsForensicsModule\'
	2) Once at the \WindowsForensicsModule location, from PowerShell Terminal run:

	  > .\InstallWindowsForensicsModule.ps1

  Or you can right click on `"InstallWindowsForensicsModule.ps1`" and click `"Run with PowerShell`"


	3) This will automatically:
		a) Copy the 'WindowsForensicsModule' into 'C:\Program Files\WindowsPowerShell\Modules'
		b) Import the modules into the PowerShell memory cache.
		c) This only needs to be done 1-time, when you first download WindowsForensicsModule



  As stated, the 'WindowsForensicsModule' was built to be used through the 'RunWindowsForensicsProgram'; but 
  most of these functions can be run individually IF they have been installed/imported into 
  the PowerShell Module cache. This can be done in two ways:

  1) Easiest is to follow the instructions above.


  OR


  2) Standard PowerShell Module Installation:
  ------------------------------------------------------------------
  2a) First action is to copy the 'WindowsForensicsModule' directory to:

    'C:\Program Files\WindowsPowerShell\Modules'




  2b) This can be done through PowerShell.
      First, move TO the downloaded \WindowsForensicsModule location such as, 
      \Desktop, \Downloads, etc., then copy the directory to the target:

    > Copy-Item .\WindowsForensicsModule\ -Destination `"C:\Program Files\WindowsPowerShell\Modules`" -Force -Recurse




  2c) Then from PowerShell, execute the target module import:

    > Import-Module -Name `"WindowsForensicsModule`"



  Now all 'WindowsForensicsModule' functions will be active.
  It is still recommended to operate 'WindowsForensicsModule' through the:

    > .\RunWindowsForensicsProgram.ps1






  To Remove the WindowsForensicsModule:
  ------------------------------------------------------------------
  NOTE - There may be an error in PowerShell if you have this directory open 
  in Windows Finder while you try to execute this Remove-Item:

    > Remove-Item -Path `"C:\Program Files\WindowsPowerShell\Modules\WindowsForensicsModule\`" -Force -Recurse




  Once you have removed the directory, then remove the module from the memory cache: 

    > Remove-Module -Name `"WindowsForensicsModule`"
    
    -----------------------------------------------
 ") # END WRITE-HOST
 #--------------------------------------------------

            Pause
        } # End readme-------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        #--------------------------------------------------
        'quit' 
        {
            $Global:quit = "quit"
            $choice = "q"
        #--------------------------------------------------
        } # End quit       
    #--------------------------------------------------
    }# END Switch
    #--------------------------------------------------

    Display-MainMenu #Refresh main menu

} until (($choice -eq '0')) #END do Loop
