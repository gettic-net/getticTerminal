const std = @import("std");

pub const Account = struct {
    username: []u8,
    token: []u8,
    refresh_token: []u8,
    aktif: bool,
};

pub const AccountManager = struct {
    allocator: std.mem.Allocator,
    hesaplar: std.ArrayList(Account),

    pub fn init(allocator: std.mem.Allocator) AccountManager {
        return .{
            .allocator = allocator,
            .hesaplar = std.ArrayList(Account).init(allocator),
        };
    }

    pub fn deinit(self: *AccountManager) void {
        self.hesaplar.deinit();
    }

    pub fn yukle(self: *AccountManager) !void {
        _ = self;
        // TODO: accounts.json dosyasını oku
    }

    pub fn kaydet(self: *AccountManager) !void {
        _ = self;
        // TODO: accounts.json dosyasına yaz
    }

    pub fn ekle(
        self: *AccountManager,
        username: []const u8,
        token: []const u8,
        refresh: []const u8,
    ) !void {

        try self.hesaplar.append(.{
            .username = try self.allocator.dupe(u8, username),
            .token = try self.allocator.dupe(u8, token),
            .refresh_token = try self.allocator.dupe(u8, refresh),
            .aktif = false,
        });
    }

    pub fn aktifHesap(self: *AccountManager) ?*Account {
        for (self.hesaplar.items) |*hesap| {
            if (hesap.aktif)
                return hesap;
        }

        return null;
    }

    pub fn aktifYap(
        self: *AccountManager,
        username: []const u8,
    ) bool {

        var bulundu = false;

        for (self.hesaplar.items) |*hesap| {
            hesap.aktif = std.mem.eql(u8, hesap.username, username);

            if (hesap.aktif)
                bulundu = true;
        }

        return bulundu;
    }

    pub fn sil(
        self: *AccountManager,
        username: []const u8,
    ) void {

        var i: usize = 0;

        while (i < self.hesaplar.items.len) {

            if (std.mem.eql(
                u8,
                self.hesaplar.items[i].username,
                username,
            )) {

                _ = self.hesaplar.orderedRemove(i);
                return;
            }

            i += 1;
        }
    }
};
