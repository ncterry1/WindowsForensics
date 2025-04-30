### Module Entry: WindowsForensicsModule.psm1

#-----------------------------------------------------------------------------
<#
.AUTHOR
    Nate Terry

.SYNOPSIS
    I’ve laid out a full PowerShell module scaffolding—manifest, entry script, 
    directory structure, and one example function—to collect each category of forensic data. 
    You can add your Python/C# helpers in the Tools folder and call them via the 
    Invoke-ExternalTool helper in Private. From here, flesh out similar PublicFunctions 
    for non-volatile artifacts, logs, persistence checks, and network activity. 
    This WindowsForensicsModule has many related functions that were built for the 
    subdirectory/program "WindowsForensicsProgram". This PSM1 file allows for the functions in WindowsForensicsModule 
    to be imported into the PowerShell memory for module-based, independant use.

.DESCRIPTION
    When this module is imported, the functions are loaded using dot sourcing below. 
    Primary Module imports are done here to apply to all related sub-functions. 
    This  .psm1(module) cannot be executed directly as a script, it will only be called 
    when importing this module.


    1) Find local module pathways:  
        > $env: $PSModulePath


    2) Move this "\WindowsForensicsModule" to one of those module pathways.
        By default, .\RunWindowsForensicsProgram.ps1 will create\move the program, and data will always be saved to:
        C:\Program Files\WindowsPowerShell\Modules\WindowsForensicsModule


    3) Now Import the module:  
        > Import-Module "WindowsForensicsModule" -Force -Verbose


    This can be done seperately, but is built to be called just by executing the "WindowsForensicsProgram"
        > .\InstallWindowsForensicsModule.ps1


    Calling .\RunWindowsForensicsProgram.ps1 from the \WindowsForensicsProgram directory will then run the WindowsForensicsProgram,
	but only once the WindowsForensicsModule has been installed. 
#>


#-----------------------------------------------------------------------------
# May be needed for other sub-functions, so imported here from the .psm1 
Import-Module GroupPolicy       #Remote Server Administration Tools must have be installed
Import-Module ActiveDirectory   #Remote Server Administration Tools must have be installed


# Get the path to the function files. $PSScriptRoot = Script path
# $PSScriptRoot only works by executing the script. Selective execution(F8) will not be successful.
# This is built to be an imported Windows PowerShell script.
# The default location will be in: C:\Program Files\WindowsPowerShell\Modules\WindowsForensicsModule\
# This .psm1 should be in the WindowsForensicsModule directory.
# Used next to import the sub-functions
$functionPath = $PSScriptRoot + "\functions\"


# Get a list of all the function file names
$functionList = Get-ChildItem -Path $functionPath -Name


# Loop over all of the files and dot source them into system memory
# dot in for loop = keep everything found in memory i.e. dot-sourcing
ForEach ($function in $functionList) {
    . ($functionPath + $function)
}#End ForEach
