@echo off
rem Nhay dup de day ban moi nhat cua portfolio len GitHub.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0cap-nhat-github.ps1" %*
pause
