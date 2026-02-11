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

# =========================
# PHASE 1 — CONNECTION
# =========================

Type-Text "[+] Target IP located: 91.204.187.73" "Yellow"
Start-Sleep 1
Type-Text "[+] Port 22 OPEN" "Green"
Start-Sleep 1
Type-Text "[+] Establishing SSH session..." "Cyan"
Percent-Load "Encrypting channel..."

Type-Text "[+] Login: root" "Yellow"
Start-Sleep 1
Type-Text "[+] Access granted" "Green"
Start-Sleep 1

Write-Host ""
Write-Host "root@91.204.187.73:~#" -ForegroundColor Red
Start-Sleep 1

# =========================
# PHASE 2 — DATA EXFILTRATION
# =========================

Type-Text "Launching deep system scan..." "Magenta"
Percent-Load "Extracting files..."

Write-Host ""
Write-Host "=== DATA EXFILTRATION LOG ===" -ForegroundColor DarkCyan

for ($i=1; $i -le 50; $i++) {
    Write-Host "[OK] /home/user/private_folder/file_$i.dat" -ForegroundColor Yellow
    Start-Sleep -Milliseconds 80
}

Write-Host "[OK] /etc/shadow"
Write-Host "[OK] /root/credentials.db"
Write-Host "[OK] /var/backups/full_system.img"
Start-Sleep 2

# =========================
# PHASE 3 — SECOND WINDOW CHAOS (AUTO CLOSE)
# =========================

Start-Process powershell -ArgumentList "-Command `"for(\$i=0;\$i -lt 800;\$i++){Write-Host (Get-Random -Minimum 100000 -Maximum 999999); Start-Sleep 2}`""

Start-Sleep 2

# =========================
# PHASE 4 — PANIC SCREEN
# =========================

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

# =========================
# DRAMATIC TWIST 😄
# =========================

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
