### PURPOSE: send email to systems@sxl.net
### USAGE  : scriptname <msg>
### LICENSE: MIT License / (C) @sxlderek

$WarningPreference="SilentlyContinue"
$from="mailsend@sxl.net"
$to="derek@sxl.net"
$cc="systems@sxl.net"
$smtp="mail.sxl.net" ; $port="587"
$user="mailsend@sxl.net"
$pass=(Get-Content "c:\drv\mail2sys.key" -Raw)
$secpasswd = ConvertTo-SecureString "$pass"-AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ("$user", $secpasswd)
$body="$args"
$subj=$body.Substring(5)

Send-MailMessage -SmtpServer $smtp -Port $port -Credential $cred `
    -From "$from" -To  "$to" -Cc "$cc" -Subject "$subj" -Body "$body"
