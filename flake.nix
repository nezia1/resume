{
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    eachSystem = f: nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (system: f nixpkgs.legacyPackages.${system});
    mkDate = longDate:
      with builtins; (concatStringsSep "-" [
        (substring 0 4 longDate)
        (substring 4 2 longDate)
        (substring 6 2 longDate)
      ]);
    version = mkDate (self.lastModifiedDate or "19700101");
    src = self;
  in {
    devShells = eachSystem (pkgs: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          typst
          typst-fmt
          typst-lsp
        ];
        shellHook = let
          fonts = pkgs.lib.makeSearchPath "" [
            pkgs.source-sans-pro
            pkgs.nerd-fonts.symbols-only
          ];
        in ''
          export TYPST_FONT_PATHS=${fonts}
        '';
        name = "Resume";
      };
    });

    packages = eachSystem (pkgs: {
      english = pkgs.callPackage ./package.nix {
        inherit version src;
      };
      french = self.packages.${pkgs.system}.english.override {lang = "fr";};
      default = self.packages.${pkgs.system}.english;
    });
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
}
