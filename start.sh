#!/usr/bin/env sh

clear

echo "╔══════════════════════════════════════╗"
echo "║                                      ║"
echo "║          GETTIC TERMINAL             ║"
echo "║              STABLE                  ║"
echo "║                                      ║"
echo "╚══════════════════════════════════════╝"
echo

if ! command -v zig >/dev/null 2>&1; then
    echo "HATA"
    echo
    echo "Bilgisayarınızda Zig bulunamadı."
    echo
    echo "Lütfen önce Zig'i kurun."
    echo "https://ziglang.org/download/"
    exit 1
fi

echo "Zig bulundu."

echo
echo "Proje derleniyor..."
zig build

if [ $? -ne 0 ]; then
    echo
    echo "Derleme başarısız."
    exit 1
fi

echo
echo "Başlatılıyor..."
echo

./zig-out/bin/gettic
