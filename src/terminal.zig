const std = @import("std");
const constants = @import("../constants.zig");

pub fn temizle() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.writeAll("\x1b[2J\x1b[H");
}

pub fn logoGoster() !void {
    const stdout = std.io.getStdOut().writer();

    try stdout.print(
        \\╔══════════════════════════════════════════════╗
        \\║                                              ║
        \\║              {s}               ║
        \\║                  {s}                    ║
        \\║                                              ║
        \\╚══════════════════════════════════════════════╝
        \\
    , .{
        constants.APP_NAME,
        constants.CHANNEL,
    });
}

pub fn yatayCizgi() !void {
    const stdout = std.io.getStdOut().writer();

    try stdout.writeAll(
        "────────────────────────────────────────────────────────\n",
    );
}

pub fn baslik(metin: []const u8) !void {
    const stdout = std.io.getStdOut().writer();

    try yatayCizgi();
    try stdout.print("{s}\n", .{metin});
    try yatayCizgi();
}

pub fn bilgi(metin: []const u8) !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("ℹ {s}\n", .{metin});
}

pub fn basari(metin: []const u8) !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("✓ {s}\n", .{metin});
}

pub fn uyari(metin: []const u8) !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("! {s}\n", .{metin});
}

pub fn hata(metin: []const u8) !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("✗ {s}\n", .{metin});
}

pub fn bosSatir() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.writeAll("\n");
}

pub fn prompt() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("{s}", .{constants.PROMPT});
}
