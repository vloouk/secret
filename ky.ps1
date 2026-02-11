cls
# UTF-8 for correct ASCII output
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$host.UI.RawUI.WindowTitle = "SYSTEM ACCESS"

function Type-Text($text, $color="White", $delay=40) {
    foreach ($char in $text.ToCharArray()) {
        Write-Host -NoNewline $char -ForegroundColor $color
        Start-Sleep -Milliseconds $delay
    }
    Write-Host ""
}

function Text-Bar($activity, $msDelay=40) {
    for ($i=1; $i -le 100; $i++) {
        $bar = "#" * ($i / 2) + "-" * (50 - ($i / 2))
        Write-Host "`r$activity [$bar] $i%" -NoNewline
        Start-Sleep -Milliseconds $msDelay
    }
    Write-Host ""
}

# Fake connection
Type-Text "Connecting to the system..." "Green"
Start-Sleep 1
Text-Bar "Establishing secure connection"

Type-Text "Access granted." "Red"
Start-Sleep 1

Type-Text "Retrieving user data..." "Yellow"
Start-Sleep 1
Text-Bar "Transferring data" 30

cls

# Big twist 😄
Type-Text "⚠ WARNING ⚠" "Red" 60
Start-Sleep 1
Type-Text "This was a test of your trust..." "Magenta"
Start-Sleep 1
Type-Text "Just kidding 😄" "Cyan"
Start-Sleep 1
Write-Host ""

# Heart
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

Type-Text "Actually, this message is for YOU ❤️" "Magenta" 60
Start-Sleep 1
Type-Text "HAPPY BIRTHDAY!" "Yellow" 80
Start-Sleep 1
Type-Text "Wishing you joy, warmth, and lots of smiles 😊" "Cyan" 40
