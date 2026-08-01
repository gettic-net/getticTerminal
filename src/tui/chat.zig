const std = @import("std");
const websocket = @import("../api/websocket.zig");
const accounts = @import("../storage/accounts.zig");

pub const Message = struct {
    id: []const u8,
    sender: []const u8,
    text: []const u8,
    timestamp: i64,
    edited: bool,
};

pub const Chat = struct {
    id: []const u8,
    username: []const u8,
    messages: std.ArrayList(Message),
};

pub fn open(
    allocator: std.mem.Allocator,
    ws: *websocket.Client,
    account: *accounts.Account,
    username: []const u8,
) !void {
    _ = allocator;
    _ = ws;
    _ = account;
    _ = username;

    // TODO:
    // Sohbet geçmişini yükle
    // Sohbet ekranını çiz
    // Gelen mesajları dinle
    // Yazılan mesajları gönder
    // /exit ile çık
}
