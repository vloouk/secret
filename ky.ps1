cls
# Устанавливаем кодировку UTF-8 для корректного отображения кириллицы и смайликов
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$host.UI.RawUI.WindowTitle = "SYSTEM ACCESS"

function Type-Text($text, $color="White", $delay=40) {
    foreach ($char in $text.ToCharArray()) {
        Write-Host -NoNewline $char -ForegroundColor $color
        Start-Sleep -Milliseconds $delay
    }
    Write-Host ""
}

# Фейковое подключение
Type-Text "Подключение к системе..." "Green"
Start-Sleep 1

for ($i=1; $i -le 100; $i++) {
    Write-Progress -Activity "Установка соединения" -Status "$i% завершено" -PercentComplete $i
    Start-Sleep -Milliseconds 40
}

Start-Sleep 1
cls

Type-Text "Доступ получен." "Red"
Start-Sleep 1

Type-Text "Перехват данных пользователя..." "Yellow"
Start-Sleep 1

for ($i=1; $i -le 100; $i++) {
    Write-Progress -Activity "Передача данных" -Status "$i% завершено" -PercentComplete $i
    Start-Sleep -Milliseconds 30
}

Start-Sleep 1
cls

# Резкий поворот 😄
Type-Text "⚠ ВНИМАНИЕ ⚠" "Red" 60
Start-Sleep 1
Type-Text "Это была проверка на доверчивость..." "Magenta"
Start-Sleep 1
Type-Text "Шучу-шучу 😄" "Cyan"
Start-Sleep 1
Write-Host ""

# Сердце
$heart = @"
  ***     ***
 *****   *****
*****************
 ***************
  *************
    *********
      *****
        *
"@

Write-Host $heart -ForegroundColor Red
Start-Sleep 1

Type-Text "На самом деле это сообщение для тебя ❤️" "Magenta" 60
Start-Sleep 1
Type-Text "С Днём Рождения!" "Yellow" 80
Start-Sleep 1
Type-Text "Пусть в твоей жизни будет больше радости, тепла и улыбок 😊" "Cyan" 40
