# Detstvo
Hit everything you see with a stick. Just like when you were a kid.

Made by Senya Pugach & Sava Pugach in two days in April 2025.

![](https://raw.githubusercontent.com/upisfree/ld57/refs/heads/master/textures/preview.png)

### Play
[in browser](http://upisfr.ee/game/ld57/) or download for [Windows](https://github.com/upisfree/ld57/releases/download/v1.0.0/Windows.zip), [macOS](https://github.com/upisfree/ld57/releases/download/v1.0.0/macOS.zip).

[Ludum Dare entry is here](https://ldjam.com/events/ludum-dare/57/detstvo).

### How to adapt game for web
If you try to build game for web, you will find that everything is very bright and sometimes you don't click on objects. To fix this, do this:
1. Change renderer to Compatibility
2. Adapt Env glow intensity and glow bloom
3. Adapt directional light intensity
4. Move RayCast3D ray slightly to left

### How to build
There's `mdl.glb` in Release page that you need to download and put into `mdl/` folder to build a game.