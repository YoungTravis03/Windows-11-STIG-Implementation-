<#
.SYNOPSIS
    This PowerShell script ensures that camera access from the lock screen must be disabled..

.NOTES
    Author          : Travis Young
    LinkedIn        : https://www.linkedin.com/in/travis-young-516156102/
    GitHub          : https://github.com/YoungTravis03
    Date Created    : 2026-05-31
    Last Modified   : 2064-09-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000005
    Documentation   : https://stigaview.com/products/win11/v2r3/WN11-CC-000005/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000005).ps1 
#>

# YOUR CODE GOES HEREWindows Registry Editor Version 5.00

# Registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"

# Create the registry key if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set NoLockScreenCamera = 1
New-ItemProperty -Path $RegPath `
                 -Name "NoLockScreenCamera" `
                 -PropertyType DWord `
                 -Value 1 `
                 -Force | Out-Null

Write-Host "NoLockScreenCamera policy has been configured."
