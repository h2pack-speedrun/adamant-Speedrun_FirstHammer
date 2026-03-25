# First Hammer Selection

> Select the guaranteed first Daedalus Hammer you find for each of the 24 aspects.

## Features

- **Guaranteed Hammer:** Force the first Hammer reward you encounter to be a specific upgrade of your choosing.
- **Per-Aspect Configuration:** Set a different guaranteed Hammer for every aspect in the game.
- **Quick Select UI:** Quickly set the Hammer for your currently equipped aspect.

## Installation

Install via [r2modman](https://hades2.thunderstore.io/) or manually by placing the mod folder in your `Hades II/plugins` directory.

## Configuration

This mod is configured through the **Adamant Core** settings menu (`F10` by default).

1.  **Enable Mod:** Go to the "Run Modifiers" tab and check "First Hammer Selection".
2.  **Open Config:** A new **"Hammers"** tab will appear at the top.
3.  **Set Hammers:** In this new tab, you can expand each weapon to see its aspects and use the dropdowns to select your desired first Hammer. Set to "None (Random)" to restore default behavior.

## Development

This module is part of the [H2 Modular Modpack](https://github.com/h2-modpack/h2-modular-modpack). Please read the main project documentation for information on architecture and conventions.

- **[Project README](https://github.com/h2-modpack/h2-modular-modpack/blob/main/README.md)**: For local setup and prerequisites.
- **[Core CONTRIBUTING.md](https://github.com/h2-modpack/h2-modpack-coordinator/blob/main/CONTRIBUTING.md)**: For architecture, discovery system, and UI.
- **[Lib CONTRIBUTING.md](https://github.com/h2-modpack/adamant-modpack-Lib/blob/main/CONTRIBUTING.md)**: For the public API reference, module contract, and shared utilities.

### Local Setup

1.  Clone this repo.
2.  Run `Setup/init_repo.bat` (Windows) or `Setup/init_repo.sh` (Linux) to configure git hooks.
3.  Run `Setup/deploy_local.bat` (Windows, as admin) or `Setup/deploy_local.sh` (Linux) to copy assets, generate the manifest, and create a symlink to your r2modman profile.
