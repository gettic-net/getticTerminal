const std = @import("std");

const commands = @import("commands/mod.zig");

pub fn run(
    allocator: std.mem.Allocator,
    args: []const []const u8,
) !void {

    if (args.len == 0) {
        try commands.help.execute();
        return;
    }

    const cmd = args[0];

    if (std.mem.eql(u8, cmd, "help")) {
        try commands.help.execute();
        return;
    }

    if (std.mem.eql(u8, cmd, "login")) {
        try commands.login.execute(allocator, args[1..]);
        return;
    }

    if (std.mem.eql(u8, cmd, "signup")) {
        try commands.signup.execute(allocator, args[1..]);
        return;
    }

    if (std.mem.eql(u8, cmd, "start")) {
        try commands.start.execute(allocator);
        return;
    }

    if (std.mem.eql(u8, cmd, "logout")) {
        try commands.logout.execute(allocator);
        return;
    }

    if (std.mem.eql(u8, cmd, "chat")) {
        try commands.chat.execute(allocator, args[1..]);
        return;
    }

    if (std.mem.eql(u8, cmd, "friends")) {
        try commands.friends.execute(allocator, args[1..]);
        return;
    }

    if (std.mem.eql(u8, cmd, "block")) {
        try commands.block.execute(allocator, args[1..]);
        return;
    }

    if (std.mem.eql(u8, cmd, "profile")) {
        try commands.profile.execute(allocator, args[1..]);
        return;
    }

    if (std.mem.eql(u8, cmd, "settings")) {
        try commands.settings.execute(allocator, args[1..]);
        return;
    }

    if (std.mem.eql(u8, cmd, "memory")) {
        try commands.memory.execute(allocator, args[1..]);
        return;
    }

    if (std.mem.eql(u8, cmd, "devices")) {
        try commands.devices.execute(allocator, args[1..]);
        return;
    }

    if (std.mem.eql(u8, cmd, "sessions")) {
        try commands.sessions.execute(allocator, args[1..]);
        return;
    }

    if (std.mem.eql(u8, cmd, "update")) {
        try commands.update.execute(allocator);
        return;
    }

    if (std.mem.eql(u8, cmd, "info")) {
        try commands.info.execute();
        return;
    }

    if (std.mem.eql(u8, cmd, "ping")) {
        try commands.ping.execute(allocator);
        return;
    }

    if (std.mem.eql(u8, cmd, "diagnostics")) {
        try commands.diagnostics.execute(allocator);
        return;
    }

    if (std.mem.eql(u8, cmd, "account")) {
        try commands.account.execute(allocator, args[1..]);
        return;
    }

    if (std.mem.eql(u8, cmd, "exit")) {
        try commands.exit.execute();
        return;
    }

    std.debug.print(
        "Bilinmeyen komut: {s}\n\n",
        .{cmd},
    );

    try commands.help.execute();
}
