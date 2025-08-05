#!/usr/bin/env bash

set -euo pipefail

NAY_CONFIG_DIR="$HOME/.config/nay"
PROFILE_LIST=()

if [ -f "$NAY_CONFIG_DIR/env" ]; then
  source "$NAY_CONFIG_DIR/env"
  set +u
  for d in "$DOT_FILES_PATH/profiles"/*/; do
    [[ -d "$d" ]] || continue

    profile_name="$(basename "$d")"
    [[ "$profile_name" != "common" ]] || continue
    PROFILE_LIST+=("$profile_name")
  done
  set -u
else
  if [ "$1" != "init" ]; then
    echo "Nay is not initialized. Please run 'nay init <profile>' first."
    exit 1
  fi

  for d in "$(pwd)/profiles"/*/; do
    [[ -d "$d" ]] || continue

    profile_name="$(basename "$d")"
    [[ "$profile_name" != "common" ]] || continue
    PROFILE_LIST+=("$profile_name")
  done
fi

PROFILE_NAMES=$(IFS='|' ; (echo "${PROFILE_LIST[*]}") | sed 's/|/ | /g')

show_help() {
  echo "Usage:"
  echo "  nay init <profile: $PROFILE_NAMES>     Initialize nay with the specified profile"
  echo "  nay switch [--only-system | --full]    Switch to the configured profile"
  echo "  nay update [--only-system | --full]    Update the configuration"
  echo "  nay edit                               Edit the dotfiles in the configured editor"
  echo "  nay clean                              Cleans unreachable store objects"
}

switch_system() {
  set +u
  sudo nixos-rebuild switch --flake "$DOT_FILES_PATH#$NAY_PROFILE"
  set -u
}

switch_home() {
  set +u
  home-manager switch --flake "$DOT_FILES_PATH#$NAY_PROFILE"
  set -u
}

handle_init() {
  found=false
  for p in "${PROFILE_LIST[@]}"; do
    if [[ "$p" == "$1" ]]; then
        found=true
        break
    fi
  done

  if ! $found; then
      echo "Invalid profile: $1. Available profiles are: $PROFILE_NAMES"
      show_help
      exit 1
  fi

  NAY_PROFILE="$1"

  set +u
  if [ -n "$DOT_FILES_PATH" ]; then
      echo "nay already initialized with DOT_FILES_PATH: $DOT_FILES_PATH and NAY_PROFILE: $NAY_PROFILE"
      exit 1
  fi
  set -u

  DOT_FILES_PATH="$(dirname "$(dirname "$0")")"
  echo "Initializing nay with profile: $NAY_PROFILE"
  echo "Setting DOT_FILES_PATH to $DOT_FILES_PATH"
  mkdir -p "$NAY_CONFIG_DIR"

  echo "export DOT_FILES_PATH=\"$DOT_FILES_PATH\"
export NAY_PROFILE=\"$NAY_PROFILE\"
" > "$NAY_CONFIG_DIR/env"

  echo "Installing standalone home-manager"
  nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install

  echo "Building and switching to the new configuration"
  switch_system
  switch_home

  echo "Done"
}

handle_switch() {
  case "$1" in
    "")
      switch_home
      ;;
    --only-system)
      switch_system
      ;;
    --full)
      switch_system
      switch_home
      ;;
    *)
      echo "Invalid option for switch: $1"
      show_help
      exit 1
      ;;
  esac
}

handle_update() {
  set +u
  nix flake update --flake "$DOT_FILES_PATH"
  set -u
}

handle_edit() {
    cd "$DOT_FILES_PATH" || exit 1
    if [ -n "$EDITOR" ]; then
        $EDITOR .
        git add -A
        cd - || exit 1
    else
        echo "No editor set. Please set the EDITOR environment variable."
        cd - || exit 1
        exit 1
    fi
}

handle_clean() {
  nix-collect-garbage
}

set +u
case "$1" in
  init)
    handle_init "$2"
    ;;
  switch)
    handle_switch "$2"
    ;;
  update)
    handle_update "$2"
    ;;
  edit)
    handle_edit
    ;;
  clean)
    handle_clean
    ;;
  *)
    echo "Unknown command: $1"
    show_help
    exit 1
    ;;
esac
set -u
