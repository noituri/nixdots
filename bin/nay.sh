#!/usr/bin/env bash

show_help() {
  echo "Usage:"
  echo "  $0 init"
  echo "  $0 switch [--only-system | --full]"
  echo "  $0 update [--only-system | --full]"
}

handle_init() {
  echo "init"
  # TODO:
  # fail if profile.nix exists
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
    init
    ;;
  switch)
    switch_cmd "$2"
    ;;
  update)
    update_cmd "$2"
    ;;
  *)
    echo "Unknown command: $1"
    show_help
    exit 1
    ;;
esac
