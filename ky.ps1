cls
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$host.UI.RawUI.WindowTitle = "SECURE DATA CHANNEL"

function Type-Text($text, $color="White", $delay=30) {
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

# Phase 1
Type-Text "Initializing remote access..." "Green"
Start-Sleep 1
Percent-Load "Decrypting system credentials..."

Start-Sleep 1
Type-Text "Access granted." "Red"
Start-Sleep 1

# Phase 2
Type-Text "Starting file extraction..." "Yellow"
Start-Sleep 1
Percent-Load "Uploading data packets..."

Start-Sleep 1
Write-Host ""
Write-Host "=== FILE TRANSFER LOG ===" -ForegroundColor Cyan
Start-Sleep 1

# Fake file list (ничего реального не читаем!)
$files = @(
"C:\Users\user\Documents\private_notes.txt",
"C:\Users\user\Pictures\secret_photo.jpg",
"C:\Users\user\Desktop\passwords.docx",
"C:\Users\user\Downloads\bank_statement.pdf",
"C:\Users\user\AppData\Local\hidden_data.db",
"C:\Users\user\Videos\personal_video.mp4"
)

foreach ($file in $files) {
    Write-Host "Transferring: $file" -ForegroundColor Yellow
    Start-Sleep -Milliseconds 500
}

Start-Sleep 2
cls

# Dramatic twist
Type-Text "⚠ CRITICAL WARNING ⚠" "Red" 60
Start-Sleep 1
Type-Text "All your data has been successfully copied." "Red"
Start-Sleep 2

Write-Host ""
Type-Text "..." "White" 300
Start-Sleep 1

Type-Text "Relax 😄" "Cyan" 60
Start-Sleep 1
Type-Text "This was just a harmless birthday surprise." "Magenta" 50
Start-Sleep 1
Write-Host ""

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

Type-Text "HAPPY BIRTHDAY ❤️" "Yellow" 80
Start-Sleep 1
Type-Text "Wishing you happiness, laughter and zero real data leaks 😄" "Cyan" 40
