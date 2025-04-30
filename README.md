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
#WindowsForensics\  
  ├── WindowsForensics.psd1       # Module manifest  
  ├── WindowsForensics.psm1       # Module entry script  
  ├── PublicFunctions\            # Publicly exported functions  
  │     ├── Get-VolatileData.ps1  
  │     ├── Get-NonVolatileData.ps1  
  │     ├── Invoke-LogAnalysis.ps1  
  │     ├── Test-Persistence.ps1  
  │     ├── Get-NetworkActivity.ps1  
  │     ├── ...  
  │     ├── ...  
  │     ├── ...  
  ├── Private\                      #Internal helper functions  
  │     ├── Get-RegistryHive.ps1  
  │     ├── Get-PrefetchFiles.ps1  
  │     ├── Invoke-HashCheck.ps1  
  │     ├── Invoke-ExternalTool.ps1  
  │     ├── ...  
  │     ├── ...  
  │     ├── ...  
  └── Tools\                      # External binaries or scripts (C#/Python DLLs)  
        └── ForensicHelpers.dll   # (optional placeholder)  

