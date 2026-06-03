<#
.SYNOPSIS
    This PowerShell script ensures printing over HTTP must be prevented.

.NOTES
    Author          : Travis Young
    LinkedIn        : https://www.linkedin.com/in/travis-young-516156102/
    GitHub          : https://github.com/YoungTravis03
    Date Created    : 2026-06-03
    Last Modified   : 2064-09-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000190
    Documentation   : https://stigaview.com/products/win11/v2r3/WN11-SO-000110/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-SO-000110).ps1 
#>

# YOUR CODE GOES HERE
Registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"

# Create the registry key if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set DisableHTTPPrinting = 1
New-ItemProperty -Path $RegPath `
                 -Name "DisableHTTPPrinting" `
                 -PropertyType DWord `
                 -Value 1 `
                 -Force | Out-Null

Write-Host "DisableHTTPPrinting policy has been configured."
