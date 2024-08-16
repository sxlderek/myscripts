### PURPOSE: set the regional settings for win10+ pc
### USAGE  : scriptname [options]
### LICENSE: MIT License / (C) @sxlderek

# HK EN users
Set-TimeZone -Id "China Standard Time"
Set-Culture -CultureInfo en-HK
Set-WinSystemLocale -SystemLocale en-US
Set-WinHomeLocation -GeoId 104  # set location to hk
Set-WinLanguageBarOption  # reset the language bar
$UserLanguageList = New-WinUserLanguageList -Language en-US
Set-WinUserLanguageList -Force -LanguageList $UserLanguageList
if ( $OSVersion.Major -gt 10 ) { Copy-UserInternationalSettingsToSystem 
    -WelcomeScreen $True -NewUser $True }
Write-host "Restart-Computer"
