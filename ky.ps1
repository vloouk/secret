cls
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$host.UI.RawUI.WindowTitle = "SECURE REMOTE TERMINAL"

function Type-Text($text, $color="White", $delay=25) {
    foreach ($char in $text.ToCharArray()) {
        Write-Host -NoNewline $char -ForegroundColor $color
        Start-Sleep -Milliseconds $delay
    }
    Write-Host ""
}

function Percent-Load($text, $speed=20) {
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
Start-Sleep 500ms
Type-Text "[+] Port 22 OPEN" "Green"
Start-Sleep 500ms
Type-Text "[+] Establishing SSH session..." "Cyan"
Percent-Load "Encrypting channel..."

Type-Text "[+] Login: root" "Yellow"
Start-Sleep 500ms
Type-Text "[+] Access granted" "Green"
Start-Sleep 500ms

Write-Host ""
Write-Host "root@91.204.187.73:~#" -ForegroundColor Red
Start-Sleep 500ms

# =========================
# PHASE 2 — DATA EXFILTRATION
# =========================

Type-Text "Launching deep system scan..." "Magenta"
Percent-Load "Extracting files..."

Write-Host ""
Write-Host "=== DATA EXFILTRATION LOG ===" -ForegroundColor DarkCyan

for ($i=1; $i -le 25; $i++) {
    Write-Host "[OK] C:\Users\user\Documents\private_file_$i.docx" -ForegroundColor Yellow
    Start-Sleep 120ms
}

Write-Host "[OK] C:\Windows\System32\config\SAM"
Write-Host "[OK] C:\Users\user\Passwords.txt"
Write-Host "[OK] C:\Users\user\Desktop\Secrets.xlsx"
Start-Sleep 500ms

# =========================
# PHASE 3 — SECOND WINDOW (медленно)
# =========================

$secondWindowScript = {
    $host.UI.RawUI.WindowTitle='ENCRYPTING DATA STREAM';
    $timer=[Diagnostics.Stopwatch]::StartNew();
    while($timer.Elapsed.TotalSeconds -lt 2){
        Write-Host (Get-Random -Minimum 100000 -Maximum 999999) -ForegroundColor Green;
        Start-Sleep -Milliseconds 8;
    }
}

# Запуск второго окна, основной поток немного ждёт, чтобы эффект был виден
Start-Process powershell -ArgumentList ("-Command & { & $($secondWindowScript) }")
Start-Sleep 2

# =========================
# PHASE 4 — PANIC SCREEN
# =========================

cls
Type-Text "!!! CRITICAL SECURITY FAILURE !!!" "Red" 40
Start-Sleep 500ms
Type-Text "Firewall bypassed." "Red"
Start-Sleep 500ms
Type-Text "Remote backup completed." "Red"
Start-Sleep 500ms
Type-Text "System lockdown initiated..." "DarkRed" 40
Start-Sleep 1s

cls

# =========================
# DRAMATIC TWIST
# =========================

Type-Text "Relax 😄" "Cyan" 60
Start-Sleep 500ms
Type-Text "Nothing was hacked." "Green"
Start-Sleep 500ms
Type-Text "No data was touched." "Green"
Start-Sleep 500ms
Type-Text "This was just an overdramatic console surprise." "Magenta"
Start-Sleep 500ms

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
Start-Sleep 500ms

Type-Text "YOU ARE AWESOME ❤️" "Yellow" 80
Start-Sleep 500ms
Type-Text "And this was your dramatic console surprise 😄" "Cyan"
