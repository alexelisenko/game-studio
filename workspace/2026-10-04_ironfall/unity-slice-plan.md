# IronFall · Unity slice plan

**Outcome:** a small playable Unity level on this Mac (M4 Pro, 48 GB) that
proves the full game can be built at small scale, with Claude Code driving the
Unity editor through Unity's official MCP server.

**Scope (one of each):** one commando with one weapon (the spread gun) and its
effects; one small jungle-outpost map; one prop, one building, one interactive
element (an explosive barrel), one destructible element (a sandbag wall); one
enemy (the crawler); one power-up (the weapon capsule).

**Look target:** round 2 mockup B and round 3's outpost stage. High overhead
camera at about 65°, rain, wet mud, fire light, and red and blue hero ground
rings.

## Current state (updated 2026-10-04)

- **Stage 0 is done.** The Unity 6.6 (6000.6.4f1) URP project is at
  `projects/ironfall/unity/IronFall` with a Personal license.
- The official Unity MCP (`unity-mcp`) and Blender Lab MCP (`blender`) are in
  `.mcp.json`. Both were verified with read-only calls. Setup notes are in
  `knowledge/unity-mcp.md` and `knowledge/blender-mcp.md`.
- Blender 5.2.2 LTS is available for cleanup and rigging, and its FBX and glTF
  export work.
- Unity 6.6 is not LTS. Upgrade to 6.7 LTS when it ships.
- Concept references exist for every slice item. See rounds 2 and 3.
- **Next:** stage 1, graybox gameplay, in a new chat so the MCP tools load
  natively.

## Stages

### 0 · Setup

You do three parts: sign in, license, and approve the MCP connection.

1. Install Unity Hub (`brew install --cask unity-hub`). This happens only with
   your OK, because it's a system-wide app install.
2. **You:** sign in to Hub with a Unity ID and activate a free Personal
   license.
3. Install the current Unity 6 LTS editor (Apple Silicon) from Hub.
4. Create a **Universal 3D (URP)** project in `projects/ironfall/unity/`, and
   add Unity's standard `.gitignore` (Library, Temp, Logs and UserSettings stay
   out of Git).
5. Add the `com.unity.ai.assistant` package. Under **Project Settings → AI →
   Unity MCP Server**, confirm the bridge shows *Running*. Then add the relay
   (`~/.unity/relay/relay_mac_arm64.app/.../relay_mac_arm64 --mcp`) to this
   project's `.mcp.json`. **You:** approve the first connection in Unity.
6. Optional: install Unity's official Claude Code plugin (Unity's engineering
   skills).

**Check:** `claude mcp list` shows the Unity server connected, and an agent
can read the scene hierarchy and console. Still to confirm during setup: whether
the AI Assistant package needs a Unity AI plan for MCP use. If it does, the
fallback is the free community *MCP for Unity* (CoplayDev), which needs `uv`.

### 1 · Graybox gameplay (no art)

Simple shapes only, to prove the systems:

- Camera rig and twin-stick controls (WASD + mouse aim; gamepad optional).
- Commando with health and the colored ground ring.
- Spread gun with pooled projectiles, damage and hit feedback.
- Crawler: NavMesh chase, melee attack, hit flash, death.
- Explosive barrel: radius damage, physics push, chain reaction.
- Sandbag wall: pre-broken pieces that scatter when shot.
- Weapon capsule: floats, is shot open, and changes the weapon.
- Minimal HUD (health, weapon) and restart on death.

**Check:** every interaction works in Play mode, and a short capture is saved
in this card.

### 2 · Art pass

- **Hero:** a strict front/side/back sheet (character-sheet skill), then
  image-to-3D with auto-rig, then idle, run, shoot and death animations.
- **Crawler:** a locked model sheet, then image-to-3D, then rig, then
  animations.
- **Props:** barrel, sandbag pieces, a hut (the building), capsule, spread gun,
  and wet-mud ground material.
- **Source:** Higgsfield 3D jobs are about 9–15 credits per model (Tripo
  about 9, Hunyuan about 15; Meshy's price is checked before use). That's
  roughly 80–120 credits for the slice. Each batch's price is shown for
  approval first, and free Asset Store packs are an option for generic props.

**Check:** assets import at the correct scale with working materials, and the
animations play without foot sliding.

### 3 · Look pass

- URP lighting and post-processing: bloom, color grade, fire point lights and
  rain particles.
- A wet-surface shader, plus height fog and smoke cards. URP has no built-in
  volumetric fog, so it's approximated.
- Effects: spread-gun muzzle, bolts and impacts, barrel explosion, crawler
  death, capsule pickup.

**Check:** a side-by-side capture against mockup B, and a measured frame rate
on this Mac. The target is a steady 60 fps at native resolution.

### 4 · Review and decision

A visual review with captures and a written list of what was easy, what was
hard, and what it cost. **Decision:** commit to Unity for the full game, or
change course.

## Optional extensions

- Second player (local co-op).
- Sound: weapon, impacts, crawler and ambience.
- A standalone Mac build.

## Not in this slice

More weapons, enemies or stages; the boss; menus; saving.
