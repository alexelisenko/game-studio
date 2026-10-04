# Blender MCP on macOS

Verified 2026-10-04 with Blender 5.2.2 LTS (Apple Silicon) and the official
Blender Lab MCP.

## Setup that works

- Blender add-on: in Preferences → System, enable **Allow Online Access**. Add
  the remote extensions repository `https://lab.blender.org/`, then install and
  enable **MCP** (requires Blender 5.1+). In the add-on preferences, click
  **Start Server**. It listens on `127.0.0.1:9876`.
- MCP server: `uv tool install --python 3.12 "blender-mcp @ git+https://projects.blender.org/lab/blender_mcp.git@dbbf836ad4b1025f14a2b3b504c43903f39e0b04#subdirectory=mcp"`
  installs `~/.local/bin/blender-mcp`. `uv` came from Homebrew. No host or port
  environment variables are needed; both sides default to localhost:9876.
- `.mcp.json` entry `blender` runs `${HOME}/.local/bin/blender-mcp`. Claude
  Code expands `${HOME}`, loads the server in a new chat, and asks once to
  approve it.
- `projects.blender.org` returns 403 to web fetchers, but `git clone` works
  for reading the source.

## Safety

`execute_blender_code` runs arbitrary Python in Blender with no guards.
Blender's documentation warns about this. Keep the add-on's auto-start off,
start the server only for a Blender task, and save work before letting an
agent edit a file.

## Tools exposed (26)

These cover file and scene summaries, object detail, missing files, linked
libraries, Python execution (live or in a background `--background` process),
window and area screenshots, viewport and thumbnail renders, navigation helpers,
and search over the bundled API docs and user manual.

## Verification used

A stdio probe called `get_objects_summary`, `get_blendfile_summary_datablocks`
and a read-only `execute_blender_code`. That code reported the version, the
metric unit scale and that the FBX and glTF import/export operators are
available.
