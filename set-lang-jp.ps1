### PURPOSE: set the regional settings for win10+ pc
### USAGE  : scriptname [options]
### LICENSE: MIT License / (C) @sxlderek

# for JP users
Install-Language -Language en-US
Install-Language -Language ja-JP
Set-TimeZone -Id "Tokyo Standard Time"
Set-Culture -CultureInfo ja-JP
Set-WinSystemLocale -SystemLocale ja-JP
Set-WinHomeLocation -GeoId 122  # set location to jp
Set-WinLanguageBarOption  # reset the language bar
$LanguageList = New-WinUserLanguageList -Language en-US
$LanguageList.Add("ja-JP")
$LanguageList[1].Handwriting = $True
$LanguageList[1].InputMethodTips.Clear()
$ime="0411:{03B5835F-F03C-411B-9CE2-AA23E1171E36}"
$ime+="{A76C93D9-5523-4E90-AAFA-4DB112F9AC76}"
$LanguageList[1].InputMethodTips.Add("$ime") #ja-JP
Set-WinUserLanguageList -Force -LanguageList $LanguageList
Set-WinUILanguageOverride -Language ja-JP
Copy-UserInternationalSettingsToSystem -WelcomeScreen $True -NewUser $True
Write-host "Restart-Computer"
