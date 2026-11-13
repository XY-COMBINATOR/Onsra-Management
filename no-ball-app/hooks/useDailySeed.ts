/**
 * useDailySeed computes a deterministic seed for the daily challenge.
 * Given a date string, it returns a stable index into the ball catalog
 * so every player sees the same ball on the same calendar day.
 */
import { DAILY_SEED_STRING } from "../lib/constants"

/**
 * Generates a stable numeric seed from a date string and a constant salt.
 * Uses a simple hash function to avoid external dependencies.
 */
export function generateDailySeed(dateString: string): number {
  const input = `${dateString}${DAILY_SEED_STRING}`
  let hash = 0
  for (let i = 0; i < input.length; i += 1) {
    const char = input.charCodeAt(i)
    hash = (hash << 5) - hash + char
    hash = hash & hash
  }
  return Math.abs(hash)
}

/**
 * Returns the UTC date string in YYYY-MM-DD format for the current day.
 */
export function getTodayDateString(): string {
  const now = new Date()
  return now.toISOString().slice(0, 10)
}

/**
 * Picks a ball index deterministically from the catalog length.
 */
export function pickDailyBallIndex(catalogLength: number, dateString?: string): number {
  const date = dateString || getTodayDateString()
  const seed = generateDailySeed(date)
  return seed % catalogLength
}
