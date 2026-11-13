/**
 * BallMetadata describes a single iconic sports ball in the No Ball catalog.
 * Each entry carries enough information to render a procedural 3D sphere
 * and to validate player guesses against name tournament or year.
 * primaryColor and secondaryColor drive the fragment shader palette.
 */
export interface BallMetadata {
  id: string
  name: string
  tournament: string
  year: number
  sport: "football" | "cricket" | "tennis" | "basketball" | "volleyball"
  difficulty: 1 | 2 | 3 | 4 | 5
  patternHash: string
  primaryColor: string
  secondaryColor: string
  unlockXP: number
}

/**
 * BallInstance represents a ball currently active in the game scene.
 * It extends metadata with transient runtime transform and spin data.
 */
export interface BallInstance extends BallMetadata {
  meshRotation: [number, number, number]
  trajectory: [number, number, number]
  spinRate: number
}
