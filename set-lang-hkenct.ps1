### PURPOSE: set the regional settings for win10+ pc
### USAGE  : scriptname [options]
### LICENSE: MIT License / (C) @sxlderek

Install-Language -Language en-US
Install-Language -Language zh-HK
Set-TimeZone -Id "China Standard Time"
Set-Culture -CultureInfo en-HK
Set-WinSystemLocale -SystemLocale en-HK
Set-WinHomeLocation -GeoId 104  # set location to hk
Set-WinLanguageBarOption  # reset the language bar
$LanguageList = New-WinUserLanguageList -Language en-US
$LanguageList.Add("zh-HK")
$LanguageList[1].Handwriting = $True
$LanguageList[1].InputMethodTips.Clear()
$langpfx='0404:{531FDEBF-9B4C-4A43-A2AA-960E8FCDC732}'
$LanguageList[1].InputMethodTips.Add("$langpfx{6024B45F-5C54-11D4-B921-0080C882687E}") #速成
$LanguageList[1].InputMethodTips.Add("$langpfx{4BDF9F03-C7D3-11D4-B2AB-0080C882687E}") #倉頡
Set-WinUserLanguageList -Force -LanguageList $LangList
Set-WinUILanguageOverride -Language en-HK
Copy-UserInternationalSettingsToSystem -WelcomeScreen $True -NewUser $True
Write-host "Restart-Computer"
