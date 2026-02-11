cls
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$host.UI.RawUI.WindowTitle = "SECURE REMOTE TERMINAL"

# =========================
# Функции печати текста и прогресса
# =========================

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

Type-Text "[+] Target IP located: 93.85.84.255" "Yellow"   # IP цели найден
Start-Sleep 2
Type-Text "[+] Port 57 OPEN" "Green"                         # Порт открыт
Start-Sleep 2
Type-Text "Establishing SSH session...                                      [OK]" "Cyan"  # Устанавливаем SSH-сессию
Percent-Load "Encrypting channel...                                      [OK]"                # Шифруем канал

Type-Text "[+] Login: admin" "Yellow"                        # Логин admin
Start-Sleep 1
Type-Text "[+] Access granted" "Green"                      # Доступ предоставлен
Start-Sleep 2

Write-Host ""                                               # Пустая строка
Write-Host "admin@93.85.84.255:~#" -ForegroundColor Red    # Командная строка
Start-Sleep 1

# =========================
# PHASE 2 — DATA EXFILTRATION
# =========================

Type-Text "Launching deep system scan..." "Magenta"        # Запуск глубокого сканирования
Percent-Load "Extracting files..."                        # Извлекаем файлы

Write-Host ""
Write-Host "    DATA EXFILTRATION LOG    " -ForegroundColor DarkCyan  # Журнал утечки

for ($i=1; $i -le 50; $i++) {
    Write-Host "[OK] /home/user/private_folder/file_$i.dat" -ForegroundColor Yellow  # Файлы
    Start-Sleep -Milliseconds 80
}

Write-Host "[OK] /etc/shadow"                             # Системный файл
Write-Host "[OK] /root/credentials.db"                    # Файл с данными
Write-Host "[OK] /var/backups/full_system.img"            # Резервная копия
Start-Sleep 2                                             # Немного ждем перед вторым окном

# =========================
# PHASE 3 — SECOND WINDOW CHAOS (AUTO CLOSE)
# =========================

$secondWindowScript = {
    $host.UI.RawUI.WindowTitle='ENCRYPTING DATA STREAM';
    $timer=[Diagnostics.Stopwatch]::StartNew();
    while($timer.Elapsed.TotalSeconds -lt 2){               # Второе окно видно 2 секунды
        Write-Host (Get-Random -Minimum 100000 -Maximum 999999) -ForegroundColor Green;
        Start-Sleep -Milliseconds 5;
    }
}

# Асинхронный запуск второго окна, основной поток продолжает печатать
Start-Process powershell -ArgumentList ("-Command & { & $($secondWindowScript) }")

# Меньшая задержка после закрытия второго окна (чтобы текст продолжался быстрее)
Start-Sleep 1.5

# =========================
# PHASE 4 — PANIC SCREEN
# =========================

cls
Type-Text "!!! CRITICAL SECURITY FAILURE !!!" "Red" 40      # Критическая ошибка безопасности
Start-Sleep 1
Type-Text "Firewall bypassed." "Red"                        # Брандмауэр обойден
Start-Sleep 1
Type-Text "Remote backup completed." "Red"                 # Резервное копирование завершено
Start-Sleep 1
Type-Text "System lockdown initiated..." "DarkRed" 60      # Система заблокирована
Start-Sleep 3

cls

# =========================
# DRAMATIC TWIST 😄
# =========================

Type-Text "Relax 😄" "Cyan" 60                                # Расслабься
Start-Sleep 1
Type-Text "Nothing was hacked." "Green"                      # Ничего не взломано
Start-Sleep 1
Type-Text "No data was touched." "Green"                     # Данные не тронуты
Start-Sleep 1
Type-Text "This was just an overdramatic birthday surprise." "Magenta"  # Шутка-поздравление
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

Type-Text "HAPPY BIRTHDAY ❤️" "Yellow" 80                      # С Днём Рождения
Start-Sleep 1
Type-Text "Your files are safe. Your nerves are not 😄" "Cyan"  # Файлы в безопасности, нервы — нет
