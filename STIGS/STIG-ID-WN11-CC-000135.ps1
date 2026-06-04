<#
.SYNOPSIS
    This PowerShell script ensures indexing of encrypted files must be turned off.

.NOTES
    Author          : Travis Young
    LinkedIn        : https://www.linkedin.com/in/travis-young-516156102/
    GitHub          : https://github.com/YoungTravis03
    Date Created    : 2026-06-03
    Last Modified   : 2064-09-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000135
    Documentation   : https://stigaview.com/products/win11/v2r3/WN11-CC-000135/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000135).ps1 
#>

# YOUR CODE GOES HERE

# Registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"

# Create the registry key if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set AllowIndexingEncryptedStoresOrItems = 1
New-ItemProperty -Path $RegPath `
                 -Name "AllowIndexingEncryptedStoresOrItems" `
                 -PropertyType DWord `
                 -Value 1 `
                 -Force | Out-Null

Write-Host "AllowIndexingEncryptedStoresOrItems policy has been configured."
