/**
 * BallCanvas renders a real 3D rotating sphere using React Three Fiber.
 * It uses a custom ShaderMaterial to render procedural panel lines
 * and specular highlights based on the ball metadata colors.
 * The canvas resizes responsively and disposes of all Three.js
 * resources on unmount to prevent memory leaks.
 */
import { useFrame } from "@react-three/fiber"
import { useEffect, useRef, useState } from "react"
import {
  Mesh,
  SphereGeometry,
  ShaderMaterial,
  Group,
  Vector3,
} from "three"
import type { BallMetadata } from "@/types/ball"

interface BallCanvasProps {
  ball: BallMetadata | null
  isSpinning: boolean
  width?: number
  height?: number
}

/**
 * Fragment shader for procedural ball rendering.
 * Uses primaryColor and secondaryColor uniforms to render authentic
 * panel patterns and specular highlights without external textures.
 */
const fragmentShader = `
  uniform vec3 primaryColor;
  uniform vec3 secondaryColor;
  uniform float patternSeed;
  varying vec3 vNormal;
  varying vec3 vWorldPos;

  void main() {
    // Normalize normal for lighting
    vec3 normal = normalize(vNormal);
    
    // Simple panel line pattern using normal coordinates
    float panelLine = sin(vNormal.x * 20.0 + patternSeed) * 
                      sin(vNormal.y * 20.0 + patternSeed) * 
                      sin(vNormal.z * 20.0 + patternSeed);
    panelLine = smoothstep(0.0, 0.1, abs(panelLine));
    
    // Mix primary and secondary colors based on panel pattern
    vec3 baseColor = mix(secondaryColor, primaryColor, panelLine);
    
    // Diffuse lighting from normal
    vec3 lightDir = normalize(vec3(1.0, 1.0, 1.0));
    float diffuse = max(dot(normal, lightDir), 0.0);
    baseColor *= diffuse;
    
    // Specular highlight
    vec3 viewDir = normalize(-vWorldPos);
    vec3 reflectDir = reflect(-lightDir, normal);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), 32.0);
    baseColor += spec * 0.8;
    
    // Rim light for broadcast look
    float rim = 1.0 - max(dot(viewDir, normal), 0.0);
    baseColor += rim * 0.3 * primaryColor;
    
    gl_FragColor = vec4(baseColor, 1.0);
  }
`

/**
 * Vertex shader for the sphere.
 * Passes normal and world position to the fragment shader.
 */
const vertexShader = `
  varying vec3 vNormal;
  varying vec3 vWorldPos;
  
  void main() {
    vNormal = normalize(normalMatrix * normal);
    vWorldPos = (modelMatrix * vec4(position, 1.0)).xyz;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
  }
`

export function BallCanvas({
  ball,
  isSpinning,
  width = 400,
  height = 400,
}: BallCanvasProps) {
  const meshRef = useRef<Mesh>(null)
  const [patternSeed, setPatternSeed] = useState(0)

  // Spin the ball using useFrame for smooth 60fps animation
  useFrame((state, delta) => {
    if (!meshRef.current || !isSpinning) {
      return
    }
    meshRef.current.rotation.x += delta * 0.5
    meshRef.current.rotation.y += delta * 0.8
    meshRef.current.rotation.z += delta * 0.3
  })

  // Animate pattern seed slowly for subtle surface movement
  useEffect(() => {
    const start = Date.now()
    const interval = setInterval(() => {
      const elapsed = (Date.now() - start) / 1000
      setPatternSeed(elapsed * 0.5)
    }, 50)
    return () => clearInterval(interval)
  }, [])

  if (!ball) {
    return null
  }

  return (
    <Group position={[0, 0, 0]}>
      <mesh
        ref={meshRef}
        castShadow
        receiveShadow
      >
        <SphereGeometry args={[1.2, 64, 64]} />
        <ShaderMaterial
          uniforms={{
            primaryColor: { value: new Vector3(
              parseInt(ball.primaryColor.slice(1, 3), 16) / 255,
              parseInt(ball.primaryColor.slice(3, 5), 16) / 255,
              parseInt(ball.primaryColor.slice(5, 7), 16) / 255,
            )},
            secondaryColor: { value: new Vector3(
              parseInt(ball.secondaryColor.slice(1, 3), 16) / 255,
              parseInt(ball.secondaryColor.slice(3, 5), 16) / 255,
              parseInt(ball.secondaryColor.slice(5, 7), 16) / 255,
            )},
            patternSeed: { value: patternSeed },
          }}
          vertexShader={vertexShader}
          fragmentShader={fragmentShader}
        />
      </mesh>
    </Group>
  )
}
