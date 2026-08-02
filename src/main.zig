const std = @import("std");
const cli = @import("cli.zig");

pub fn main() !void {
    // Genel amaçlı allocator
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        const durum = gpa.deinit();
        std.debug.assert(durum == .ok);
    }

    const allocator = gpa.allocator();

    // Komut satırı argümanlarını al
    var args = try std.process.argsWithAllocator(allocator);
    defer args.deinit();

    // Program adı
    _ = args.next();

    // Geri kalan argümanları diziye aktar
    var liste = std.ArrayList([]const u8).init(allocator);
    defer liste.deinit();

    while (args.next()) |arg| {
        try liste.append(arg);
    }

    // CLI'yi çalıştır
    try cli.run(
        allocator,
        liste.items,
    );
}
