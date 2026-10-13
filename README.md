<div align="center">

<img src="./yaplayer.png" width="120" alt="YaPlayer Logo">

# 🎵 YaPlayer

**A lightweight, modern, and privacy-focused desktop music player built with Rust and GTK4.**  
*Seamlessly stream, download, and enjoy your favorite music with an integrated 10-band equalizer and custom desktop wallpapers.*

[![Rust](https://img.shields.io/badge/Language-Rust-orange?style=flat-square&logo=rust)](https://www.rust-lang.org/)
[![GTK4](https://img.shields.io/badge/Toolkit-GTK4-blue?style=flat-square&logo=gtk)](https://www.gtk.org/)
[![Arch Linux](https://img.shields.io/badge/OS-Arch%20Linux-1793D1?style=flat-square&logo=arch-linux)](https://archlinux.org/)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)


<div>
<img src="./photo1.jpg" width="500" alt="YaPlayer Logo">
<img src="./photo2.jpg" width="500" alt="YaPlayer Logo">
</div>


</div>

---

## ✨ Features

- **🔍 Unified Search:** Search and stream music instantly from **YouTube** and **Spotify**, or play your local library.
- **📂 Local Folder Integration:** Always includes your local `~/Music/yaplayer` tracks in search results.
- **🌌 Custom Wallpapers:** Dynamic background support via GTK4 CSS styling that brings your desktop aesthetics (Hyprland, GNOME, etc.) into the app.
- **🎛️ 10-Band Graphic Equalizer:** Fine-tune your audio frequencies in real-time powered by `mpv` audio filters (`-15dB` to `+15dB`).
- **⭐ Favorites & History:** Persistent JSON-based storage for your favorite tracks and listening history with platform badges.
- **📥 One-Click & Auto-Download:** Easily download streaming tracks as `.mp3` files with a single click or enable auto-download in settings.

---

## 🚀 Tech Stack

- **Core:** Rust
- **UI Framework:** GTK4 / Libadwaita styling principles
- **Playback Backend:** `mpv` (via IPC control socket)
- **Streaming/Downloader:** `yt-dlp`

---

## 📦 Installation (Arch Linux)

You can easily build and install **YaPlayer** on Arch Linux using the provided `PKGBUILD`.

### Prerequisites
Make sure you have base development tools, `cargo`, and required runtime dependencies installed:
```bash
sudo pacman -S --needed base-devel cargo gtk4 mpv yt-dlp curl
```

### Building & Installing from Source
1. **Clone the repository:**
   ```bash
   git clone https://github.com/YATAVO/yaplayer.git
   cd yaplayer
   ```

2. **Create the source tarball for the package builder:**
   ```bash
   tar --exclude='target' --exclude='.git' -czf yaplayer-0.1.0.tar.gz .
   ```

3. **Build and install the Arch package:**
   ```bash
   makepkg -si
   ```

#### Nix/NixOS
For Nix/NixOS, you can install it using the following methods:
1. Quick start via `nix run`
```bash
nix run github:YATAVO/yaplayer
```
2. Installation via flakes
```nix
yaplayer = {
  url = "github:YATAVO/yaplayer";
  inputs.nixpkgs.follow = "nixpkgs";
};
```
Requirement: `nix.settings.experimental-features = [ "nix-command" "flakes" ];`

*(The `makepkg -si` command will automatically compile the release binary, package it alongside the desktop entry and documentation, and install it via `pacman`)*.

---

## 🎛️ Usage

Once installed, you can launch **YaPlayer** from your system's application menu or directly from the terminal:
```bash
yaplayer
```

- **Search:** Choose your platform (`YouTube` or `Spotify`) from the dropdown next to the search bar, type your query, and press `Enter`.
- **Settings:** Click the system gear icon in the top-left corner to configure custom wallpapers, path, and auto-download options.
- **Equalizer:** Click the `EQ` button to adjust the 10 frequency bands (`31Hz` to `16kHz`).

---

## 🛠️ Configuration & Storage

YaPlayer stores its local database, settings, and downloaded tracks in:
```text
~/Music/yaplayer/
├── settings.json       # App configuration & equalizer bands
├── favorites.json      # Local & streaming favorites list
└── *.mp3               # Downloaded audio files
```

---

## 👨‍💻 Author

Made with ❤️ by **[YATAVO](https://github.com/YATAVO)**

---

## 📜 License

This project is open-source and available under the [MIT License](LICENSE).
