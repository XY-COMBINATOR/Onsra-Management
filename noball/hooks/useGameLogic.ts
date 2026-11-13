/**
 * useGameLogic manages scoring streak and mode state for No Ball.
 * All scoring rules are deterministic and side-effect free where possible.
 */
import type { GameState, ScoreState } from "../types/game"
import type { BallMetadata } from "../types/ball"

export function useGameLogic(initialMode: GameMode = "daily") {
  /**
   * Creates a fresh game state for the given mode.
   */
  function createInitialState(mode: GameMode): GameState {
    return {
      mode,
      score: 0,
      streak: 0,
      comboMultiplier: 1,
      lives: 3,
      isPlaying: false,
      correctGuesses: [],
      currentBall: null,
    }
  }

  /**
   * Evaluates a guess against the current ball and returns score delta.
   * Does not mutate state; returns a new ScoreState and delta description.
   */
  function evaluateGuess(
    state: GameState,
    guess: string,
    currentBall: BallMetadata,
  ): { scoreState: ScoreState; isCorrect: boolean } {
    const normalizedGuess = guess.toLowerCase().trim()
    const normalizedName = currentBall.name.toLowerCase()
    const normalizedTournament = currentBall.tournament.toLowerCase()
    const normalizedYear = String(currentBall.year)

    const isCorrect =
      normalizedGuess === normalizedName ||
      normalizedGuess === normalizedTournament ||
      normalizedGuess === normalizedYear

    if (!isCorrect) {
      return {
        scoreState: {
          points: 0,
          streakBonus: 0,
          comboMultiplier: state.comboMultiplier,
          isCorrect: false,
        },
        isCorrect: false,
      }
    }

    // Correct guess: base points + streak bonus + combo multiplier
    const streakBonus = state.streak * 50
    const points = Math.floor((100 + streakBonus) * state.comboMultiplier)

    return {
      scoreState: {
        points,
        streakBonus,
        comboMultiplier: Math.min(state.comboMultiplier + 0.5, 5),
        isCorrect: true,
      },
      isCorrect: true,
    }
  }

  /**
   * Applies a correct guess to game state, updating score streak and combo.
   */
  function applyCorrectGuess(
    state: GameState,
    scoreState: ScoreState,
  ): GameState {
    return {
      ...state,
      score: state.score + scoreState.points,
      streak: state.streak + 1,
      comboMultiplier: scoreState.comboMultiplier,
      correctGuesses: [...state.correctGuesses, state.currentBall?.name || ""],
    }
  }

  /**
   * Applies an incorrect guess, reducing lives and resetting streak combo.
   */
  function applyIncorrectGuess(state: GameState): GameState {
    return {
      ...state,
      lives: Math.max(0, state.lives - 1),
      streak: 0,
      comboMultiplier: 1,
    }
  }

  return { createInitialState, evaluateGuess, applyCorrectGuess, applyIncorrectGuess }
}
