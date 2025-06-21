#!/usr/bin/env bash

show_help() {
  echo "Usage:"
  echo "  nay init <profile: personal | vm>"
  echo "  nay switch [--only-system | --full]"
  echo "  nay update [--only-system | --full]"
}

handle_init() {
  case "$1" in
    personal)
      NIX_PROFILE="personal"
      ;;
    vm)
      NIX_PROFILE="vm"
      ;;
    *)
      echo "Invalid profile: $2"
      show_help
      exit 1
      ;;
  esac

  if [ -n "$DOT_FILES_PATH" ]; then
      echo "nay already initialized in $DOT_FILES_PATH"
      exit 1
  fi

  DOT_FILES_PATH="$(dirname "$(dirname "$0")")"
  echo "Initializing nay with profile: $NIX_PROFILE"
  echo "Setting DOT_FILES_PATH to $DOT_FILES_PATH"
  echo "Writing nayConfig.nix to $DOT_FILES_PATH/nayConfig.nix"

  echo "{}:

let
  dotFilesPath = \"$DOT_FILES_PATH\";
  profile = \"$NIX_PROFILE\";
in
{
  inherit dotFilesPath profile;
}
" > "$DOT_FILES_PATH/nayConfig.nix"
  # TODO:
  # install home-manager
  # set profile
  # build the system
  # build home
}

handle_switch() {
  case "$1" in
    "")
      echo "Switching (default)..."
      ;;
    --only-system)
      echo "Switching (only system)..."
      ;;
    --full)
      echo "Switching (full)..."
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
