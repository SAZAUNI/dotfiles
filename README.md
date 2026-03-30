# Dotfiles

Personal configuration files for my development environment.

## What's Inside

This repository contains configuration files for various tools and applications I use daily. Each directory corresponds to a specific tool and follows the XDG Base Directory specification.

## Installation

Configurations are designed to be symlinked to `~/.config/`:

```bash
# Link individual configs
ln -s ~/dotfiles/<config-name> ~/.config/<config-name>

# Example
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/waybar ~/.config/waybar
```

## Environment

These configurations are tailored for:
- **OS:** Linux (Arch-based)
- **Display Server:** Wayland
- **Window Manager:** Hyprland/Sway

## Usage

Each configuration directory is self-contained and can be used independently. Explore individual directories for specific tool configurations.

## Notes

This is a personal setup that evolves over time. Feel free to browse and adapt anything useful for your own workflow.
