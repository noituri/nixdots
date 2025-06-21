#!/usr/bin/env bash

set -euo pipefail

NAY_CONFIG_DIR="$HOME/.config/nay"

if [ -f "$NAY_CONFIG_DIR/env" ]; then
  source "$NAY_CONFIG_DIR/env"
else
  if [ "$1" != "init" ]; then
    echo "Nay is not initialized. Please run 'nay init <profile>' first."
    exit 1
  fi
fi

show_help() {
  echo "Usage:"
  echo "  nay init <profile: personal | vm>"
  echo "  nay switch [--only-system | --full]"
  echo "  nay update [--only-system | --full]"
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
  case "$1" in
    personal)
      NAY_PROFILE="personal"
      ;;
    vm)
      NAY_PROFILE="vm"
      ;;
    *)
      echo "Invalid profile: $2"
      show_help
      exit 1
      ;;
  esac

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
  case "$1" in
    "")
      echo "Updating (default)..."
      ;;
    --only-system)
      echo "Updating (only system)..."
      ;;
    --full)
      echo "Updating (full)..."
      ;;
    *)
      echo "Invalid option for update: $1"
      show_help
      exit 1
      ;;
  esac
}

handle_edit() {
    cd "$DOT_FILES_PATH" || exit 1
    if [ -n "$EDITOR" ]; then
        $EDITOR .
    else
        echo "No editor set. Please set the EDITOR environment variable."
        exit 1
    fi
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
  *)
    echo "Unknown command: $1"
    show_help
    exit 1
    ;;
esac
set -u
