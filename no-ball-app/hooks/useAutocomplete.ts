/**
 * useAutocomplete provides fuzzy matching for player guesses.
 * It exposes a function to test a guess against the full ball catalog
 * and return the best matching ball or null.
 */
import { fuzzyScoreGuess } from "../lib/fuzzyMatch"
import type { BallMetadata } from "../types/ball"

export function useAutocomplete(catalog: BallMetadata[]) {
  /**
   * Tests a player guess against all catalog balls.
   * Returns the best match if within threshold, otherwise null.
   */
  function guessBall(guess: string): BallMetadata | null {
    if (!guess || guess.trim().length === 0) {
      return null
    }

    let bestBall: BallMetadata | null = null
    let bestScore: number | null = null

    for (const ball of catalog) {
      const score = fuzzyScoreGuess(guess, ball)
      if (score !== null && (bestScore === null || score < bestScore)) {
        bestBall = ball
        bestScore = score
      }
    }

    return bestBall
  }

  return { guessBall }
}
