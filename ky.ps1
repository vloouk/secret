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
Type-Text "[+] Port 57/4/31 OPEN" "Green"
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

# PHASE 2 — DATA EXFILTRATION (ПРОСТО КАК ТЫ ПРОСИЛ)
Type-Text "Launching deep system scan..." "Magenta"
Percent-Load "Extracting files..." 12

Write-Host ""
Start-Sleep 1
Write-Host "    DATA EXFILTRATION LOG    " -ForegroundColor DarkCyan
Start-Sleep 1

# ============================================
# ТУПО СПИСОК СТРОК
# ============================================

Write-Host "[OK] C:\Users\user\AppData\Local\.IdentityService\master" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Local\Comms\Unis\data.edb" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[WARNING] C:\Users\user\AppData\Local\ConnectedDevicesPlatform\L.user.cdp" -ForegroundColor Yellow
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Local\D3DSCache\fe8d97be6d92aa78\cache.bin" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Local\D3DSCache\27f9580d534520b0\shader.cache" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Local\Google\Chrome\User Data\Default\Cookies" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[ERROR] C:\Users\user\AppData\Local\Google\Chrome\User Data\Default\Login Data (protected)" -ForegroundColor Red
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Local\Microsoft\Edge\User Data\Default\History" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[WARNING] C:\Users\user\AppData\Local\Microsoft\Windows\UsrClass.dat" -ForegroundColor Yellow
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Local\JetBrains\IntelliJIdea\eval.key" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Local\Packages\Microsoft.WindowsStore_8wekyb3d8bbwe\AC\Token.dat" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Local\Adobe\CameraRaw\CameraProfiles\profile.icc" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Local\ProtonVPN\config.ovpn" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Local\NVIDIA Corporation\GfeSDK\GFE.log" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\GameUserSettings.ini" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[WARNING] C:\Users\user\AppData\Local\Bluestacks\bluestacks.conf" -ForegroundColor Yellow
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Local\Programs\Python\Python310\Lib\site-packages\pip\__main__.py" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\MediaGet2\settings.db" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[ERROR] C:\Users\user\AppData\LocalLow\Adobe\CRLogs\camera_raw.log (in use)" -ForegroundColor Red
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Local\ACD Systems\Catalogs\main.cat" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Local\CrashDumps\chrome.exe.11888.dmp" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[WARNING] C:\Users\user\AppData\Local\ConnectedDevicesPlatform\CDPGlobalSettings.cdp" -ForegroundColor Yellow
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/private_folder/credentials_backup.db" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/private_folder/photos/vacation_2024.zip" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/private_folder/wifi_passwords.txt" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[WARNING] /home/user/private_folder/.env" -ForegroundColor Yellow
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/private_folder/ssh/id_rsa" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/private_folder/ssh/id_rsa.pub" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[ERROR] /home/user/private_folder/gpg/private.key (encrypted)" -ForegroundColor Red
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/Documents/bank_statement_2024.pdf" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/Documents/passport_scan.jpg" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[WARNING] /home/user/.bash_history" -ForegroundColor Yellow
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/.ssh/known_hosts" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/.config/discord/Local Storage/leveldb/000003.log" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/.mozilla/firefox/xxxxxxxx.default-release/cookies.sqlite" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[ERROR] /home/user/.mozilla/firefox/xxxxxxxx.default-release/key4.db (locked)" -ForegroundColor Red
Start-Sleep -Milliseconds 80
Write-Host "[OK] /var/www/html/wp-config.php" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /var/backups/mysql_dump_2024.sql" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[WARNING] /etc/shadow" -ForegroundColor Yellow
Start-Sleep -Milliseconds 80
Write-Host "[OK] /etc/passwd" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /etc/ssl/private/domain.key" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /root/.aws/credentials" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[WARNING] /root/.docker/config.json" -ForegroundColor Yellow
Start-Sleep -Milliseconds 80
Write-Host "[OK] /opt/vpn/openvpn.ovpn" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\Documents\passwords.xlsx" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\Documents\crypto_wallet.dat" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[WARNING] C:\Users\user\Documents\backup_2024.enc" -ForegroundColor Yellow
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\Desktop\important.txt" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\Desktop\work_notes.md" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[ERROR] C:\Users\user\Desktop\secret.zip (password protected)" -ForegroundColor Red
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\Downloads\tor-browser-windows-x86_64-portable-13.0.exe" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[WARNING] C:\Users\user\AppData\Roaming\Signal\sql\db.sqlite" -ForegroundColor Yellow
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Roaming\Telegram Desktop\tdata\user_data" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Windows\System32\config\SAM" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[ERROR] C:\Windows\System32\config\SYSTEM (access denied)" -ForegroundColor Red
Start-Sleep -Milliseconds 80
Write-Host "[WARNING] C:\Windows\System32\drivers\etc\hosts" -ForegroundColor Yellow
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Windows\Panther\Unattend.xml" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/private_folder/file_41.dat" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/private_folder/file_42.dat" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/private_folder/file_43.dat" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/private_folder/file_44.dat" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/private_folder/file_45.dat" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[WARNING] /home/user/private_folder/file_46.dat (0KB)" -ForegroundColor Yellow
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/private_folder/file_47.dat" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/private_folder/file_48.dat" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/private_folder/file_49.dat" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/private_folder/file_50.dat" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[! ENCRYPTED] /var/backups/full_system.img.enc" -ForegroundColor Magenta
Start-Sleep -Milliseconds 80
Write-Host "[! DUMP] C:\Users\user\AppData\Local\CrashDumps\lsass.exe.dmp" -ForegroundColor Magenta
Start-Sleep -Milliseconds 80
Write-Host "[WARNING] C:\Users\user\AppData\Local\Microsoft\Vault\user_vault.vcrd" -ForegroundColor Yellow
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Local\Microsoft\Windows\Notifications\appdb.dat" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] /home/user/.local/share/keyrings/login.keyring" -ForegroundColor Green
Start-Sleep -Milliseconds 80
Write-Host "[OK] C:\Users\user\AppData\Local\Microsoft\Windows\WebCache\WebCacheV01.dat" -ForegroundColor Green
Start-Sleep -Milliseconds 80

Write-Host ""
Write-Host "[!] TOTAL FILES EXFILTRATED: 72" -ForegroundColor Red
Start-Sleep 1.5

Start-Sleep 1
Write-Host "[OK] /ets/shadow"
Start-Sleep 1
Write-Host "[OK] /roote/credentials.db"
Start-Sleep 1
Write-Host "[OK] /var/backup/full_system.img"
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
Start-Sleep 1

# =====================================
# ВИНТАЖНЫЙ ПОЛЗУНОК КАК В WINDOWS 95
# =====================================
Write-Host ""
Write-Host "Loading BLACKICE modules:" -ForegroundColor Gray
Start-Sleep 0.5

# Ползунок 1 — Kernel
Write-Host -NoNewline "[KERNEL] " -ForegroundColor Cyan
for ($i=1; $i -le 20; $i++) {
    Write-Host -NoNewline "█" -ForegroundColor DarkCyan
    Start-Sleep -Milliseconds 40
}
Write-Host " 100%" -ForegroundColor Green
Start-Sleep 0.3

# Ползунок 2 — Protocol
Write-Host -NoNewline "[PROTOCOL] " -ForegroundColor Cyan
for ($i=1; $i -le 20; $i++) {
    Write-Host -NoNewline "█" -ForegroundColor DarkCyan
    Start-Sleep -Milliseconds 30
}
Write-Host " 100%" -ForegroundColor Green
Start-Sleep 0.3

# Ползунок 3 — Encryption (с глюком)
Write-Host -NoNewline "[ENCRYPT] " -ForegroundColor Cyan
for ($i=1; $i -le 15; $i++) {
    Write-Host -NoNewline "█" -ForegroundColor DarkCyan
    Start-Sleep -Milliseconds 35
}
Write-Host -NoNewline "▒▒▒▒▒" -ForegroundColor Yellow
Start-Sleep 0.5
Write-Host " 75%" -ForegroundColor Yellow
Start-Sleep 0.5
Write-Host "`r[ENCRYPT] ████████████████████ 100%" -ForegroundColor Green
Start-Sleep 0.4

# Ползунок 4 — BLACKICE Core
Write-Host -NoNewline "[BLACKICE] " -ForegroundColor Magenta
for ($i=1; $i -le 20; $i++) {
    Write-Host -NoNewline "█" -ForegroundColor DarkMagenta
    Start-Sleep -Milliseconds 50
}
Write-Host " 100%" -ForegroundColor Green
Start-Sleep 0.8

Write-Host ""
Write-Host "BLACKICE interface ready." -ForegroundColor Green
Start-Sleep 1.5
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
# DEVICE SCAN — HARDWARE DETECTION
# =========================

Write-Host ""
Write-Host "Scanning peripheral devices..." -ForegroundColor DarkYellow
Start-Sleep 1.5

# 1. Камера (ошибка как было)
Write-Host " - Camera Module [ID: CAM-XcY21-4563]" -ForegroundColor Yellow
Start-Sleep 0.8
Write-Host "Establishing encrypted connection..." -ForegroundColor Cyan
Start-Sleep 1.2
Write-Host "[!] Connection timeout. ERROR: 0x651A0658" -ForegroundColor Red
Start-Sleep 1.5

# 2. Принтер (ошибка)
Write-Host " - Printer: Canon CAPT USB Device" -ForegroundColor Yellow
Start-Sleep 0.8
Write-Host "   Sending PDL data stream..." -ForegroundColor Cyan
Start-Sleep 1
Write-Host "Driver error: 0xE0691619" -ForegroundColor Red
Start-Sleep 1.5

# 3. Клавиатура/мышь (УСПЕШНО!)
Write-Host " - 2.4G Keyboard Mouse (HID-2345F-3A901)" -ForegroundColor Green
Start-Sleep 0.8
Write-Host "Device authenticated" -ForegroundColor Green
Start-Sleep 0.5
Write-Host "Keystroke logging activated" -ForegroundColor DarkGreen
Start-Sleep 1.2
Write-Host "Mouse tracking initialized" -ForegroundColor DarkGreen
Start-Sleep 1.5

# 4. Telegram Device Discovery (НОВИНКА!)
Write-Host " - Scanning Telegram connected devices..." -ForegroundColor DarkYellow
Start-Sleep 1.5
Write-Host "Found 1 device linked to @UVVENA #*1475288910" -ForegroundColor Yellow
Start-Sleep 1.5
Write-Host "iPhone 16 Pro (White) [A3083-345288]" -ForegroundColor White
Start-Sleep 0.8
Write-Host "Attempting to bypass iCloud lock..." -ForegroundColor Cyan
Start-Sleep 1.8
Write-Host "Failed: iCloud Protection v4.0" -ForegroundColor Red
Start-Sleep 0.5
Write-Host "Lock activation lock enabled" -ForegroundColor Red
Start-Sleep 1.5

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

# PHASE 6 — SECONDARY DATA LOG (НЕ ФАЙЛЫ, А СОБЫТИЯ)
Type-Text "Running extended diagnostics..." "Magenta"
Percent-Load "Scanning system layers..." 10

Write-Host ""
Write-Host "=== SYSTEM EVENT LOG ===" -ForegroundColor DarkCyan
Start-Sleep 0.8

$events = @(
    "[EVENT] 4624 - Successful logon (admin@BLACKICE)" -ForegroundColor Green,
    "[EVENT] 4672 - Special privileges assigned to new logon" -ForegroundColor Yellow,
    "[EVENT] 4688 - Process created: powershell.exe -enc JGNtZ..." -ForegroundColor Gray,
    "[EVENT] 5156 - Windows Filtering Platform connection" -ForegroundColor Cyan,
    "[ALERT] 7045 - Service installed: BLACKICE Driver" -ForegroundColor Red,
    "[EVENT] 1102 - Audit log cleared" -ForegroundColor Yellow,
    "[EVENT] 4648 - Logon attempt using explicit credentials" -ForegroundColor Yellow,
    "[EVENT] 5379 - Credential Manager credentials read" -ForegroundColor Red,
    "[EVENT] 4698 - Scheduled task created: BlackiceUpdate" -ForegroundColor Cyan,
    "[EVENT] 20001 - BLACKICE tunnel established [93.85.84.255]" -ForegroundColor Green,
    "[ALERT] 24586 - LSASS memory access detected" -ForegroundColor Red,
    "[EVENT] 5038 - Code integrity determined image corruption" -ForegroundColor Magenta,
    "[EVENT] 6281 - Code Integrity determined invalid page hash" -ForegroundColor Yellow,
    "[EVENT] 16 - Windows is shutting down (simulated)" -ForegroundColor Gray,
    "[ALERT] 1001 - BugCheck: 0x0000001a (MEMORY_MANAGEMENT)" -ForegroundColor Red
)

foreach ($event in $events) {
    Write-Host $event[0] -ForegroundColor $event[1]
    Start-Sleep -Milliseconds (Get-Random -Min 90 -Max 180)
}

Start-Sleep 1.5

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
