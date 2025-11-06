// Imports
#import "/brilliant-cv/lib.typ": cvEntry, cvSection
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)


#cvSection("Projects")

#cvEntry(
  title: [Open source contributions],
  society: [GitHub],
  date: [2025 - Present],
  location: [Home],
  description: list(
    [Technologies: Nix / NixOS / GitHub / CI/CD],
    [Hjem (contributor): a declarative \$HOME management system with Nix],
    [Hjem Rum (co-maintainer): A Hjem modules collection],
    [Miscellaneous Nix related projects],
  ),
)


#cvEntry(
  title: [Missive],
  society: [CFPT],
  date: [January 2024 - June 2024],
  location: [Geneva],
  description: list(
    [Technologies: Dart / Flutter / Typescript / PostgreSQL / CI/CD / Gitlab],
    [Implemented an end-to-end encrypted chat application],
    [Used the Signal protocol with a custom implementation],
    [Used Flutter for the front-end (for cross-platform builds)],
    [Used Typescript for the back-end (RESTful API, JWT based authentication)],
    [Leveraged Gitlab CI/CD to automatically generate documentation],
  ),
)

#cvEntry(
  title: [What the Git],
  society: [Personal project],
  date: [2021],
  location: [Home],
  description: list(
    [Technologies: Typescript / React],
    [Created an application allowing to explain Git CLI syntax],
    [Used React for the front-end with Typescript],
    [Managed commands and descriptions locally within a JSON file],
    [Parsed command-line arguments and flags for rendering on the app],
  ),
)
