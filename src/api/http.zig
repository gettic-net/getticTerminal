const std = @import("std");

pub const Method = enum {
    GET,
    POST,
    PUT,
    PATCH,
    DELETE,
};

pub const Response = struct {
    status: u16,
    body: []u8,
};

pub const Client = struct {
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator) Client {
        return .{
            .allocator = allocator,
        };
    }

    pub fn get(
        self: *Client,
        url: []const u8,
    ) !Response {
        _ = self;
        _ = url;

        // TODO
        return error.NotImplemented;
    }

    pub fn post(
        self: *Client,
        url: []const u8,
        body: []const u8,
    ) !Response {
        _ = self;
        _ = url;
        _ = body;

        // TODO
        return error.NotImplemented;
    }

    pub fn put(
        self: *Client,
        url: []const u8,
        body: []const u8,
    ) !Response {
        _ = self;
        _ = url;
        _ = body;

        return error.NotImplemented;
    }

    pub fn patch(
        self: *Client,
        url: []const u8,
        body: []const u8,
    ) !Response {
        _ = self;
        _ = url;
        _ = body;

        return error.NotImplemented;
    }

    pub fn delete(
        self: *Client,
        url: []const u8,
    ) !Response {
        _ = self;
        _ = url;

        return error.NotImplemented;
    }
};
