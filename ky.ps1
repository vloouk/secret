cls
Start-Sleep 2.5
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

# PHASE 1 — CONNECTION
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

# PHASE 2 — DATA EXFILTRATION
Type-Text "Launching deep system scan..." "Magenta"
Percent-Load "Extracting files..."

Write-Host ""
Start-Sleep 1
Write-Host "    DATA EXFILTRATION LOG    " -ForegroundColor DarkCyan
Start-Sleep 1

for ($i=1; $i -le 50; $i++) {
    Write-Host "[OK] /home/user/private_folder/file_$i.dat" -ForegroundColor Yellow
    Start-Sleep -Milliseconds 80
}

Start-Sleep 1
Write-Host "[OK] /etc/shadow"
Start-Sleep 1
Write-Host "[OK] /root/credentials.db"
Start-Sleep 1
Write-Host "[OK] /var/backups/full_system.img"
Start-Sleep 1.5

# PHASE 3 — SECOND WINDOW CHAOS
$secondWindowScript = {
    $host.UI.RawUI.WindowTitle='ENCRYPTING DATA STREAM';
    $timer=[Diagnostics.Stopwatch]::StartNew();
    while($timer.Elapsed.TotalSeconds -lt 2){
        Write-Host (Get-Random -Minimum 100000 -Maximum 999999) -ForegroundColor Green;
        Start-Sleep -Milliseconds 5;
    }
}

Start-Process powershell -ArgumentList ("-NoProfile -WindowStyle Normal -Command & { & $($secondWindowScript) }")
Start-Sleep 1.5

# PHASE 4 — SYSTEM TRANSITION (ФУТУРИСТИЧНЫЙ ВАРИАНТ)
cls
Type-Text "System entering advanced diagnostic mode..." "Cyan" 35
Start-Sleep 1
Type-Text "Loading encrypted visualization module..." "Gray"
Percent-Load "Compiling interface..." 12

Start-Sleep 1
Type-Text "Module loaded successfully." "Green"
Start-Sleep 1
Type-Text "Opening BLACKICE console..." "Magenta" 40
Start-Sleep 2

# PHASE 5 — BLACKICE INTERFACE
$blackice = @"
 ██████╗ ██╗      █████╗  ██████╗██╗  ██╗██╗ ██████╗███████╗
 ██╔══██╗██║     ██╔══██╗██╔════╝██║ ██╔╝██║██╔════╝██╔════╝
 ██████╔╝██║     ███████║██║     █████╔╝ ██║██║     █████╗
 ██╔══██╗██║     ██╔══██║██║     ██╔═██╗ ██║██║     ██╔══╝
 ██████╔╝███████╗██║  ██║╚██████╗██║  ██╗██║╚██████╗███████╗
 ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
"@

Write-Host $blackice -ForegroundColor DarkMagenta
Start-Sleep 2

Type-Text "BLACKICE INTERFACE ACTIVE" "DarkCyan" 40
Start-Sleep 2
# =========================
# GEOLOCATION TRACE
# =========================

Start-Sleep 1
Write-Host "Tracing external device location..." -ForegroundColor DarkYellow
Start-Sleep 1.5

Write-Host "Signal triangulated." -ForegroundColor Yellow
Start-Sleep 1

for ($i=0; $i -le 100; $i++) {
    Write-Host "`rCalculating coordinates... $i%" -NoNewline -ForegroundColor Green
    Start-Sleep -Milliseconds 25
}
Write-Host ""
Start-Sleep 1.5

Write-Host "Coordinates identified:" -ForegroundColor Cyan
Start-Sleep 0.8
Write-Host "53.9006° N, 27.5590° E" -ForegroundColor White
Start-Sleep 2


# =========================
# CAMERA ACCESS ATTEMPT
# =========================

Write-Host ""
Write-Host "Peripheral device detected:" -ForegroundColor DarkYellow
Start-Sleep 1.2

Write-Host " - Camera Module [ID: CAM-XR21-8842]" -ForegroundColor Yellow
Start-Sleep 1

Write-Host "Establishing encrypted connection to device stream..." -ForegroundColor Cyan
Start-Sleep 2.5

Write-Host "Connection timeout." -ForegroundColor DarkGray
Start-Sleep 0.8
Write-Host "ERROR CODE: 0x887A0006" -ForegroundColor Gray
Start-Sleep 2


# =========================
# PASSWORD RECONSTRUCTION (НОВАЯ ВЕРСИЯ)
# =========================

Write-Host ""
Type-Text "Encrypted credential hash located." "DarkYellow"
Start-Sleep 1
Type-Text "Initializing adaptive brute-force engine..." "Magenta"
Start-Sleep 1

Write-Host ""
Write-Host "Reconstructing password:" -ForegroundColor Gray
Start-Sleep 1

$password = ""
$targetPassword = "7K9A2X"  # крутой псевдо-пароль

foreach ($char in $targetPassword.ToCharArray()) {

    for ($i=1; $i -le 5; $i++) {
        $randomChar = Get-Random -InputObject @("A","B","C","X","3","7","9","K","2")
        Write-Host "`rReconstructing password: $password$randomChar" -NoNewline -ForegroundColor Yellow
        Start-Sleep -Milliseconds 120
    }

    $password += $char
    Write-Host "`rReconstructing password: $password" -NoNewline -ForegroundColor Green
    Start-Sleep -Milliseconds 350
}

Write-Host ""
Start-Sleep 1
Type-Text "Password signature reconstructed successfully." "Green"
Start-Sleep 2

# PHASE 6 — SECOND MINI DATA LEAK
Type-Text "Running extended diagnostics..." "Magenta"
Percent-Load "Scanning system layers..." 10

Write-Host ""
Write-Host "=== SECONDARY DATA LOG ===" -ForegroundColor DarkCyan

for ($i=1; $i -le 15; $i++) {
    Write-Host "[OK] /home/user/private_folder/file_$i.tmp" -ForegroundColor Yellow
    Start-Sleep -Milliseconds 100
}

Write-Host "[OK] /var/log/system.log"
Write-Host "[OK] /etc/passwd"
Start-Sleep 2

# DRAMATIC TWIST 😄
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
