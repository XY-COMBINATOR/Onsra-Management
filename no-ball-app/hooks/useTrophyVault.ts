/**
 * useTrophyVault manages persistent collection state in local storage.
 * It handles reading writing and validating the player vault safely.
 */
import { validateUserProgress, VAULT_STORAGE_KEY } from "../lib/validation"
import type { UserProgress } from "../types/vault"
import type { BallMetadata } from "../types/ball"

export function useTrophyVault(catalog: BallMetadata[]) {
  /**
   * Loads validated progress from local storage or returns a safe default.
   */
  function loadProgress(): UserProgress {
    if (typeof window === "undefined") {
      return {
        unlockedBallIds: [],
        totalXP: 0,
        gamesPlayed: 0,
        lastDailyDate: null,
      }
    }

    try {
      const raw = window.localStorage.getItem(VAULT_STORAGE_KEY)
      if (!raw) {
        return {
          unlockedBallIds: [],
          totalXP: 0,
          gamesPlayed: 0,
          lastDailyDate: null,
        }
      }
      return validateUserProgress(JSON.parse(raw))
    } catch (error) {
      console.error("Failed to load vault progress", error)
      return {
        unlockedBallIds: [],
        totalXP: 0,
        gamesPlayed: 0,
        lastDailyDate: null,
      }
    }
  }

  /**
   * Persists progress to local storage after validation.
   */
  function saveProgress(progress: UserProgress): void {
    if (typeof window === "undefined") {
      return
    }
    try {
      window.localStorage.setItem(VAULT_STORAGE_KEY, JSON.stringify(progress))
    } catch (error) {
      console.error("Failed to save vault progress", error)
    }
  }

  /**
   * Unlocks a ball if it is not already unlocked and awards XP.
   */
  function unlockBall(ballId: string): boolean {
    const progress = loadProgress()
    if (progress.unlockedBallIds.includes(ballId)) {
      return false
    }

    const ball = catalog.find((b) => b.id === ballId)
    if (!ball) {
      return false
    }

    progress.unlockedBallIds.push(ballId)
    progress.totalXP += ball.unlockXP
    progress.gamesPlayed += 1

    saveProgress(progress)
    return true
  }

  /**
   * Returns the list of unlocked ball metadata objects.
   */
  function getUnlockedBalls(): BallMetadata[] {
    const progress = loadProgress()
    return catalog.filter((b) => progress.unlockedBallIds.includes(b.id))
  }

  return { loadProgress, saveProgress, unlockBall, getUnlockedBalls }
}
