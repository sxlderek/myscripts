### PURPOSE: set the regional settings for win10+ pc
### USAGE  : scriptname [options]
### LICENSE: MIT License / (C) @sxlderek

# for US users and Servers
Set-PSDebug -Trace 2
Install-Language -Language en-US -AsJob -CopyToSettings
Set-TimeZone -Id "China Standard Time"
Set-Culture -CultureInfo en-US
Set-WinSystemLocale -SystemLocale en-US
Set-WinHomeLocation -GeoId 224  # set location to US
Set-WinLanguageBarOption  # reset the language bar
$UserLanguageList = New-WinUserLanguageList -Language en-US
Set-WinUserLanguageList -Force -LanguageList $UserLanguageList
if ( $OSVersion.Major -gt 10 ) { Copy-UserInternationalSettingsToSystem 
    -WelcomeScreen $True -NewUser $True }
Write-host "Restart-Computer"
Write-host "Manually change timezone if not in HK"
