const std = @import("std");

pub const EventType = enum {
    Connected,
    Disconnected,
    Message,
    FriendRequest,
    FriendAccepted,
    UserOnline,
    UserOffline,
    Typing,
    StopTyping,
    Notification,
    Error,
};

pub const Event = struct {
    event_type: EventType,
    data: []u8,
};

pub const Client = struct {
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator) Client {
        return .{
            .allocator = allocator,
        };
    }

    pub fn connect(
        self: *Client,
        token: []const u8,
    ) !void {
        _ = self;
        _ = token;

        // TODO:
        // WebSocket bağlantısı kur
    }

    pub fn disconnect(self: *Client) void {
        _ = self;

        // TODO:
        // Bağlantıyı kapat
    }

    pub fn sendMessage(
        self: *Client,
        chat_id: []const u8,
        message: []const u8,
    ) !void {
        _ = self;
        _ = chat_id;
        _ = message;

        // TODO:
        // Mesaj gönder
    }

    pub fn sendTyping(
        self: *Client,
        chat_id: []const u8,
    ) !void {
        _ = self;
        _ = chat_id;
    }

    pub fn poll(self: *Client) !?Event {
        _ = self;

        // TODO:
        // Gelen olayı döndür
        return null;
    }
};
