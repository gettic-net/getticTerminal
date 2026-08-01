const std = @import("std");
const http = @import("http.zig");

pub const LoginRequest = struct {
    username: []const u8,
    password: []const u8,
};

pub const SignupRequest = struct {
    username: []const u8,
    password: []const u8,
};

pub const AuthResponse = struct {
    success: bool,
    access_token: []u8,
    refresh_token: []u8,
    message: []u8,
};

pub const AuthClient = struct {
    allocator: std.mem.Allocator,
    client: http.Client,

    pub fn init(allocator: std.mem.Allocator) AuthClient {
        return .{
            .allocator = allocator,
            .client = http.Client.init(allocator),
        };
    }

    pub fn login(
        self: *AuthClient,
        request: LoginRequest,
    ) !AuthResponse {
        _ = self;
        _ = request;

        // TODO:
        // POST /auth/login
        return error.NotImplemented;
    }

    pub fn signup(
        self: *AuthClient,
        request: SignupRequest,
    ) !AuthResponse {
        _ = self;
        _ = request;

        // TODO:
        // POST /auth/signup
        return error.NotImplemented;
    }

    pub fn refresh(
        self: *AuthClient,
        refresh_token: []const u8,
    ) !AuthResponse {
        _ = self;
        _ = refresh_token;

        // TODO:
        // POST /auth/refresh
        return error.NotImplemented;
    }

    pub fn logout(
        self: *AuthClient,
        access_token: []const u8,
    ) !void {
        _ = self;
        _ = access_token;

        // TODO:
        // POST /auth/logout
    }
};
