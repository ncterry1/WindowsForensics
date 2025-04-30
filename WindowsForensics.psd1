<#---------------------------------
Why you need a manifest------------THERE ARE CHANGES TO BE MADE IN MANIFEST
-----------------------------------
Discovery & loading - PowerShell uses the manifest to locate your root module (.psm1 or DLL), 
so it can Import-Module correctly.

Versioning & signing - You declare your module’s version and optionally specify a strong-name signature, 
helping you manage updates and trust.

Dependency management - You can declare required PowerShell versions, modules or assemblies, 
ensuring that your forensic toolkit runs only in supported environments.

Export control - You explicitly list which functions, cmdlets, aliases, variables or DSC resources 
are made public, preventing accidental exposure of internal helpers.

Documentation & discoverability - Fields like Author, Description, Copyright, Tags and URIs make your 
module easier to find, understand, and maintain.
-------------------------------------------------------------------------------
--------------Key fields in WindowsForensics.psd1------------------------------
-------------------------------------------------------------------------------
Field	                What it does	                   Example
RootModule	            Entry point (psm1 or DLL)	       'WindowsForensics.psm1'
ModuleVersion	        Your semantic version	           '1.0.0'
GUID	                Unique identifier for the module   'XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX'
Author / CompanyName	Who wrote/owns it	               'YourName' / 'YourCompany'
Description	            Brief summary of purpose	       'PowerShell module for Windows forensic data collection'
FunctionsToExport	    List of public cmdlet names	        @('Get-VolatileData','Get-NonVolatileData',…)
CmdletsToExport	        (Optional) explicit cmdlets if different from functions	–------------
AliasesToExport	        (Optional) any aliases you want publicly available	–----------------
VariablesToExport	    (Optional) variables to expose	–------------------------------------
NestedModules	        Modules (DLLs or other psms) to auto-load	–------------------------
RequiredModules	        Other PowerShell modules you depend on	                @{ ModuleName='PSReadLine'; ModuleVersion='2.1.0'}
RequiredAssemblies	    .NET DLLs your code calls via Add-Type	                @('ForensicHelpers.dll')
PowerShellVersion	     Minimum PS version needed	                            '5.1'
PrivateData / PSData	 Free-form metadata (tags, project URI, license URI)	{ PSData = @{ Tags=@('Forensics','Windows'); ProjectUri='…' } }
#>
<#------------------------------------------
What WE NEED TO DO IN THIS MANIFEST---------
--------------------------------------------
1) Always set RootModule to your .psm1 file name.
2) Pick a semantic ModuleVersion (Major.Minor.Patch).
3) Generate or copy-paste a GUID (e.g., via New-Guid).
4) Fill in Author, CompanyName, and a concise Description.
5) List every public function/cmdlet in FunctionsToExport.
6) If you rely on other modules or .NET assemblies, declare them in RequiredModules and RequiredAssemblies.
7) Use PrivateData.PSData to tag, link to your repo, and point to your license.

With that in place, PowerShell will treat your folder as a first-class module—discoverable, versioned, and safe to import.
------------------------------------------#>
@{
  # -- Core module info --
  RootModule        = 'WindowsForensics.psm1'
  ModuleVersion     = '1.0.0'
  GUID              = 'XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX'
  Author            = 'Nate Terry'
  CompanyName       = 'NCT Industries'
  Copyright         = '(c) 2025 YourCompany'
  Description       = 'PowerShell module for Windows forensic data collection'

  # -- What this module makes public --
  FunctionsToExport = @('Get-VolatileData','Get-NonVolatileData','Invoke-LogAnalysis','Test-Persistence','Get-NetworkActivity')

  # -- Dependencies & requirements --
  PowerShellVersion = '5.1'
  RequiredModules   = @(@{ ModuleName='PSReadLine'; ModuleVersion='2.1.0' })
  RequiredAssemblies= @('ForensicHelpers.dll')

  # -- Optional extra metadata --
  PrivateData       = @{
    PSData = @{
      Tags       = @('Forensics','Windows','Security')
      ProjectUri = 'https://github.com/YourRepo/WindowsForensics'
      LicenseUri = 'https://opensource.org/licenses/MIT'
    } # END PSData = @{
  } # END PrivateData
} # END MODULE @{
