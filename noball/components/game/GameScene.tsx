/**
 * GameScene is the React Three Fiber scene wrapper.
 * It configures the camera, lighting, and shadow map for broadcast sports rendering.
 * All Three.js resources are disposed automatically by React Three Fiber on unmount.
 */
import { PerspectiveCamera, PointLight, AmbientLight, HemisphereLight } from "three"

export function GameScene() {
  return (
    <>
      <PerspectiveCamera position={[0, 0, 6]} makeDefault />
      <AmbientLight intensity={0.4} />
      <HemisphereLight intensity={0.3} position={[0, 1, 0]} />
      <PointLight
        position={[5, 5, 5]}
        intensity={1.2}
        color="#ffffff"
        castShadow
      />
      <pointLight
        position={[-5, 2, -3]}
        intensity={0.6}
        color="#3b82f6"
      />
    </>
  )
}
