#!/usr/bin/env bash

XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

CACHE_DIR="$XDG_CACHE_HOME/quickshell"
STATE_DIR="$XDG_STATE_HOME/quickshell"

SCSS_FILE="$STATE_DIR/user/generated/material_colors.scss"

colornames=''
colorstrings=''
colorlist=()
colorvalues=()

colornames=$( cut -d: -f1 "$SCSS_FILE"  | sed 's/^\$//')
colorstrings=$( cut -d: -f2 "$SCSS_FILE" | cut -d ' ' -f2 | cut -d ';' -f1)


IFS=$'\n'
colorlist=($colornames)
colorvalues=($colorstrings)

apply_base46() {
    local TEMPLATE="$HOME/.config/nvim/colors"
    local CACHE_FILE="$CACHE_DIR/materialyou.lua"
    local DEST="$HOME/.config/nvim/lua/themes/material-you.lua"

    [[ ! -f "$TEMPLATE" ]] && return

    mkdir -p "$CACHE_DIR"
    mkdir -p "$(dirname "$DEST")"

    cp "$TEMPLATE" "$CACHE_FILE"

    for i in "${!colorlist[@]}"; do
        sed -i "s|\${${colorlist[$i]}}|${colorvalues[$i]}|g" "$CACHE_FILE"
    done

    cp "$CACHE_FILE" "$DEST"
}


apply_base46

for addr in "$XDG_RUNTIME_DIR"/nvim.*; do
    [[ -S "$addr" ]] || continue

    nvim --server "$addr" \
        --remote-expr 'luaeval("require(\"nvchad.utils\").reload(\"themes\")")' \
        >/dev/null
done
