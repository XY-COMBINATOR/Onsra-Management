/**
 * Computes the Levenshtein distance between two strings.
 * Used for fuzzy matching player guesses against canonical ball names.
 */
import type { BallMetadata } from "../types/ball"

export function levenshteinDistance(a: string, b: string): number {
  const matrix: number[][] = []

  for (let i = 0; i <= b.length; i += 1) {
    matrix[i] = [i]
  }

  for (let j = 0; j <= a.length; j += 1) {
    matrix[0][j] = j
  }

  for (let i = 1; i <= b.length; i += 1) {
    for (let j = 1; j <= a.length; j += 1) {
      const cost = a[j - 1] === b[i - 1] ? 0 : 1
      matrix[i][j] = Math.min(
        matrix[i - 1][j] + 1,
        matrix[i][j - 1] + 1,
        matrix[i - 1][j - 1] + cost,
      )
    }
  }

  return matrix[b.length][a.length]
}

/**
 * Normalizes a string for comparison: lowercase and trim whitespace.
 */
export function normalizeText(text: string): string {
  return text.toLowerCase().trim()
}

/**
 * Scores a player guess against a ball metadata entry.
 * Returns null if the guess is too far off, otherwise returns a match score
 * where lower is better.
 */
export function fuzzyScoreGuess(guess: string, ball: BallMetadata): number | null {
  const normalizedGuess = normalizeText(guess)
  const fields = [
    normalizeText(ball.name),
    normalizeText(ball.tournament),
    String(ball.year),
  ]

  let bestDistance = Infinity

  for (const field of fields) {
    const distance = levenshteinDistance(normalizedGuess, field)
    if (distance < bestDistance) {
      bestDistance = distance
    }
  }

  // Threshold of 2 edits is generous enough for typos but strict enough
  // to prevent random guesses from matching.
  if (bestDistance > 2) {
    return null
  }

  return bestDistance
}
