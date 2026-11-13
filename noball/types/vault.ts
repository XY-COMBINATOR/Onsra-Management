/**
 * UserProgress persists unlocked balls and aggregate stats in local storage.
 */
export interface UserProgress {
  unlockedBallIds: string[]
  totalXP: number
  gamesPlayed: number
  lastDailyDate: string | null
}

/**
 * UnlockedBall is a lightweight view of a ball owned by the player.
 */
export interface UnlockedBall {
  id: string
  name: string
  unlockedAt: string
}
