const std = @import("std");
const constants = @import("../constants.zig");

pub fn execute() !void {
    const out = std.io.getStdOut().writer();

    try out.print(
        \\=========================================================
        \\                {s} Terminal
        \\                Sürüm : {s}
        \\=========================================================
        \\
        \\Kullanım:
        \\  gettic <komut> [seçenek]
        \\
        \\Temel Komutlar
        \\---------------------------------------------------------
        \\  help                     Yardım ekranını gösterir
        \\  signup                   Yeni hesap oluşturur
        \\  login                    Hesaba giriş yapar
        \\  logout                   Oturumu kapatır
        \\  start                    Gettic Terminal'i başlatır
        \\  exit                     Uygulamadan çıkar
        \\
        \\Sohbet
        \\---------------------------------------------------------
        \\  chat @kullanıcı          Kullanıcı ile sohbet açar
        \\  friends list             Arkadaş listesini gösterir
        \\  friends add @kullanıcı   Arkadaşlık isteği gönderir
        \\  friends delete @kullanıcı
        \\                           Arkadaşı siler
        \\  friend requests          Gelen istekleri gösterir
        \\
        \\Hesap
        \\---------------------------------------------------------
        \\  profile                  Profili gösterir
        \\  settings                 Ayarlar
        \\  account delete           Hesabı siler
        \\  block @kullanıcı         Kullanıcıyı engeller
        \\
        \\Sistem
        \\---------------------------------------------------------
        \\  memory                   Bellek kullanımını gösterir
        \\  memory reset             Tüm yerel verileri siler
        \\  devices                  Giriş yapılan cihazlar
        \\  sessions                 Aktif oturumlar
        \\  ping                     Sunucu gecikmesini ölçer
        \\  diagnostics              Sistem tanılama
        \\  update                   Güncelleme kontrolü
        \\  info                     Gettic bilgileri
        \\
        \\GitHub:
        \\  {s}
        \\
        \\=========================================================
        \\
    ,
        .{
            constants.APP_NAME,
            constants.APP_VERSION,
            constants.GITHUB,
        },
    );
}
