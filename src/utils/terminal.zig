const std = @import("std");
const builtin = @import("builtin");

pub const Renk = struct {
    pub const sifirla = "\x1b[0m";

    pub const siyah = "\x1b[30m";
    pub const kirmizi = "\x1b[31m";
    pub const yesil = "\x1b[32m";
    pub const sari = "\x1b[33m";
    pub const mavi = "\x1b[34m";
    pub const mor = "\x1b[35m";
    pub const camgobegi = "\x1b[36m";
    pub const beyaz = "\x1b[37m";

    pub const parlak_kirmizi = "\x1b[91m";
    pub const parlak_yesil = "\x1b[92m";
    pub const parlak_sari = "\x1b[93m";
    pub const parlak_mavi = "\x1b[94m";
    pub const parlak_mor = "\x1b[95m";
    pub const parlak_camgobegi = "\x1b[96m";
    pub const parlak_beyaz = "\x1b[97m";

    pub const kalin = "\x1b[1m";
    pub const alticizili = "\x1b[4m";
};

pub fn temizle() !void {
    const out = std.io.getStdOut().writer();

    try out.writeAll("\x1b[2J");
    try out.writeAll("\x1b[H");
}

pub fn imlecGizle() !void {
    try std.io.getStdOut().writer().writeAll("\x1b[?25l");
}

pub fn imlecGoster() !void {
    try std.io.getStdOut().writer().writeAll("\x1b[?25h");
}

pub fn imlecGit(
    satir: usize,
    sutun: usize,
) !void {
    try std.io.getStdOut().writer().print(
        "\x1b[{};{}H",
        .{
            satir,
            sutun,
        },
    );
}

pub fn baslik(
    yazi: []const u8,
) !void {

    const out = std.io.getStdOut().writer();

    try out.print(
        "{s}{s}",
        .{
            Renk.parlak_camgobegi,
            Renk.kalin,
        },
    );

    try out.print(
        "═══════════════════════════════════════════════════════\n",
        .{},
    );

    try out.print(
        "                  {s}\n",
        .{yazi},
    );

    try out.print(
        "═══════════════════════════════════════════════════════\n",
        .{},
    );

    try out.writeAll(Renk.sifirla);
}

pub fn logoGoster() !void {

    const out = std.io.getStdOut().writer();

    try out.writeAll(Renk.parlak_yesil);

    try out.writeAll(
        \\   _____      _   _   _   _
        \\  / ____|    | | | | | | (_)
        \\ | |  __  ___| |_| |_| |_ _  ___
        \\ | | |_ |/ _ \\ __| __| __| |/ __|
        \\ | |__| |  __/ |_| |_| |_| | (__
        \\  \\_____|\\___|\\__|\\__|\\__|_|\\___|
        \\
    );

    try out.writeAll(Renk.sifirla);

    try out.writeAll(
        "Gettic Terminal\n",
    );

    try out.writeAll(
        "Sürüm : STABLE\n\n",
    );
}

pub fn yatayCizgi() !void {

    try std.io.getStdOut().writer().writeAll(
        "──────────────────────────────────────────────────────────────\n",
    );
}

pub fn bosSatir() !void {
    try std.io.getStdOut().writer().writeByte('\n');
}
