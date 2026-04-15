# PalpatineGHG's Tweak Mod

This is my first Factorio mod, in which i add some utility and tweak features that i find might be cool. The mod is still in development, so expect some bugs and missing features.

## Features

- Change the stack size for all stackable items to a user defined value via Mod Settings.
- A button in the top left corner of the screen that opens a GUI with a Cheat Menu
- The Cheat Menu allows you to be invincible, free crafting, a speed hack (only running speed), and a Day/Night toggle.

## Installation

### Via Mod Portal
1. Go to the [Factorio Mod Portal](https://mods.factorio.com/).
2. Search for "PalpatineGHG's Tweak Mod".
3. Click on the mod and then click the "Download" button.

### Manual Installation
1. Copy this repository to your local machine.
2. Open a terminal in the root directory of the mod and run `python make.py` to create the zip file.
3. Move the generated zip file to your Factorio mods directory, which is usually located at
    - Windows: `%APPDATA%\Factorio\mods`
    - Linux: `~/.factorio/mods`
    - macOS: `~/Library/Application Support/factorio/mods`

## Important Notes

- This mod is still in development, so expect some bugs and missing features.
- If the manual installation method is used, make sure to delete the old zip file before creating a new one to avoid confusion.
- Always back up your save files before using mods, especially ones that are still in development.
- If make.py doesn't work, you can either use `python3 make.py` or you can manually create a zip file of the mod folder and name it `palpatineghgs-tweak-mod_version.zip` before moving it to the mods directory. (If you do this rename the src folder to tweak-mod and the zip file to palpatineghgs-tweak-mod_version.zip, where version is the version number in info.json)

## Contributing
If you want to contribute to this mod, feel free to fork the repository and create a pull request with your changes. I will review the changes and merge them if they are good.

## License
This mod is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.