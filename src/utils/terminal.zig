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

pub fn yaz(
    metin: []const u8,
) !void {
    try std.io.getStdOut().writer().writeAll(metin);
}

pub fn yazSatir(
    metin: []const u8,
) !void {
    const out = std.io.getStdOut().writer();

    try out.writeAll(metin);
    try out.writeByte('\n');
}

pub fn bilgi(
    metin: []const u8,
) !void {

    const out = std.io.getStdOut().writer();

    try out.print(
        "{s}[BİLGİ]{s} {s}\n",
        .{
            Renk.parlak_camgobegi,
            Renk.sifirla,
            metin,
        },
    );
}

pub fn basari(
    metin: []const u8,
) !void {

    const out = std.io.getStdOut().writer();

    try out.print(
        "{s}[BAŞARILI]{s} {s}\n",
        .{
            Renk.parlak_yesil,
            Renk.sifirla,
            metin,
        },
    );
}

pub fn hata(
    metin: []const u8,
) !void {

    const out = std.io.getStdOut().writer();

    try out.print(
        "{s}[HATA]{s} {s}\n",
        .{
            Renk.parlak_kirmizi,
            Renk.sifirla,
            metin,
        },
    );
}

pub fn uyari(
    metin: []const u8,
) !void {

    const out = std.io.getStdOut().writer();

    try out.print(
        "{s}[UYARI]{s} {s}\n",
        .{
            Renk.parlak_sari,
            Renk.sifirla,
            metin,
        },
    );
}

pub fn prompt() !void {

    const out = std.io.getStdOut().writer();

    try out.print(
        "{s}>{s} ",
        .{
            Renk.parlak_yesil,
            Renk.sifirla,
        },
    );
}

pub fn kutuBaslik(
    baslik: []const u8,
) !void {

    const out = std.io.getStdOut().writer();

    try out.writeAll("╔");

    var i: usize = 0;
    while (i < 58) : (i += 1)
        try out.writeAll("═");

    try out.writeAll("╗\n");

    try out.print(
        "║ {:<56} ║\n",
        .{baslik},
    );

    try out.writeAll("╠");

    i = 0;

    while (i < 58) : (i += 1)
        try out.writeAll("═");

    try out.writeAll("╣\n");
}

pub fn kutuSatir(
    metin: []const u8,
) !void {

    try std.io.getStdOut().writer().print(
        "║ {:<56} ║\n",
        .{metin},
    );
}

pub fn kutuAlt() !void {

    const out = std.io.getStdOut().writer();

    try out.writeAll("╚");

    var i: usize = 0;

    while (i < 58) : (i += 1)
        try out.writeAll("═");

    try out.writeAll("╝\n");
}

pub fn bekleEnter() !void {

    try yazSatir("");

    try bilgi(
        "Devam etmek için Enter tuşuna basın...",
    );

    var buffer: [8]u8 = undefined;

    _ = try std.io
        .getStdIn()
        .reader()
        .readUntilDelimiterOrEof(
            &buffer,
            '\n',
        );
}

pub fn girdiAl(
    allocator: std.mem.Allocator,
    mesaj: []const u8,
) ![]u8 {
    const out = std.io.getStdOut().writer();

    try out.writeAll(mesaj);

    var reader = std.io.getStdIn().reader();

    return try reader.readUntilDelimiterAlloc(
        allocator,
        '\n',
        4096,
    );
}

pub fn gizliGirdiAl(
    allocator: std.mem.Allocator,
    mesaj: []const u8,
) ![]u8 {
    // Şimdilik normal giriş.
    // Windows ve Linux için gerçek karakter gizleme
    // Bölüm 4'te eklenecek.

    return try girdiAl(
        allocator,
        mesaj,
    );
}

pub fn onayAl(
    allocator: std.mem.Allocator,
    mesaj: []const u8,
) !bool {

    while (true) {

        const cevap = try girdiAl(
            allocator,
            mesaj,
        );
        defer allocator.free(cevap);

        if (std.ascii.eqlIgnoreCase(
            cevap,
            "e",
        )) {
            return true;
        }

        if (std.ascii.eqlIgnoreCase(
            cevap,
            "h",
        )) {
            return false;
        }

        try uyari(
            "Lütfen sadece E veya H giriniz.",
        );
    }
}

pub fn secimAl(
    allocator: std.mem.Allocator,
    min: usize,
    max: usize,
) !usize {

    while (true) {

        const cevap = try girdiAl(
            allocator,
            "Seçiminiz: ",
        );
        defer allocator.free(cevap);

        const sayi = std.fmt.parseInt(
            usize,
            cevap,
            10,
        ) catch {
            try hata("Geçersiz sayı.");
            continue;
        };

        if (sayi < min or sayi > max) {
            try hata("Geçersiz seçim.");
            continue;
        }

        return sayi;
    }
}

pub fn bekle() !void {

    try bilgi(
        "Devam etmek için Enter tuşuna basın...",
    );

    var buffer: [8]u8 = undefined;

    _ = try std.io
        .getStdIn()
        .reader()
        .readUntilDelimiterOrEof(
            &buffer,
            '\n',
        );
}

pub fn satirOku(
    allocator: std.mem.Allocator,
) ![]u8 {

    return try std.io
        .getStdIn()
        .reader()
        .readUntilDelimiterAlloc(
            allocator,
            '\n',
            4096,
        );
}

pub fn temizSatir(
    allocator: std.mem.Allocator,
    veri: []const u8,
) ![]u8 {

    return try allocator.dupe(
        u8,
        std.mem.trim(
            u8,
            veri,
            " \r\n\t",
        ),
    );
}

pub fn terminalBaslat() !void {
    try temizle();
    try imlecGoster();
}

pub fn terminalKapat() !void {
    try imlecGoster();
    try std.io.getStdOut().writer().writeAll(Renk.sifirla);
}

pub fn pencereBoyutu() struct {
    genislik: usize,
    yukseklik: usize,
} {
    // Şimdilik varsayılan değer.
    // İleride Windows API / ioctl(TIOCGWINSZ)
    // ile gerçek boyut alınacak.
    return .{
        .genislik = 80,
        .yukseklik = 25,
    };
}

pub fn terminalDestekleniyor() bool {
    return switch (builtin.os.tag) {
        .windows,
        .linux,
        .android,
        => true,

        else => false,
    };
}

pub fn platformAdi() []const u8 {
    return switch (builtin.os.tag) {
        .windows => "Windows",
        .linux => "Linux",
        .android => "Termux",
        else => "Bilinmiyor",
    };
}

pub fn ayirac() !void {
    try yatayCizgi();
}

pub fn baslikVeLogo(
    baslik_yazisi: []const u8,
) !void {
    try temizle();
    try logoGoster();
    try baslik(baslik_yazisi);
}

pub fn bekleSaniye(
    saniye: u64,
) void {
    std.Thread.sleep(
        saniye * std.time.ns_per_s,
    );
}

pub fn bekleMilisaniye(
    ms: u64,
) void {
    std.Thread.sleep(
        ms * std.time.ns_per_ms,
    );
}

pub fn cikis(
    kod: u8,
) noreturn {
    terminalKapat() catch {};
    std.process.exit(kod);
}
