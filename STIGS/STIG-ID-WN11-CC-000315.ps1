<#
.SYNOPSIS
    This PowerShell script ensures that The Windows Installer feature "Always install with elevated privileges" must be disabled..

.NOTES
    Author          : Travis Young
    LinkedIn        : https://www.linkedin.com/in/travis-young-516156102/
    GitHub          : https://github.com/YoungTravis03
    Date Created    : 2026-05-31
    Last Modified   : 2064-09-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315
    Documentation   : https://stigaview.com/products/win11/v2r3/WN11-CC-000315/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000315).ps1 
#>

# YOUR CODE GOES HEREWindows Registry Editor Version 5.00Windows Registry Editor Version 5.00

# Registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"

# Create the registry key if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set AlwaysInstallElevated = 0
New-ItemProperty -Path $RegPath `
                 -Name "AlwaysInstallElevated" `
                 -PropertyType DWord `
                 -Value 0 `
                 -Force | Out-Null

Write-Host "AlwaysInstallElevated has been set to 0."

