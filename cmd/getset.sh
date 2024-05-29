#! /usr/bin/env nix-shell
#! nix-shell -i dash --pure --keep LD_LIBRARY_PATH -I channel:nixos-23.11-small -p dash coreutils

key="$1"
getset="${2:-}"
value="${5:-}"

FILE="${HOMEKIT_SH_CACHE_DIR:-$HOME/.cache/homekit.sh}/$key"

if [ ! -f "$FILE" ]; then
  touch "$FILE"
fi

if [ "$getset" = "Set" ]; then
  echo "$value" > "$FILE"
else
  cat "$FILE"
fi
