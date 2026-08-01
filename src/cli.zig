const std = @import("std");

pub fn start(allocator: std.mem.Allocator) !void {
    _ = allocator;

    try ekraniGoster();

    var stdin = std.io.getStdIn().reader();
    var stdout = std.io.getStdOut().writer();

    var buffer: [1024]u8 = undefined;

    while (true) {
        try stdout.print("\ngettic > ", .{});

        const satir = try stdin.readUntilDelimiterOrEof(&buffer, '\n');

        if (satir == null)
            break;

        const komut = std.mem.trim(u8, satir.?, " \r\n\t");

        if (komut.len == 0)
            continue;

        if (std.mem.eql(u8, komut, "gettic exit")) {
            try stdout.print("\nGettic Terminal kapatılıyor...\n", .{});
            break;
        }

        if (std.mem.eql(u8, komut, "gettic help")) {
            try yardimYaz(stdout);
            continue;
        }

        try stdout.print(
            "\nBilinmeyen komut.\nYardım almak için 'gettic help' yazın.\n",
            .{},
        );
    }
}

fn ekraniGoster() !void {
    const stdout = std.io.getStdOut().writer();

    try stdout.print(
        \\╔══════════════════════════════════════╗
        \\║                                      ║
        \\║          GETTIC TERMINAL             ║
        \\║              STABLE                  ║
        \\║                                      ║
        \\╚══════════════════════════════════════╝
        \\
        \\Gettic Terminal'e hoş geldiniz.
        \\Yardım almak için:
        \\
        \\gettic help
        \\
    , .{});
}

fn yardimYaz(writer: anytype) !void {
    try writer.print(
        \\
        \\════════════ KOMUTLAR ════════════
        \\
        \\gettic signup
        \\gettic login
        \\gettic start
        \\gettic logout
        \\gettic info
        \\gettic update
        \\gettic exit
        \\
    , .{});
}
