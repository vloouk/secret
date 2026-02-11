cls
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$host.UI.RawUI.WindowTitle = "SECURE REMOTE TERMINAL"

function Type-Text($text, $color="White", $delay=15) {
    foreach ($char in $text.ToCharArray()) {
        Write-Host -NoNewline $char -ForegroundColor $color
        Start-Sleep -Milliseconds $delay
    }
    Write-Host ""
}

function Percent-Load($text, $speed=10) {
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
Type-Text "[+] Port 22 OPEN" "Green"
Type-Text "[+] Establishing SSH session..." "Cyan"
Percent-Load "Encrypting channel..."

Type-Text "[+] Login: root" "Yellow"
Type-Text "[+] Access granted" "Green"

Write-Host ""
Write-Host "root@91.204.187.73:~#" -ForegroundColor Red
Start-Sleep -Milliseconds 500

# =========================
# PHASE 2 — DATA EXFILTRATION
# =========================

Type-Text "Launching deep system scan..." "Magenta"
Percent-Load "Extracting files..."

Write-Host ""
Write-Host "=== DATA EXFILTRATION LOG ===" -ForegroundColor DarkCyan

for ($i=1; $i -le 25; $i++) {
    Write-Host "[OK] C:\Users\user\Documents\private_file_$i.docx" -ForegroundColor Yellow
    Start-Sleep -Milliseconds 40
}

Write-Host "[OK] C:\Windows\System32\config\SAM"
Write-Host "[OK] C:\Users\user\Passwords.txt"
Write-Host "[OK] C:\Users\user\Desktop\Secrets.xlsx"

# =========================
# PHASE 3 — SECOND WINDOW (асинхронно)
# =========================

$secondWindowScript = {
    $host.UI.RawUI.WindowTitle='ENCRYPTING DATA STREAM';
    $timer=[Diagnostics.Stopwatch]::StartNew();
    while($timer.Elapsed.TotalSeconds -lt 2){
        Write-Host (Get-Random -Minimum 100000 -Maximum 999999) -ForegroundColor Green;
        Start-Sleep -Milliseconds 5;
    }
}

# Асинхронный запуск второго окна, оно не блокирует основной поток
Start-Process powershell -ArgumentList ("-Command & { & $($secondWindowScript) }")

# =========================
# PHASE 4 — PANIC SCREEN
# =========================

cls
Type-Text "!!! CRITICAL SECURITY FAILURE !!!" "Red" 25
Type-Text "Firewall bypassed." "Red"
Type-Text "Remote backup completed." "Red"
Type-Text "System lockdown initiated..." "DarkRed" 40

Start-Sleep 2
cls

# =========================
# DRAMATIC TWIST
# =========================

Type-Text "Relax 😄" "Cyan" 40
Type-Text "Nothing was hacked." "Green"
Type-Text "No data was touched." "Green"
Type-Text "This was just an overdramatic console surprise." "Magenta"

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

Type-Text "YOU ARE AWESOME ❤️" "Yellow" 60
Type-Text "And this was your dramatic console surprise 😄" "Cyan"
