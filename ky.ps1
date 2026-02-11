cls
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$host.UI.RawUI.WindowTitle = "SECURE REMOTE TERMINAL"

function Type-Text($text, $color="White", $delay=20) {
    foreach ($char in $text.ToCharArray()) {
        Write-Host -NoNewline $char -ForegroundColor $color
        Start-Sleep -Milliseconds $delay
    }
    Write-Host ""
}

function Percent-Load($text, $speed=15) {
    for ($i=1; $i -le 100; $i++) {
        Write-Host "`r$text $i%" -NoNewline -ForegroundColor Green
        Start-Sleep -Milliseconds $speed
    }
    Write-Host ""
}

Type-Text "[+] Target IP located: 93.85.84.255" "Yellow"
Start-Sleep 2
Type-Text "[+] Port 57 OPEN" "Green"
Start-Sleep 2
Type-Text "Establishing SSH session..." "Cyan"
Percent-Load "Encrypting channel... "

Type-Text "[+] Login: admin" "Yellow"
Start-Sleep 1
Type-Text "[+] Access granted" "Green"
Start-Sleep 2

Write-Host ""
Write-Host "admin@93.85.84.255:~#" -ForegroundColor Red
Start-Sleep 1

Type-Text "Launching deep system scan..." "Magenta"
Percent-Load "Extracting files..."

Write-Host ""
Write-Host "    DATA EXFILTRATION LOG    " -ForegroundColor DarkCyan

for ($i=1; $i -le 50; $i++) {
    Write-Host "[OK] /home/user/private_folder/file_$i.dat" -ForegroundColor Yellow
    Start-Sleep -Milliseconds 80
}

Write-Host "[OK] /etc/shadow"
Write-Host "[OK] /root/credentials.db"
Write-Host "[OK] /var/backups/full_system.img"
Start-Sleep 2

$secondWindowScript = {
    $host.UI.RawUI.WindowTitle='ENCRYPTING DATA STREAM';
    $timer=[Diagnostics.Stopwatch]::StartNew();
    while($timer.Elapsed.TotalSeconds -lt 2){
        Write-Host (Get-Random -Minimum 100000 -Maximum 999999) -ForegroundColor Green;
        Start-Sleep -Milliseconds 5;
    }
}

Start-Process powershell -ArgumentList ("-Command & { & $($secondWindowScript) }")
Start-Sleep 1.5

cls
Type-Text "!!! CRITICAL SECURITY FAILURE !!!" "Red" 40
Start-Sleep 1
Type-Text "Firewall bypassed." "Red"
Start-Sleep 1
Type-Text "Remote backup completed." "Red"
Start-Sleep 1
Type-Text "System lockdown initiated..." "DarkRed" 60
Start-Sleep 3

cls

Type-Text "Relax 😄" "Cyan" 60
Start-Sleep 1
Type-Text "Nothing was hacked." "Green"
Start-Sleep 1
Type-Text "No data was touched." "Green"
Start-Sleep 1
Type-Text "This was just an overdramatic birthday surprise." "Magenta"
Start-Sleep 1

Write-Host ""

$heart = @"
   ***     ***
  *****   *****
 ***************
 ***************
  *************
    *********
      *****
        *
"@

Write-Host $heart -ForegroundColor Red
Start-Sleep 1

Type-Text "HAPPY BIRTHDAY ❤️" "Yellow" 80
Start-Sleep 1
Type-Text "Your files are safe. Your nerves are not 😄" "Cyan"
