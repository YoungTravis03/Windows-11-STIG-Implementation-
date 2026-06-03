<#
.SYNOPSIS
    This PowerShell script ensures that Microsoft consumer experiences must be turned off.

.NOTES
    Author          : Travis Young
    LinkedIn        : https://www.linkedin.com/in/travis-young-516156102/
    GitHub          : https://github.com/YoungTravis03
    Date Created    : 2024-06-02
    Last Modified   : 2064-09-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000197
    Documentation   : https://stigaview.com/products/win11/v2r3/WN11-CC-000197/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000197).ps1 
#>

# YOUR CODE GOES HERE
Windows Registry Editor Version 5.00Windows Registry Editor Version 5.00
# Registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set DisableWindowsConsumerFeatures = 1
New-ItemProperty -Path $RegPath `
                 -Name "DisableWindowsConsumerFeatures" `
                 -PropertyType DWord `
                 -Value 1 `
                 -Force | Out-Null

Write-Host "DisableWindowsConsumerFeatures policy has been configured."
