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
    STIG-ID         : WN11-OO-000065
    Documentation   : https://stigaview.com/products/win11/v2r3/WN11-OO-000065/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-OO-000065).ps1 
#>

# YOUR CODE GOES HERE

# Registry path
$RegPath = "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config"

# Create the registry key if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set PowerDelayLowPowerScan = 0x00124F80
New-ItemProperty -Path $RegPath `
                 -Name "PowerDelayLowPowerScan" `
                 -PropertyType DWord `
                 -Value 0x00124F80 `
                 -Force | Out-Null

# Set AutoConnectAllowedOEM = 0
New-ItemProperty -Path $RegPath `
                 -Name "AutoConnectAllowedOEM" `
                 -PropertyType DWord `
                 -Value 0 `
                 -Force | Out-Null

Write-Host "WiFi Network Manager settings have been configured."
