<#
.SYNOPSIS
    This PowerShell script ensures Kerberos encryption types must be configured to prevent the use of DES and RC4 encryption suites.

.NOTES
    Author          : Travis Young
    LinkedIn        : https://www.linkedin.com/in/travis-young-516156102/
    GitHub          : https://github.com/YoungTravis03
    Date Created    : 2026-06-02
    Last Modified   : 2064-09-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000190
    Documentation   : https://stigaview.com/products/win11/v2r3/WN11-SO-000190/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-SO-000190).ps1 
#>

# YOUR CODE GOES HERE

# Registry path
$RegPath = "HKLM:\SOFTWARE\Microsoft\CurrentVersion\Policies\System\Kerberos\Parameters"

# Create the registry key if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set SupportedEncrytionTypes = 0x7FFFFFF8
New-ItemProperty -Path $RegPath `
                 -Name "SupportedEncrytionTypes" `
                 -PropertyType DWord `
                 -Value 0x7FFFFFF8 `
                 -Force | Out-Null

Write-Host "SupportedEncrytionTypes has been set to 0x7FFFFFF8."

Value Name: SupportedEncryptionTypes

Value Type: REG_DWORD
Value: 0x7ffffff8 (2147483640)
