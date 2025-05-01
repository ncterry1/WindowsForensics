# WindowsForensics
# Windows Forensics Module
We’ve laid out a full PowerShell module scaffolding—manifest, entry script, directory structure, 
and one example function—to collect each category of forensic data. We can add your Python/C# helpers 
in the Tools folder and call them via the Invoke-ExternalTool helper in Private. From here, create 
similar PublicFunctions for non-volatile artifacts, logs, persistence checks, and network activity. 

Best Practices for Your Private Folder
------------------------------------------------
1) Naming: Prefix helper functions with nouns 
(e.g. Get-, Invoke-) and avoid Export- or Set- since they’re internal.

2) Error Handling: Use Try/Catch in the private helper and wrap exceptions 
in your own custom exception type so public functions can catch them if needed.

3) Logging & Verbose: Emit Write-Verbose messages at key stages—mounting registry, 
hashing start/end, external tool invocation—so users running with -Verbose 
see a clear trace.

4) Parameter Validation: Use [ValidateSet()], [ValidateNotNullOrEmpty()], 
and [Parameter(Mandatory)] on internal functions to guard against bad inputs.

5) Modularity: Keep each helper focused on one task. If you find a function 
growing beyond ~50 lines, split it further (e.g. separate loading vs. parsing vs. cleanup).

By keeping these helpers well-structured and well-documented, our public 
cmdlets become simple orchestrators—just “call this, call that, package 
results”—while the real heavy lifting stays hidden and maintainable.


Folder Structure:   
The Private\ folder is where you put all of the internal “plumbing” that your public cmdlets 
rely on—helper routines you don’t intend users to call directly, but which keep your public 
functions DRY, robust, and consistent.**
--------------------------------------
WindowsForensicsModule/  
├── WindowsForensicsModule.psm1           # Root module file (dot-sources all functions)  
├── InstallWindowsForensicsModule.ps1     # Installation script (copies to PSModulePath, imports)  
├── WindowsForensicsModule.psd1           # Manifest (versioning, exported commands, dependencies)  
├── ReadMe.md                             # Basic usage & examples  
├── RunWindowsForensicsProgram.ps1        # Main CLI entry point  
├── Functions/                            # All user-facing forensic commands  
│   ├── EventLogs/  
│   │   ├── Get-SystemLogs.ps1  
│   │   └── Analyze-SecurityEvents.ps1  
│   ├── RegistryAnalysis/  
│   │   ├── Export-RegistryHives.ps1  
│   │   └── Compare-RegistrySnapshots.ps1  
│   └── NetworkAnalysis/  
│       ├── Capture-NetworkTraffic.ps1  
│       └── Analyze-NetworkPackets.ps1  
├── Menus/                                # Interactive menu scripts  
│   ├── MainMenu.ps1  
│   ├── EventLogMenu.ps1  
│   ├── RegistryMenu.ps1  
│   └── NetworkMenu.ps1  
└── Utils/                                # Private/internal helpers (not exported)  
    ├── Write-Log.ps1  
    └── ScreenHelpers.ps1  



Here's a structured checklist to begin a Windows forensic scan, emphasizing key system areas, artifacts, and actions:

****Windows Forensics Checklist****  
***1. Preparation Phase***
 
     *- Document System Details (Hostname, OS version, IP/MAC addresses)  
     *- Establish Chain of Custody  
     *- Ensure Time Zone and Clock Synchronization (Record current system time)  
     *- Create Forensic Image (use FTK Imager, dd, or equivalent tool)  
     *- Verify Image Integrity (hash verification - MD5/SHA-256)  

***2. Volatile Data Collection (Memory Forensics)***
 
     *- RAM Acquisition (Volatility, DumpIt, FTK Imager)  
     *- Active Processes (tasklist, pslist)  
     *- Open Network Connections (netstat -ano, TCPView)   
     *- Current Logged-In Users (quser, logonsessions)  
     *- Clipboard Data Capture (optional, depending on case)  

***3. Non-Volatile Data Collection (Disk Analysis)***

      **System Artifacts**  
       *- Registry Hives (SYSTEM, SECURITY, SOFTWARE, SAM, NTUSER.DAT)*  
       *- Prefetch Files (C:\Windows\Prefetch)*  
       *- Scheduled Tasks (schtasks, Task Scheduler Library)*  
       *- Services (services.msc, sc query)*  
      
      **User Activity**  
       *- Recent Files (C:\Users\<User>\AppData\Roaming\Microsoft\Windows\Recent)*  
       *- Jump Lists (%AppData%\Microsoft\Windows\Recent\AutomaticDestinations)*  
       *- Browser History (Edge, Chrome, Firefox artifacts)*  
       *- Downloads Folder (C:\Users\<User>\Downloads)*  
      
      **File System Analysis**  
       *- Analyze NTFS timestamps (MACE - Modified, Accessed, Created, Entry Modified)*  
       *- Identify Hidden or Deleted Files (Recycle Bin, file carving)*  
       *- Check Alternate Data Streams (ADS)*  
       *- Identify and document encrypted or password-protected files*  

***4. Log Analysis***  

     *- Event Logs (Application, Security, System) (Event Viewer, wevtutil) 
     *- PowerShell logs (%SystemRoot%\System32\winevt\Logs\Windows PowerShell.evtx)  
     *- Firewall Logs (Windows Defender Firewall)  
     *- Authentication Logs (Security.evtx, failed/successful logins)  

***5. Malware and Persistence Analysis***  

     *- Autorun Locations (Autoruns, registry run keys)  
     *- Known Startup Locations (Startup folders, Registry keys)  
     *- Examine Scheduled Tasks for persistence  
     *- Malware scans (Defender, Malwarebytes, custom indicators)  

***6. Network Activity & Connections***  

     *- DNS Cache (ipconfig /displaydns)  
     *- ARP Cache (arp -a)  
     *- Packet Captures (Wireshark, pktmon logs)  
     *- Network Shares and Mounted Drives (net use)  

***7. Advanced Analysis (if applicable)***  

     *- Shellbags Analysis (Registry Explorer, Shellbags Explorer)  
     *- Volume Shadow Copies Analysis (vssadmin list shadows, access via forensic tools)  
     *- UserAssist keys analysis (Registry artifacts)  

***8. Documentation and Reporting***  

     *- Maintain accurate logs and documentation for every step performed  
     *- Capture screenshots of relevant findings and evidences  
     *- Prepare concise technical report highlighting key artifacts, analysis, timeline reconstruction, and conclusions.  

This structured checklist provides a systematic starting point for Windows forensic investigations, covering critical system areas, artifacts, and procedures. Adjustments should be made based on the specific scope, objectives, and context of the investigation.







