#!/usr/bin/env bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
CACHE_DIR="$XDG_CACHE_HOME/quickshell"
STATE_DIR="$XDG_STATE_HOME/quickshell"
SCSS_FILE="$STATE_DIR/user/generated/material_colors.scss"
TEMPLATE="$XDG_CONFIG_HOME/nvim/colors"
CACHE_FILE="$CACHE_DIR/illogical_impulse_nvchad.lua"
DEST_FILE="$XDG_CONFIG_HOME/nvim/lua/themes/illogical_impulse.lua"

[[ -f "$SCSS_FILE" ]] || {
    echo "Error: '$SCSS_FILE' not found."
    exit 1
}
[[ -f "$TEMPLATE" ]] || {
    echo "Error: '$TEMPLATE' not found."
    exit 1
}

mapfile -t colorlist < <( cut -d: -f1 "$SCSS_FILE" | sed 's/^\$//')
mapfile -t colorvalues < <( cut -d: -f2 "$SCSS_FILE" | awk '{print $1}' | tr -d ';')

mkdir -p "$CACHE_DIR"
mkdir -p "$(dirname "$DEST_FILE")"
cp "$TEMPLATE" "$CACHE_FILE"

for i in "${!colorlist[@]}"; do
    name="${colorlist[$i]}"
    value="${colorvalues[$i]}"
    sed -i "s|\${${name}}|${value}|g" "$CACHE_FILE"
    sed -i "s|${name} #|${value#\#}|g" "$CACHE_FILE"
done

cp "$CACHE_FILE" "$DEST_FILE"
pkill -SIGUSR1 nvim 2>/dev/null || true
