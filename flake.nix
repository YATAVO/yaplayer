{
  description = "A lightweight Rust & GTK4 music player with YouTube & Spotify streaming";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAll = f: nixpkgs.lib.genAttrs systems (s: f nixpkgs.legacyPackages.${s});
    in
    {
      packages = forAll (pkgs: rec {
        yaplayer = pkgs.rustPlatform.buildRustPackage {
          pname = "yaplayer";
          version = (pkgs.lib.importTOML ./Cargo.toml).package.version;
          src = ./.;
          cargoLock.lockFile = ./Cargo.lock;
          meta = {
            description = "A lightweight Rust & GTK4 music player with YouTube & Spotify streaming";
            homepage = "https://github.com/YATAVO/yaplayer";
            license = pkgs.lib.licenses.mit;
            platforms = pkgs.lib.platforms.linux;
            mainProgram = "yaplayer";
          };
          nativeBuildInputs = with pkgs; [
            pkg-config
            wrapGAppsHook4
          ];
          buildInputs = with pkgs; [
            glib
            gtk4
          ];
        };
        default = yaplayer;
      });

      apps = forAll (pkgs: {
        default = {
          type = "app";
          program = "${self.packages.${pkgs.stdenv.hostPlatform.system}.yaplayer}/bin/yaplayer";
        };
      });

      formatter = forAll (pkgs: pkgs.nixfmt-rfc-style);
    };
}
