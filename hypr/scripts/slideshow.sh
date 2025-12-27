#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"
INTERVAL="20m"
WALLPAPER_SCRIPT="${XDG_CONFIG_HOME:-$HOME/.config}/quickshell/ii/scripts/colors/switchwall.sh"

[[ -x "$WALLPAPER_SCRIPT" ]] || {
  echo "Wallpaper script not executable: $WALLPAPER_SCRIPT" >&2
  exit 1
}

while true; do
  mapfile -t FILES < <(
    find "$WALLPAPER_DIR" -type f \( \
      -iname '*.jpg'  -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \
      -o -iname '*.gif' \
      -o -iname '*.mp4' -o -iname '*.mkv' -o -iname '*.webm' \
    \) | shuf
  )

  (( ${#FILES[@]} )) || {
    sleep "$INTERVAL"
    continue
  }

  for file in "${FILES[@]}"; do
      "$WALLPAPER_SCRIPT" "$file" >> /tmp/WallpaperLog.txt
      notify-send --app-name="Hyprland" --icon=preferences-desktop-wallpaper "Wallpaper changed" "Wallpaper changed to $file. Logs are available at /tmp/WallpaperLog.txt"
      sleep "$INTERVAL"
  done

done
