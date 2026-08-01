const std = @import("std");
const terminal = @import("../utils/terminal.zig");
const accounts = @import("../storage/accounts.zig");

pub fn baslat(
    allocator: std.mem.Allocator,
    hesap: *accounts.Account,
) !void {
    _ = allocator;

    while (true) {
        try terminal.temizle();

        try terminal.logoGoster();

        try terminal.yatayCizgi();

        const stdout = std.io.getStdOut().writer();

        try stdout.print(
            "Kullanıcı : {s}\n",
            .{ hesap.username },
        );

        try stdout.writeAll(
            "Durum     : Çevrimiçi\n",
        );

        try terminal.yatayCizgi();

        try stdout.writeAll(
            "\n"
            ++ "Sohbetler\n"
            ++ "─────────\n\n"
            ++ "Henüz sohbet bulunmuyor.\n\n",
        );

        try terminal.yatayCizgi();

        try stdout.writeAll(
            "\nKomutlar\n"
            "---------\n"
            "/chat @kullanıcı\n"
            "/friends\n"
            "/profile\n"
            "/logout\n"
            "/exit\n\n",
        );

        try terminal.prompt();

        var buffer: [1024]u8 = undefined;

        const satir = try std.io
            .getStdIn()
            .reader()
            .readUntilDelimiterOrEof(
                &buffer,
                '\n',
            );

        if (satir == null)
            break;

        const komut = std.mem.trim(
            u8,
            satir.?,
            " \r\n\t",
        );

        if (std.mem.eql(u8, komut, "/exit")) {
            break;
        }

        // TODO:
        // /chat
        // /friends
        // /profile
        // /logout
    }
}
