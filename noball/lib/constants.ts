/**
 * Game constants shared across hooks and components.
 * All values are strict literals or primitives to avoid runtime mutation.
 */
export const GAME_CONFIG = {
  maxLives: 3,
  basePoints: 100,
  streakBonusPerLevel: 50,
  comboThreshold: 3,
  maxComboMultiplier: 5,
  dailyResetHourUTC: 0,
  audioVolume: 0.4,
} as const

/**
 * Color palette for broadcast sports analytics theme.
 * No hyphens in key names.
 */
export const COLORS = {
  bgDark: "#0a0a0f",
  bgSurface: "#14141e",
  textPrimary: "#ffffff",
  textSecondary: "#94a3b8",
  accent: "#3b82f6",
  accentGlow: "rgba(59, 130, 246, 0.4)",
  success: "#22c55e",
  warning: "#f59e0b",
  error: "#ef4444",
} as const

/**
 * Local storage key for vault persistence.
 */
export const VAULT_STORAGE_KEY = "noball_vault_v1"

/**
 * Seed string for deterministic daily challenge selection.
 * Must remain stable across deployments to keep daily balls consistent.
 * No hyphens anywhere in this string.
 */
export const DAILY_SEED_STRING = "noBallDaily"
