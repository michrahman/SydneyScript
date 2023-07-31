function NewPassword($unikey, $defaultpass = "stucomp15449!")
{
    $unikey = Read-Host -Prompt "Unikey"
    InformationPull
    Set-ADAccountPassword -Identity $unikey -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $defaultpass -Force) -Confirm
    Set-ADUser -Identity $unikey -ChangePasswordAtLogon $true
    Write-Host "Password Changed!"
    Set-Clipboard -Value $defaultpass
}

function UnikeyInformation($unikey)
{
    $unikey = Read-Host -Prompt "Unikey"
    InformationPull
    foreach ($group in $grouplist){
        (Get-ADGroup $group).name
    }
}

function InformationPull
{
    Clear-Variable -Name "group","grouplist"
    Get-ADUser $unikey | Select-Object -Property Enabled,GivenName,Surname,SamAccountName,AccountExpirationDate
    $grouplist=(Get-ADUser $unikey -Properties MemberOf).MemberOf
}

function SharedUnlock
{
    $unikey = Read-Host -Prompt "Unikey"
    Unlock-ADAccount -Identity $unikey -Confirm
    Write-Host "Shared Account Unlocked"
}

function AddGoogleMFA
{
    $unikey = Read-Host -Prompt "Unikey"
    Add-ADGroupMember -Identity $unikey -Members Okta_MFA_Google_Auth -Confirm
    Write-Host "Added to Google MFA"
}

function TemporaryMFA
{
    $unikey = Read-Host -Prompt "Unikey"
    Add-ADGroupMember -Identity $unikey -Members Okta_MFA_Temporary_1Day_Exemption  -Confirm
    Write-Host "MFA Deactivated for 1 Day"
}

function Menu
{
    $MenuSele
    Clear-Host
    Write-Host "Extro Labs 2.0"
    Write-Host "1: Unikey Information"
    Write-Host "2: New Password"
    Write-Host "3: Unlock Account (beta)"
    Write-Host "4: Add User to Google Auth Okta (beta)"
    Write-Host
    $MenuSelection = Read-Host "Menu Selection"
}
