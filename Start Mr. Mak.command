#!/bin/zsh -l
# macOS launcher. Started from a login shell so chats inherit your full PATH
# (Homebrew, ~/.local/bin), which Finder- and Dock-launched apps do not get.
repo="${0:A:h}"
app="$HOME/Applications/Mr. Mak Workspace.app"
[[ -d "$app" ]] || app="/Applications/Mr. Mak Workspace.app"
if [[ ! -d "$app" ]]; then
  echo "Install Mr. Mak Workspace from this project's GitHub Releases (macOS .dmg)."
  exit 1
fi
open -n "$app" --args --repo "$repo"
