# Unity MCP on macOS

Verified 2026-10-04 with Unity 6000.6.4f1 (Apple Silicon) and the IronFall
project in `projects/ironfall/unity/IronFall`.

## Setup that works

- Unity's official MCP server ships in the `com.unity.ai.assistant` package
  (pre-release only; 2.20.0-pre.1 used). Add it to `Packages/manifest.json`.
  On first compile it installs the relay to
  `~/.unity/relay/relay_mac_arm64.app/`.
- `.mcp.json` entry `unity-mcp` runs
  `${HOME}/.unity/relay/relay_mac_arm64.app/Contents/MacOS/relay_mac_arm64 --mcp --name "IronFall Unity"`.
  It connects to the first open Unity editor. If several editors are open, add
  `--project-path <absolute project path>` in a local-scope entry
  (`claude mcp add --scope local`) rather than in the shared file. Intel Macs
  use `relay_mac_x64`.
- The bridge only exists while the editor is open with the project. The relay
  then listens on 9001 (editor) and 9002 (MCP clients).
- Claude Code reads `.mcp.json` at session start, so a new chat is needed for
  the tools to appear natively.

## Gotchas

- **First launch of a new editor version blocks on a Software Terms dialog.**
  The log stops after licensing and the editor sits at 100% CPU. Only the user
  can accept it. `sample <pid>` shows
  `SoftwareTermsWindow::EnsureTheUserHasAcceptedSoftwareTerms`.
- After launch, the GUI log moves to the project's `Logs/Editor.log`, not
  `~/Library/Logs/Unity/Editor.log`.
- The relay runs under bun (`bun /$bunfs/root/relay_mac_arm64 --relay`).
  Detect it from `Logs/Editor.log` (`Unity MCP Relay server started`), not by
  matching the `.unity/relay` path. `pgrep -f "...--relay"` also matches the
  shell running the check itself.
- macOS has no `timeout` command. Use a bounded loop instead.
- A console warning, "Account API did not become accessible within 30
  seconds", appeared. It did not affect `Unity_RunCommand` or
  `Unity_GetConsoleLogs`. The `Unity_AssetGeneration_*` tools depend on Unity
  AI account access and are untested.

## Tools exposed (7)

`Unity_RunCommand` (compile and run C# in the editor),
`Unity_GetConsoleLogs`, `Unity_Camera_Capture`,
`Unity_SceneView_CaptureMultiAngleSceneView`,
`Unity_SceneView_Capture2DScene`, `Unity_AssetGeneration_GenerateAsset`,
`Unity_AssetGeneration_GetModels`.

`Unity_RunCommand` scripts must be `internal class CommandScript : IRunCommand`
with `Execute(ExecutionResult result)`. Call `result.RegisterObjectCreation` or
`RegisterObjectModification` for undo, and use `result.Log` for output.

## Verification used

A stdio probe (initialize → tools/list → tools/call) ran one read-only
`Unity_RunCommand`, which reported the version, active render pipeline and
scene roots, and one `Unity_GetConsoleLogs` call.
