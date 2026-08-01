@echo off
title GETTIC TERMINAL
cls

echo ╔══════════════════════════════════════╗
echo ║                                      ║
echo ║          GETTIC TERMINAL             ║
echo ║              STABLE                  ║
echo ║                                      ║
echo ╚══════════════════════════════════════╝
echo.

where zig >nul 2>nul

if errorlevel 1 (
    echo HATA
    echo.
    echo Bilgisayarınızda Zig bulunamadı.
    echo.
    echo Lütfen önce Zig`i kurun.
    echo https://ziglang.org/download/
    pause
    exit /b
)

echo Zig bulundu.
echo.
echo Proje derleniyor...

zig build

if errorlevel 1 (
    echo.
    echo Derleme başarısız.
    pause
    exit /b
)

echo.
echo Başlatılıyor...
echo.

zig-out\bin\gettic.exe
