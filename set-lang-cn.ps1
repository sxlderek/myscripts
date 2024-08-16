### PURPOSE: set the regional settings for win10+ pc
### USAGE  : scriptname [options]
### LICENSE: MIT License / (C) @sxlderek

# for CN users
Set-PSDebug -Trace 2
Install-Language -Language en-US
Install-Language -Language zh-CN
Set-TimeZone -Id "China Standard Time"
Set-Culture -CultureInfo zh-CN
Set-WinSystemLocale -SystemLocale zh-CN
Set-WinHomeLocation -GeoId 45  # set location to cn
Set-WinLanguageBarOption  # reset the language bar
$LanguageList = New-WinUserLanguageList -Language zh-CN
$LanguageList[0].Handwriting = $True
$LanguageList[0].InputMethodTips.Clear()
$ime="0804:{81D4E9C9-1D3B-41BC-9E6C-4B40BF79E35E}{FA550B04-5AD7-411F-A5AC-CA038EC515D7}" #併音
$LanguageList[0].InputMethodTips.Add("$ime") 
$ime="0804:{6A498709-E00B-4C45-A018-8F9E4081AE40}{82590C13-F4DD-44F4-BA1D-8667246FDF8E}" #五筆
$LanguageList[0].InputMethodTips.Add("$ime") 
Set-WinUserLanguageList -Force -LanguageList $LanguageList
Set-WinUILanguageOverride -Language zh-CN
if ( $OSVersion.Major -gt 10 ) { Copy-UserInternationalSettingsToSystem 
    -WelcomeScreen $True -NewUser $True }
Write-host "Restart-Computer"
