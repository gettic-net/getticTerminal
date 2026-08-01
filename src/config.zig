const std = @import("std");
const constants = @import("../constants.zig");

pub const Config = struct {
    api: []const u8,
    websocket: []const u8,
};

var config = Config{
    .api = "",
    .websocket = "",
};

/// Yapılandırmayı yükler
pub fn load(allocator: std.mem.Allocator) !void {
    _ = allocator;

    // TODO:
    // 1. constants.CONFIG_URL adresini indir.
    // 2. config.js dosyasını oku.
    // 3. const API = "..." değerini bul.
    // 4. const WS = "..." değerini bul.
    // 5. config değişkenini doldur.
}

/// API adresini döndürür.
pub fn getApi() []const u8 {
    return config.api;
}

/// WebSocket adresini döndürür.
pub fn getWebSocket() []const u8 {
    return config.websocket;
}
