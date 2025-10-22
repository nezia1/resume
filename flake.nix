{
  outputs = {
    self,
    nixpkgs,
    brilliant-cv,
    typst-fontawesome,
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
          rm -rf brilliant-cv
          mkdir -p brilliant-cv
          ln -sf ${brilliant-cv}/* brilliant-cv
        '';
        name = "Resume";
      };
    });

    packages = forAllSystems (pkgs: let
      packageCache = pkgs.linkFarm "typst-packages" {
        "preview/fontawesome/0.6.0" = typst-fontawesome;
      };
    in {
      english = pkgs.callPackage ./package.nix {
        inherit version src packageCache brilliant-cv;
      };
      french = self.packages.${pkgs.system}.english.override {lang = "fr";};
      default = self.packages.${pkgs.system}.english;
    });

    formatter = forAllSystems (pkgs:
      pkgs.treefmt.withConfig {
        settings = {
          tree-root-file = "flake.nix";
          excludes = "brilliant-cv";
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
            tombi = {
              command = "tombi";
              options = ["format"];
              includes = ["*.toml"];
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
            tombi
            ;
        };
      });
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    typst-fontawesome = {
      url = "github:duskmoon314/typst-fontawesome/v0.6.0";
      flake = false;
    };
    brilliant-cv = {
      url = "github:yunanwg/brilliant-cv/v2.0.7";
      flake = false;
    };
  };
}
