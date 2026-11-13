/**
 * AudioEngine manages procedural sound effects using the Web Audio API.
 * No external audio files are required. All sounds are synthesized on demand.
 */
export class AudioEngine {
  private audioContext: AudioContext | null = null
  private isMuted: boolean = false

  constructor() {
    this.initializeAudioContext()
  }

  private initializeAudioContext(): void {
    if (typeof window === "undefined") {
      return
    }
    const AudioContextClass = window.AudioContext || window.webkitAudioContext
    if (AudioContextClass) {
      this.audioContext = new AudioContextClass()
    }
  }

  private ensureContextRunning(): void {
    if (!this.audioContext) {
      return
    }
    if (this.audioContext.state === "suspended") {
      this.audioContext.resume()
    }
  }

  mute(): void {
    this.isMuted = true
  }

  unmute(): void {
    this.isMuted = false
  }

  isMutedState(): boolean {
    return this.isMuted
  }

  /**
   * Plays a whoosh sound when a ball enters the screen.
   * Uses a rising sawtooth oscillator with rapid gain decay.
   */
  playWhoosh(): void {
    if (this.isMuted || !this.audioContext) {
      return
    }
    this.ensureContextRunning()
    const now = this.audioContext.currentTime
    const osc = this.audioContext.createOscillator()
    const gain = this.audioContext.createGain()

    osc.type = "sawtooth"
    osc.frequency.setValueAtTime(150, now)
    osc.frequency.exponentialRampToValueAtTime(800, now + 0.3)

    gain.gain.setValueAtTime(0.3, now)
    gain.gain.exponentialRampToValueAtTime(0.01, now + 0.3)

    osc.connect(gain)
    gain.connect(this.audioContext.destination)

    osc.start(now)
    osc.stop(now + 0.3)
  }

  /**
   * Plays a chime when a guess is correct.
   * Uses two sine oscillators in a consonant interval.
   */
  playChime(): void {
    if (this.isMuted || !this.audioContext) {
      return
    }
    this.ensureContextRunning()
    const now = this.audioContext.currentTime

    const osc1 = this.audioContext.createOscillator()
    const osc2 = this.audioContext.createOscillator()
    const gain = this.audioContext.createGain()

    osc1.type = "sine"
    osc2.type = "sine"
    osc1.frequency.setValueAtTime(440, now)
    osc2.frequency.setValueAtTime(554.37, now)

    gain.gain.setValueAtTime(0.2, now)
    gain.gain.exponentialRampToValueAtTime(0.01, now + 0.6)

    osc1.connect(gain)
    osc2.connect(gain)
    gain.connect(this.audioContext.destination)

    osc1.start(now)
    osc2.start(now)
    osc1.stop(now + 0.6)
    osc2.stop(now + 0.6)
  }

  /**
   * Plays a buzzer when a guess is incorrect.
   * Uses a square oscillator with abrupt decay.
   */
  playBuzzer(): void {
    if (this.isMuted || !this.audioContext) {
      return
    }
    this.ensureContextRunning()
    const now = this.audioContext.currentTime
    const osc = this.audioContext.createOscillator()
    const gain = this.audioContext.createGain()

    osc.type = "square"
    osc.frequency.setValueAtTime(110, now)

    gain.gain.setValueAtTime(0.2, now)
    gain.gain.linearRampToValueAtTime(0, now + 0.2)

    osc.connect(gain)
    gain.connect(this.audioContext.destination)

    osc.start(now)
    osc.stop(now + 0.2)
  }
}

export const audioEngine = new AudioEngine()
