const std = @import("std");

/// =======================================================
/// GETTIC TERMINAL
/// Ortak sabitler
/// =======================================================

pub const APP_NAME = "Gettic";
pub const APP_VERSION = "STABLE";
pub const APP_AUTHOR = "Darking053Official";

/// GitHub deposu
pub const GITHUB =
    "https://github.com/darking053official/gettic";

/// API ayarları
pub const CONFIG_JS_URL =
    "https://raw.githubusercontent.com/darking053official/gettic/main/app/js/config.js";

pub const API_TIMEOUT_MS: u32 = 15000;
pub const WS_TIMEOUT_MS: u32 = 15000;

/// Dizinler
pub const DATA_DIR = "data";
pub const CACHE_DIR = "data/cache";
pub const LOG_DIR = "data/logs";

/// Dosyalar
pub const ACCOUNTS_FILE = "data/accounts.json";
pub const CONFIG_FILE = "data/config.json";
pub const MEMORY_FILE = "data/memory.json";

/// Log dosyası
pub const LOG_FILE = "data/logs/gettic.log";

/// Terminal
pub const DEFAULT_THEME = "dark";
pub const DEFAULT_LANGUAGE = "tr";

/// Ağ
pub const MAX_MESSAGE_SIZE: usize = 1024 * 64;
pub const MAX_USERNAME_LENGTH: usize = 32;
pub const MIN_USERNAME_LENGTH: usize = 3;

pub const MAX_PASSWORD_LENGTH: usize = 128;
pub const MIN_PASSWORD_LENGTH: usize = 6;

/// Sohbet
pub const MAX_CHAT_HISTORY: usize = 500;
pub const MAX_FRIENDS: usize = 5000;

/// Yenileme süreleri
pub const PING_INTERVAL_SECONDS: u64 = 20;
pub const HEARTBEAT_INTERVAL_SECONDS: u64 = 30;
pub const RECONNECT_DELAY_SECONDS: u64 = 5;

/// Desteklenen temalar
pub const Theme = enum {
    dark,
    light,
    matrix,
    classic,
};

/// Desteklenen işletim sistemleri
pub const Platform = enum {
    windows,
    linux,
    termux,
    unknown,
};

pub fn currentPlatform() Platform {
    return switch (@import("builtin").os.tag) {
        .windows => .windows,
        .linux => .linux,
        .android => .termux,
        else => .unknown,
    };
}

pub fn version() []const u8 {
    return APP_VERSION;
}

pub fn appName() []const u8 {
    return APP_NAME;
}
