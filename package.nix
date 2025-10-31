{
  lib,
  stdenv,
  typst,
  source-sans-pro,
  nerd-fonts,
  source-sans,
  roboto,
  font-awesome,
  packageCache,
  brilliant-cv,
  version ? "",
  src ? null,
  lang ? "en",
}: let
  l = lib.optionalString (lang != "") "_${lang}";
in
  stdenv.mkDerivation {
    pname = "nezia_cv${l}";
    inherit version src;

    nativeBuildInputs = [typst];

    unpackPhase = ''
      runHook preUnpack

      cp -r ${src}/* .
      cp -r "${brilliant-cv}" brilliant-cv
      chmod -R u+w .

      runHook postUnpack
    '';
    sourceRoot = ".";

    configurePhase = ''
      runHook preConfigure

      substituteInPlace metadata.toml \
        --replace-fail 'language = "en"' 'language = "${lang}"'

      runHook postConfigure
    '';

    TYPST_FONT_PATHS = lib.makeSearchPath "" [
      source-sans-pro
      nerd-fonts.symbols-only
      source-sans
      source-sans-pro
      roboto
      font-awesome
    ];

    buildPhase = ''
      runHook preBuild

      export TYPST_PACKAGE_PATH=${packageCache}
      typst compile cv.typ

      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall

      ls -al
      mv cv.pdf $out

      runHook postInstall
    '';
  }
