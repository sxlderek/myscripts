### PURPOSE: set the regional settings for win10+ pc
### USAGE  : scriptname [options]
### LICENSE: MIT License / (C) @sxlderek

# HK CT-only users
Install-Language -Language en-US -AsJob
Install-Language -Language zh-HK -AsJob -CopyToSettings
Set-TimeZone -Id "China Standard Time"
Set-Culture -CultureInfo zh-HK
Set-WinSystemLocale -SystemLocale zh-HK
Set-WinHomeLocation -GeoId 104  # set location to hk
Set-WinLanguageBarOption  # reset the language bar
$LanguageList = New-WinUserLanguageList -Language zh-HK
$LanguageList[0].Handwriting = $True
$LanguageList[0].InputMethodTips.Clear()
$ime="0404:{531FDEBF-9B4C-4A43-A2AA-960E8FCDC732}"
$ime+="{6024B45F-5C54-11D4-B921-0080C882687E}" #速成
$LanguageList[0].InputMethodTips.Add("$ime}")
$ime="0404:{531FDEBF-9B4C-4A43-A2AA-960E8FCDC732}"
$ime+="{4BDF9F03-C7D3-11D4-B2AB-0080C882687E}" #倉頡
$LanguageList[0].InputMethodTips.Add("$ime}")
Set-WinUserLanguageList -Force -LanguageList $LanguageList
Set-WinUILanguageOverride -Language zh-HK
if ( $OSVersion.Major -gt 10 ) { Copy-UserInternationalSettingsToSystem 
    -WelcomeScreen $True -NewUser $True }
Write-host "Restart-Computer"
