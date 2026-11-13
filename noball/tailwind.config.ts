/**
 * Tailwind configuration for No Ball.
 * Defines custom broadcast sports analytics color palette.
 * No hyphens in custom class names; utility classes use standard Tailwind syntax.
 */
import type { Config } from "tailwindcss"

const config: Config = {
  content: [
    "./app/**/*.{js,ts,jsx,tsx}",
    "./components/**/*.{js,ts,jsx,tsx}",
    "./hooks/**/*.{js,ts,jsx,tsx}",
    "./lib/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        bgDark: "#0a0a0f",
        bgSurface: "#14141e",
        textPrimary: "#ffffff",
        textSecondary: "#94a3b8",
        accent: "#3b82f6",
        accentGlow: "rgba(59, 130, 246, 0.4)",
        success: "#22c55e",
        warning: "#f59e0b",
        error: "#ef4444",
      },
      fontFamily: {
        sans: ["Inter", "system-ui", "sans-serif"],
        mono: ["JetBrains Mono", "monospace"],
      },
    },
  },
  plugins: [],
}

export default config
