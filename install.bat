echo off

echo 1 * Installing package manager: chocolatey

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

echo 2 * Installing editors: Visual Studio Code, Sublime Text 3

@cinst -y VisualStudioCode sublimetext3 --limitedoutput

echo 3 * Installing extras: cmder, git, node

@cinst -y cmder git nodejs --limitoutput

echo 4 * Install Angular CLI (may take a while)

call npm install -g "@angular/cli" --silent

echo 5 * Checking out demo project from source control

mkdir Project

@git clone "https://github.com/danbyrne84/dominion-game.git" Project

echo 6 Launching VS Code with demo project

code .\Project

echo Done
