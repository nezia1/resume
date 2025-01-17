{
  lib,
  stdenv,
  typst,
  source-sans-pro,
  nerd-fonts,
  version ? "",
  src ? null,
  lang ? "",
}: let
  l = lib.optionalString (lang != "") "_${lang}";
in
  stdenv.mkDerivation {
    pname = "nezia_cv${l}";
    inherit src version;

    nativeBuildInputs = [typst];

    configurePhase = ''
      runHook preConfigure

      substituteInPlace src/metadata.typ \
        --replace 'cvLanguage = ""' 'cvLanguage = "${lang}"'

      runHook postConfigure
    '';

    TYPST_FONT_PATHS = lib.makeSearchPath "" [
      source-sans-pro
      nerd-fonts.symbols-only
    ];

    buildPhase = ''
      runHook preBuild

      typst compile src/cv.typ

      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p $out
      mv src/*.pdf $out
      mv $out/cv.pdf $out/CV${l}_AnthonyRodriguez.pdf

      runHook postInstall
    '';
  }
