const std = @import("std");
const terminal = @import("../utils/terminal.zig");

pub fn execute() !void {
    try terminal.baslik("GETTIC KOMUTLARI");

    try komut("gettic signup", "Yeni hesap oluşturur.");
    try komut("gettic login", "Hesabınıza giriş yapar.");
    try komut("gettic login new", "Yeni bir hesap ekler.");
    try komut("gettic start", "Gettic Terminal'i başlatır.");
    try komut("gettic logout", "Çıkış yapar.");
    try komut("gettic whoami", "Aktif hesabı gösterir.");

    try terminal.bosSatir();

    try komut("gettic chat @kullanıcı", "Sohbet başlatır.");
    try komut("gettic friends list", "Arkadaş listesini gösterir.");
    try komut("gettic friend requests", "Arkadaşlık isteklerini gösterir.");

    try terminal.bosSatir();

    try komut("gettic profile", "Profil bilgilerini gösterir.");
    try komut("gettic settings", "Ayarları açar.");
    try komut("gettic memory", "Bellek kullanımını gösterir.");
    try komut("gettic devices", "Bağlı cihazları listeler.");

    try terminal.bosSatir();

    try komut("gettic update", "Gettic'i günceller.");
    try komut("gettic diagnostics", "Sistem kontrolü yapar.");
    try komut("gettic info", "Uygulama bilgilerini gösterir.");
    try komut("gettic exit", "Gettic'i kapatır.");
}

fn komut(ad: []const u8, aciklama: []const u8) !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("  {s:<35} {s}\n", .{ ad, aciklama });
}
