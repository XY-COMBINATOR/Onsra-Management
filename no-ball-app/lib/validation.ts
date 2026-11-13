/**
 * Validation utilities for user inputs and local storage schemas.
 * All functions are pure and throw descriptive errors on invalid input.
 */
import type { UserProgress } from "../types/vault"

/**
 * Sanitizes a raw input string by trimming and removing control characters.
 * Returns an empty string if input is not a valid string.
 */
export function sanitizeInput(value: unknown): string {
  if (typeof value !== "string") {
    return ""
  }
  return value.replace(/[\x00-\x1f\x7f-\x9f]/g, "").trim()
}

/**
 * Validates that a guess string is non-empty after sanitization.
 */
export function validateGuess(value: unknown): { isValid: boolean; sanitized: string } {
  const sanitized = sanitizeInput(value)
  return {
    isValid: sanitized.length > 0,
    sanitized,
  }
}

/**
 * Validates a UserProgress object loaded from local storage.
 * Returns a safe default if the stored data is corrupted or malformed.
 */
export function validateUserProgress(value: unknown): UserProgress {
  const defaultProgress: UserProgress = {
    unlockedBallIds: [],
    totalXP: 0,
    gamesPlayed: 0,
    lastDailyDate: null,
  }

  if (!value || typeof value !== "object") {
    return defaultProgress
  }

  const record = value as Record<string, unknown>

  const unlockedBallIds = Array.isArray(record.unlockedBallIds)
    ? record.unlockedBallIds.filter((id): id is string => typeof id === "string")
    : []

  const totalXP = typeof record.totalXP === "number" && Number.isFinite(record.totalXP)
    ? record.totalXP
    : 0

  const gamesPlayed = typeof record.gamesPlayed === "number" && Number.isFinite(record.gamesPlayed)
    ? record.gamesPlayed
    : 0

  const lastDailyDate =
    typeof record.lastDailyDate === "string" || record.lastDailyDate === null
      ? record.lastDailyDate
      : null

  return {
    unlockedBallIds,
    totalXP,
    gamesPlayed,
    lastDailyDate,
  }
}
