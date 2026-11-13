/**
 * GameMode defines the two supported play modes.
 */
export type GameMode = "daily" | "endless"

/**
 * GameState holds all mutable runtime state for a single session.
 */
export interface GameState {
  mode: GameMode
  score: number
  streak: number
  comboMultiplier: number
  lives: number
  isPlaying: boolean
  correctGuesses: string[]
  currentBall: BallInstance | null
}

/**
 * ScoreState captures the result of a single guess evaluation.
 */
export interface ScoreState {
  points: number
  streakBonus: number
  comboMultiplier: number
  isCorrect: boolean
}
