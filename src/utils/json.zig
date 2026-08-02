const std = @import("std");

pub const Json = struct {

    pub fn dosyaVarMi(
        yol: []const u8,
    ) bool {

        std.fs.cwd().access(
            yol,
            .{},
        ) catch {
            return false;
        };

        return true;
    }

    pub fn dosyaOku(
        allocator: std.mem.Allocator,
        yol: []const u8,
    ) ![]u8 {

        const file = try std.fs.cwd().openFile(
            yol,
            .{},
        );
        defer file.close();

        return try file.readToEndAlloc(
            allocator,
            1024 * 1024,
        );
    }

    pub fn dosyaYaz(
        yol: []const u8,
        veri: []const u8,
    ) !void {

        const file = try std.fs.cwd().createFile(
            yol,
            .{
                .truncate = true,
            },
        );
        defer file.close();

        try file.writeAll(veri);
    }

    pub fn dosyaSil(
        yol: []const u8,
    ) !void {

        try std.fs.cwd().deleteFile(yol);
    }

    pub fn jsonOku(
        allocator: std.mem.Allocator,
        yol: []const u8,
    ) !std.json.Value {

        const veri = try dosyaOku(
            allocator,
            yol,
        );
        defer allocator.free(veri);

        var parsed = try std.json.parseFromSlice(
            std.json.Value,
            allocator,
            veri,
            .{},
        );

        return parsed.value;
    }

    pub fn jsonKaydet(
        allocator: std.mem.Allocator,
        yol: []const u8,
        value: std.json.Value,
    ) !void {

        var list = std.ArrayList(u8).init(
            allocator,
        );
        defer list.deinit();

        try std.json.stringify(
            value,
            .{
                .whitespace = .indent_4,
            },
            list.writer(),
        );

        try dosyaYaz(
            yol,
            list.items,
        );
    }

};

pub fn jsonDogrula(
    allocator: std.mem.Allocator,
    veri: []const u8,
) !bool {

    var parsed = std.json.parseFromSlice(
        std.json.Value,
        allocator,
        veri,
        .{},
    ) catch {
        return false;
    };
    defer parsed.deinit();

    return true;
}

pub fn jsonAnahtarVarMi(
    obje: std.json.ObjectMap,
    anahtar: []const u8,
) bool {

    return obje.get(anahtar) != null;
}

pub fn jsonStringAl(
    obje: std.json.ObjectMap,
    anahtar: []const u8,
) ?[]const u8 {

    const deger = obje.get(anahtar) orelse
        return null;

    return switch (deger) {
        .string => |v| v,
        else => null,
    };
}

pub fn jsonBoolAl(
    obje: std.json.ObjectMap,
    anahtar: []const u8,
) ?bool {

    const deger = obje.get(anahtar) orelse
        return null;

    return switch (deger) {
        .bool => |v| v,
        else => null,
    };
}

pub fn jsonIntAl(
    obje: std.json.ObjectMap,
    anahtar: []const u8,
) ?i64 {

    const deger = obje.get(anahtar) orelse
        return null;

    return switch (deger) {
        .integer => |v| v,
        else => null,
    };
}

pub fn jsonFloatAl(
    obje: std.json.ObjectMap,
    anahtar: []const u8,
) ?f64 {

    const deger = obje.get(anahtar) orelse
        return null;

    return switch (deger) {
        .float => |v| v,
        else => null,
    };
}

pub fn jsonNullMu(
    obje: std.json.ObjectMap,
    anahtar: []const u8,
) bool {

    const deger = obje.get(anahtar) orelse
        return true;

    return deger == .null;
}

pub fn jsonObjeMi(
    deger: std.json.Value,
) bool {

    return deger == .object;
}

pub fn jsonDiziMi(
    deger: std.json.Value,
) bool {

    return deger == .array;
}

pub fn jsonPrettyYaz(
    allocator: std.mem.Allocator,
    value: std.json.Value,
) ![]u8 {
    var list = std.ArrayList(u8).init(allocator);
    errdefer list.deinit();

    try std.json.stringify(
        value,
        .{
            .whitespace = .indent_4,
        },
        list.writer(),
    );

    return list.toOwnedSlice();
}

pub fn jsonBosObje(
    allocator: std.mem.Allocator,
) std.json.Value {
    _ = allocator;

    return .{
        .object = .{},
    };
}

pub fn jsonBosDizi() std.json.Value {
    return .{
        .array = .{},
    };
}

pub fn jsonStringDegeri(
    metin: []const u8,
) std.json.Value {
    return .{
        .string = metin,
    };
}

pub fn jsonBoolDegeri(
    deger: bool,
) std.json.Value {
    return .{
        .bool = deger,
    };
}

pub fn jsonIntDegeri(
    deger: i64,
) std.json.Value {
    return .{
        .integer = deger,
    };
}

pub fn jsonFloatDegeri(
    deger: f64,
) std.json.Value {
    return .{
        .float = deger,
    };
}

pub fn jsonNullDegeri() std.json.Value {
    return .null;
}

pub fn jsonKaydetPretty(
    allocator: std.mem.Allocator,
    yol: []const u8,
    value: std.json.Value,
) !void {

    const veri = try jsonPrettyYaz(
        allocator,
        value,
    );
    defer allocator.free(veri);

    try dosyaYaz(
        yol,
        veri,
    );
}

pub fn jsonBosMu(
    value: std.json.Value,
) bool {
    return switch (value) {
        .null => true,
        .string => |v| v.len == 0,
        .array => |v| v.items.len == 0,
        .object => |v| v.count() == 0,
        else => false,
    };
}

pub fn jsonTipi(
    value: std.json.Value,
) []const u8 {

    return switch (value) {
        .null => "null",
        .bool => "bool",
        .integer => "integer",
        .float => "float",
        .number_string => "number_string",
        .string => "string",
        .array => "array",
        .object => "object",
    };
}

pub fn jsonOlustur(
    yol: []const u8,
    varsayilan: []const u8,
) !void {

    if (dosyaVarMi(yol))
        return;

    try dosyaYaz(
        yol,
        varsayilan,
    );
}

pub fn jsonYedekle(
    allocator: std.mem.Allocator,
    kaynak: []const u8,
    hedef: []const u8,
) !void {

    const veri = try dosyaOku(
        allocator,
        kaynak,
    );
    defer allocator.free(veri);

    try dosyaYaz(
        hedef,
        veri,
    );
}

pub fn jsonBiçimlendir(
    allocator: std.mem.Allocator,
    yol: []const u8,
) !void {

    const value = try jsonOku(
        allocator,
        yol,
    );

    try jsonKaydetPretty(
        allocator,
        yol,
        value,
    );
}
