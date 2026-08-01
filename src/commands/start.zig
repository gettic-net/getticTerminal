const std = @import("std");
const terminal = @import("../utils/terminal.zig");
const accounts = @import("../storage/accounts.zig");
const tui = @import("../tui/screen.zig");

pub fn execute(allocator: std.mem.Allocator) !void {
    var manager = accounts.AccountManager.init(allocator);
    defer manager.deinit();

    try manager.yukle();

    const aktif = manager.aktifHesap();

    if (aktif == null) {
        try terminal.hata("Henüz giriş yapılmamış.");
        try terminal.bilgi("Önce 'gettic login' komutunu kullanın.");
        return;
    }

    try terminal.temizle();

    try tui.baslat(
        allocator,
        aktif.?,
    );
}
