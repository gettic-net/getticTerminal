const std = @import("std");

/// Uygulama Bilgileri
pub const APP_NAME = "GETTIC TERMINAL";
pub const CHANNEL = "STABLE";

pub const COMPANY = "Gettic";
pub const COPYRIGHT = "© Gettic";

/// GitHub Yapılandırması
pub const GITHUB_OWNER = "darking053official";
pub const GITHUB_REPO = "gettic";
pub const GITHUB_BRANCH = "main";

/// Web istemcisinin yapılandırma dosyası
pub const CONFIG_URL =
    "https://raw.githubusercontent.com/darking053official/gettic/main/app/js/config.js";

/// Yerel dosyalar
pub const CONFIG_DIR = ".gettic";
pub const CACHE_DIR = "cache";
pub const LOG_DIR = "logs";

pub const CONFIG_FILE = "config.json";
pub const ACCOUNTS_FILE = "accounts.json";

/// Sınırlar
pub const MAX_USERNAME_LENGTH: usize = 32;
pub const MIN_USERNAME_LENGTH: usize = 3;

pub const MAX_PASSWORD_LENGTH: usize = 128;
pub const MIN_PASSWORD_LENGTH: usize = 8;

pub const MAX_MESSAGE_LENGTH: usize = 4096;

/// Terminal
pub const PROMPT = "gettic > ";

/// Ağ
pub const HTTP_TIMEOUT_MS: u32 = 10000;
pub const WS_RECONNECT_DELAY_MS: u32 = 3000;

/// Bellek
pub const MAX_CACHE_SIZE_MB: usize = 256;
pub const MAX_LOG_SIZE_MB: usize = 50;
