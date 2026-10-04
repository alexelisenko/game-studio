# IronFall

A modern 3D spin on the classic two-commando run-and-gun, played from a high
third-person overhead camera.

## Pillars

- Many distinct weapons, with power-ups that change how you play.
- A wide range of enemies, from swarm units to bosses.
- Dynamic maps with interactive and destructible elements.

## Art direction

**Gritty Commando, high-fidelity real-time** (chosen 2026-10-04, after round 2):
semi-realistic 1980s action-movie war against an alien biomechanical hive. PBR
materials, rain and wet surfaces, fire light, smoke and fog.

- Camera: high overhead view, pitched about 65 degrees down, with no sky or
  horizon.
- Color language: the heroes wear red and blue bandanas and have matching
  ground rings. Player fire is orange, blue or white; enemy fire is acid green;
  alien weak points are amber. Keep red off enemies and power-ups, and keep
  acid green out of the scenery.

## Content (candidate list, round 3)

- **Weapons (8):** spread gun, laser rifle, flamethrower, homing missiles, rail
  gun, shotgun, grenade launcher, minigun.
- **Power-ups (6):** weapon upgrade (orange), shield (cyan), speed (yellow),
  drone buddy (white), airstrike (red, recolor candidate), health (green).
  They share one capsule body with variants.
- **Boss:** a colossal alien fused into a captured dam gate, with weak points in
  its core and cannon pods.
- **Stages (4):** jungle outpost, infested city ruins, dam and waterfall, hive
  interior.

## Alien faction

Bone-white armor plates, bruise-purple flesh, glowing amber veins and weak
points, and purple fungal creep. Never insectoid humanoids or elongated heads.
Designs drift between generated images, so lock each enemy with a model sheet
before production.

- **Crawler:** knee-high, six-legged and tick-like, with an amber blister. A
  swarm unit.
- **Elite crawler:** heavier armor. Its glow needs a non-red color.
- **Spitter:** a rooted fleshy mortar bulb that lobs acid globs.
- **Brute:** a hulking quadruped with a bone shell and an amber weak point on
  its back.
- **Flyer:** a manta-like glowing membrane creature that drops spore pods.
- **Hive spire:** grows from a captured bunker. Spawns enemies and spreads
  creep.
- **Infected soldier:** a human soldier overgrown with alien flesh.
- **Turret growth:** a fleshy pod fused into a sandbag gun nest.
- **Shield carrier:** a hunched biped behind a bone shield. Flank it.
- **Burrower:** an armored worm that bursts from the ground.

## Engine

Leaning **Unity 6 (URP)**, to be proven with a small vertical slice. Unreal is
ruled out for this Mac laptop (M4 Pro, 48 GB). The plan is in the card's
[Unity slice plan](../../workspace/2026-10-04_ironfall/unity-slice-plan.md).

- Unity project: `unity/IronFall` (Unity 6000.6.4f1, URP). Open it from Unity
  Hub or with the editor's `-projectPath`.
- Agents control Unity through the official Unity MCP (`unity-mcp`) and Blender
  through the Blender Lab MCP (`blender`). See `knowledge/unity-mcp.md` and
  `knowledge/blender-mcp.md`.

## Resume on another Mac

1. Install Git LFS (`brew install git-lfs`), then clone. Full-size concept PNGs
   and game binaries are stored in LFS. Without it, the WebP previews still
   work. To fetch the PNGs after the fact, run `git lfs install --local` and
   then `git lfs pull`.
2. Install Unity Hub and editor **6000.6.4f1**, then open
   `projects/ironfall/unity/IronFall`. `Library/` rebuilds on first open, and
   the AI Assistant package installs the MCP relay. Accept Unity's Software
   Terms on first launch.
3. Install Blender 5.1+ and its MCP add-on. Install `uv` and `blender-mcp` as
   described in `knowledge/blender-mcp.md`.
4. Install and sign in to the Higgsfield CLI (`brew install higgsfield-ai/tap/higgsfield`,
   then `higgsfield auth login`). Job receipts (`job.json`, `result.json`) are not
   in Git; job IDs are in the Workspace card.
5. Start a new Claude Code chat in the repo and approve the `unity-mcp` and
   `blender` servers from `.mcp.json`.

## Records

- Workspace card: [IronFall](../../workspace/2026-10-04_ironfall/report_v3.html)
- Concept round 1 (2026-10-04): 2 images on Nano Banana Pro via Higgsfield,
  about 4 credits.
- Concept round 2 (2026-10-04): 3 images, 6 credits observed. Stylized vs
  high-fidelity gameplay, and the first alien lineup.
- Concept round 3 (2026-10-04): 10 images, 20 credits observed. Weapons, fire
  patterns, power-ups, second enemy lineup, boss, hero sheet, four stages.
- Prompts and job IDs for every round are saved in the card.
