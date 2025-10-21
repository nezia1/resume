{
  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    forAllSystems = f: nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (system: f nixpkgs.legacyPackages.${system});
    mkDate = longDate:
      with builtins; (concatStringsSep "-" [
        (substring 0 4 longDate)
        (substring 4 2 longDate)
        (substring 6 2 longDate)
      ]);
    version = mkDate (self.lastModifiedDate or "19700101");
    src = self;
  in {
    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          typst
          tinymist
          typstyle
        ];
        shellHook = let
          fonts = pkgs.lib.makeSearchPath "" [
            pkgs.source-sans
            pkgs.source-sans-pro
            pkgs.roboto
            pkgs.font-awesome
          ];
        in ''
          export TYPST_FONT_PATHS=${fonts}
        '';
        name = "Resume";
      };
    });

    packages = forAllSystems (pkgs: {
      english = pkgs.callPackage ./package.nix {
        inherit version src;
      };
      french = self.packages.${pkgs.system}.english.override {lang = "fr";};
      default = self.packages.${pkgs.system}.english;
    });

    formatter = forAllSystems (pkgs:
      pkgs.treefmt.withConfig {
        settings = {
          tree-root-file = "flake.nix";
          formatter = {
            alejandra = {
              command = "alejandra";
              includes = ["*.nix"];
            };
            deadnix = {
              command = "deadnix";
              options = ["--edit" "--no-lambda-arg" "--no-lambda-pattern-names"];
              includes = ["*.nix"];
            };
            deno = {
              command = "deno";
              options = ["fmt"];
              includes = ["*.md"];
              excludes = ["*.css"];
            };
            typstyle = {
              command = "typstyle";
              options = ["--inplace"];
              includes = ["*.typ"];
            };
          };
        };

        runtimeInputs = builtins.attrValues {
          inherit
            (pkgs)
            deno
            alejandra
            deadnix
            typstyle
            ;
        };
      });
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
}
