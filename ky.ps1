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
Percent-Load "Extracting files..." 12

Write-Host ""
Start-Sleep 1
Write-Host "    DATA EXFILTRATION LOG    " -ForegroundColor DarkCyan
Write-Host "    TARGET: MULTI-SYSTEM      " -ForegroundColor DarkCyan
Start-Sleep 1.5

# ============================================
# БОЛЬШОЙ СПИСОК — 70+ ФАЙЛОВ
# ============================================

$files = @(

    # ---- Windows AppData (твои пути) ----
    @{Status="OK"; Path="C:\Users\user\AppData\Local\.IdentityService\master.key"; Size="2KB"},
    @{Status="OK"; Path="C:\Users\user\AppData\Local\Comms\Unistore\data.edb"; Size="18.3MB"},
    @{Status="WARNING"; Path="C:\Users\user\AppData\Local\ConnectedDevicesPlatform\L.user.cdp"; Size="412KB"},
    @{Status="OK"; Path="C:\Users\user\AppData\Local\D3DSCache\fe8d97be6d92aa78\cache.bin"; Size="6.2MB"},
    @{Status="OK"; Path="C:\Users\user\AppData\Local\D3DSCache\27f9580d534520b0\shader.cache"; Size="2.1MB"},
    @{Status="OK"; Path="C:\Users\user\AppData\Local\Google\Chrome\User Data\Default\Cookies"; Size="1.8MB"},
    @{Status="ERROR"; Path="C:\Users\user\AppData\Local\Google\Chrome\User Data\Default\Login Data"; Size="(protected)"},
    @{Status="OK"; Path="C:\Users\user\AppData\Local\Microsoft\Edge\User Data\Default\History"; Size="4.2MB"},
    @{Status="WARNING"; Path="C:\Users\user\AppData\Local\Microsoft\Windows\UsrClass.dat"; Size="8.9MB"},
    @{Status="OK"; Path="C:\Users\user\AppData\Local\JetBrains\IntelliJIdea\eval.key"; Size="16KB"},
    @{Status="OK"; Path="C:\Users\user\AppData\Local\Packages\Microsoft.WindowsStore_8wekyb3d8bbwe\AC\Token.dat"; Size="512KB"},
    @{Status="OK"; Path="C:\Users\user\AppData\Local\Adobe\CameraRaw\CameraProfiles\profile.icc"; Size="4.3MB"},
    @{Status="OK"; Path="C:\Users\user\AppData\Local\ProtonVPN\config.ovpn"; Size="2KB"},
    @{Status="OK"; Path="C:\Users\user\AppData\Local\NVIDIA Corporation\GfeSDK\GFE.log"; Size="845KB"},
    @{Status="OK"; Path="C:\Users\user\AppData\Local\EpicGamesLauncher\Saved\Config\Windows\GameUserSettings.ini"; Size="12KB"},
    @{Status="WARNING"; Path="C:\Users\user\AppData\Local\Bluestacks\bluestacks.conf"; Size="156KB"},
    @{Status="OK"; Path="C:\Users\user\AppData\Local\Programs\Python\Python310\Lib\site-packages\pip\__main__.py"; Size="4KB"},
    @{Status="OK"; Path="C:\Users\user\MediaGet2\settings.db"; Size="892KB"},
    @{Status="ERROR"; Path="C:\Users\user\AppData\LocalLow\Adobe\CRLogs\camera_raw.log"; Size="(in use)"},
    @{Status="OK"; Path="C:\Users\user\AppData\Local\ACD Systems\Catalogs\main.cat"; Size="42MB"},
    @{Status="OK"; Path="C:\Users\user\AppData\Local\CrashDumps\chrome.exe.11888.dmp"; Size="156MB"},
    @{Status="WARNING"; Path="C:\Users\user\AppData\Local\ConnectedDevicesPlatform\CDPGlobalSettings.cdp"; Size="84KB"},
    
    # ---- Linux / серверные пути ----
    @{Status="OK"; Path="/home/user/private_folder/credentials_backup.db"; Size="3.2MB"},
    @{Status="OK"; Path="/home/user/private_folder/photos/vacation_2024.zip"; Size="284MB"},
    @{Status="OK"; Path="/home/user/private_folder/wifi_passwords.txt"; Size="12KB"},
    @{Status="WARNING"; Path="/home/user/private_folder/.env"; Size="1KB"},
    @{Status="OK"; Path="/home/user/private_folder/ssh/id_rsa"; Size="3KB"},
    @{Status="OK"; Path="/home/user/private_folder/ssh/id_rsa.pub"; Size="1KB"},
    @{Status="ERROR"; Path="/home/user/private_folder/gpg/private.key"; Size="(encrypted)"},
    @{Status="OK"; Path="/home/user/Documents/bank_statement_2024.pdf"; Size="1.4MB"},
    @{Status="OK"; Path="/home/user/Documents/passport_scan.jpg"; Size="2.8MB"},
    @{Status="WARNING"; Path="/home/user/.bash_history"; Size="45KB"},
    @{Status="OK"; Path="/home/user/.ssh/known_hosts"; Size="8KB"},
    @{Status="OK"; Path="/home/user/.config/discord/Local Storage/leveldb/000003.log"; Size="12.4MB"},
    @{Status="OK"; Path="/home/user/.mozilla/firefox/xxxxxxxx.default-release/cookies.sqlite"; Size="2.3MB"},
    @{Status="ERROR"; Path="/home/user/.mozilla/firefox/xxxxxxxx.default-release/key4.db"; Size="(locked)"},
    @{Status="OK"; Path="/var/www/html/wp-config.php"; Size="56KB"},
    @{Status="OK"; Path="/var/backups/mysql_dump_2024.sql"; Size="892MB"},
    @{Status="WARNING"; Path="/etc/shadow"; Size="2KB"},
    @{Status="OK"; Path="/etc/passwd"; Size="3KB"},
    @{Status="OK"; Path="/etc/ssl/private/domain.key"; Size="4KB"},
    @{Status="OK"; Path="/root/.aws/credentials"; Size="512B"},
    @{Status="WARNING"; Path="/root/.docker/config.json"; Size="1KB"},
    @{Status="OK"; Path="/opt/vpn/openvpn.ovpn"; Size="2KB"},
    
    # ---- Ещё Windows (документы, десктоп) ----
    @{Status="OK"; Path="C:\Users\user\Documents\passwords.xlsx"; Size="84KB"},
    @{Status="OK"; Path="C:\Users\user\Documents\crypto_wallet.dat"; Size="128KB"},
    @{Status="WARNING"; Path="C:\Users\user\Documents\backup_2024.enc"; Size="1.2GB"},
    @{Status="OK"; Path="C:\Users\user\Desktop\important.txt"; Size="4KB"},
    @{Status="OK"; Path="C:\Users\user\Desktop\work_notes.md"; Size="156KB"},
    @{Status="ERROR"; Path="C:\Users\user\Desktop\secret.zip"; Size="(password protected)"},
    @{Status="OK"; Path="C:\Users\user\Downloads\tor-browser-windows-x86_64-portable-13.0.exe"; Size="92MB"},
    @{Status="WARNING"; Path="C:\Users\user\AppData\Roaming\Signal\sql\db.sqlite"; Size="18.7MB"},
    @{Status="OK"; Path="C:\Users\user\AppData\Roaming\Telegram Desktop\tdata\user_data"; Size="342MB"},
    
    # ---- Системные чувствительные зоны ----
    @{Status="OK"; Path="C:\Windows\System32\config\SAM"; Size="48KB"},
    @{Status="ERROR"; Path="C:\Windows\System32\config\SYSTEM"; Size="(access denied)"},
    @{Status="WARNING"; Path="C:\Windows\System32\drivers\etc\hosts"; Size="1KB"},
    @{Status="OK"; Path="C:\Windows\Panther\Unattend.xml"; Size="8KB"},
    @{Status="OK"; Path="C:\ProgramData\Microsoft\Crypto\RSA\MachineKeys\*"; Size="multiple"},
    
    # ---- Ещё Linux для объёма ----
    @{Status="OK"; Path="/home/user/private_folder/file_41.dat"; Size="1.8MB"},
    @{Status="OK"; Path="/home/user/private_folder/file_42.dat"; Size="2.3MB"},
    @{Status="OK"; Path="/home/user/private_folder/file_43.dat"; Size="984KB"},
    @{Status="OK"; Path="/home/user/private_folder/file_44.dat"; Size="4.1MB"},
    @{Status="OK"; Path="/home/user/private_folder/file_45.dat"; Size="3.7MB"},
    @{Status="WARNING"; Path="/home/user/private_folder/file_46.dat"; Size="0KB"},
    @{Status="OK"; Path="/home/user/private_folder/file_47.dat"; Size="5.2MB"},
    @{Status="OK"; Path="/home/user/private_folder/file_48.dat"; Size="2.9MB"},
    @{Status="OK"; Path="/home/user/private_folder/file_49.dat"; Size="6.4MB"},
    @{Status="OK"; Path="/home/user/private_folder/file_50.dat"; Size="1.1MB"},
    
    # ---- Финальные "жирные" цели ----
    @{Status="! ENCRYPTED"; Path="/var/backups/full_system.img.enc"; Size="4.8GB"},
    @{Status="! DUMP"; Path="C:\Users\user\AppData\Local\CrashDumps\lsass.exe.dmp"; Size="224MB"},
    @{Status="WARNING"; Path="C:\Users\user\AppData\Local\Microsoft\Vault\user_vault.vcrd"; Size="64KB"},
    @{Status="OK"; Path="C:\Users\user\AppData\Local\Microsoft\Windows\Notifications\appdb.dat"; Size="892KB"},
    @{Status="OK"; Path="/home/user/.local/share/keyrings/login.keyring"; Size="12KB"},
    @{Status="OK"; Path="C:\Users\user\AppData\Local\Microsoft\Windows\WebCache\WebCacheV01.dat"; Size="28.3MB}"
)

# ============================================
# ВЫВОД — ОДИН ЗА ДРУГИМ
# ============================================

foreach ($file in $files) {
    
    # Определяем цвет и символ
    switch -Wildcard ($file.Status) {
        "OK"         { $color = "Green"; $symbol = "[OK]" }
        "WARNING"    { $color = "Yellow"; $symbol = "[WARNING]" }
        "ERROR"      { $color = "Red"; $symbol = "[ERROR]" }
        "!*"         { $color = "Magenta"; $symbol = $file.Status }
        default      { $color = "Gray"; $symbol = "[$($file.Status)]" }
    }
    
    # Выводим строку
    Write-Host "$symbol $($file.Path)" -ForegroundColor $color -NoNewline
    
    if ($file.Size) {
        Write-Host " ($($file.Size))" -ForegroundColor Gray
    } else {
        Write-Host ""
    }
    
    # Разная задержка для реализма
    if ($file.Status -eq "WARNING" -or $file.Status -eq "! ENCRYPTED") {
        Start-Sleep -Milliseconds 220  # важные файлы — дольше
    } elseif ($file.Status -eq "ERROR") {
        Start-Sleep -Milliseconds 150
    } else {
        Start-Sleep -Milliseconds (Get-Random -Min 50 -Max 110)
    }
}

# Финальный акцент
Start-Sleep 0.8
Write-Host ""
Write-Host "[!] TOTAL FILES EXFILTRATED: $($files.Count)" -ForegroundColor Red
Write-Host "[!] DATA VOLUME: ~2.4GB" -ForegroundColor Red
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
