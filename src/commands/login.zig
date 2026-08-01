const std = @import("std");
const terminal = @import("../utils/terminal.zig");
const auth = @import("../api/auth.zig");
const accounts = @import("../storage/accounts.zig");

pub fn execute(allocator: std.mem.Allocator) !void {
    try terminal.baslik("Giriş Yap");

    const kullanici_adi = try terminal.girdiAl(
        allocator,
        "Kullanıcı adı: ",
    );
    defer allocator.free(kullanici_adi);

    const sifre = try terminal.gizliGirdiAl(
        allocator,
        "Şifre: ",
    );
    defer allocator.free(sifre);

    var auth_client = auth.AuthClient.init(allocator);

    const sonuc = try auth_client.login(.{
        .username = kullanici_adi,
        .password = sifre,
    });

    if (!sonuc.success) {
        try terminal.hata(sonuc.message);
        return;
    }

    var manager = accounts.AccountManager.init(allocator);
    defer manager.deinit();

    try manager.yukle();

    try manager.ekle(
        kullanici_adi,
        sonuc.access_token,
        sonuc.refresh_token,
    );

    _ = manager.aktifYap(kullanici_adi);

    try manager.kaydet();

    try terminal.basari("Giriş başarılı.");
    try terminal.bilgi("Gettic'i başlatmak için 'gettic start' yazın.");
}
