const std = @import("std");

pub const ChatItem = struct {
    id: []const u8,
    username: []const u8,
    last_message: []const u8,
    unread_count: u32,
    online: bool,
};

pub const Sidebar = struct {
    allocator: std.mem.Allocator,
    chats: std.ArrayList(ChatItem),
    selected: usize,

    pub fn init(allocator: std.mem.Allocator) Sidebar {
        return .{
            .allocator = allocator,
            .chats = std.ArrayList(ChatItem).init(allocator),
            .selected = 0,
        };
    }

    pub fn deinit(self: *Sidebar) void {
        self.chats.deinit();
    }

    pub fn draw(self: *Sidebar) !void {
        _ = self;
        // TODO: Sohbet listesini çiz
    }

    pub fn moveUp(self: *Sidebar) void {
        if (self.selected > 0)
            self.selected -= 1;
    }

    pub fn moveDown(self: *Sidebar) void {
        if (self.selected + 1 < self.chats.items.len)
            self.selected += 1;
    }

    pub fn current(self: *Sidebar) ?*ChatItem {
        if (self.chats.items.len == 0)
            return null;

        return &self.chats.items[self.selected];
    }
};
