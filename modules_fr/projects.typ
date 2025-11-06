// Imports
#import "/brilliant-cv/lib.typ": cvEntry, cvSection
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)


#cvSection("Projets")

#cvEntry(
  title: [Contributions open source],
  society: [GitHub],
  date: [2025 - Présent],
  location: [Home],
  description: list(
    [Technologies : Nix / NixOS / GitHub / CI/CD],
    [Hjem (contributeur): un système de gestion du répertoire HOME déclaratif avec Nix],
    [Hjem Rum (co-mainteneur): une collection de modules basée sur Hjem],
    [Divers projets dans l'écosystème Nix],
  ),
)

#cvEntry(
  title: [Missive],
  society: [CFPT],
  date: [Janvier 2024 - Juin 2024],
  location: [Genève],
  description: list(
    [Technologies : Dart / Flutter / Typescript / PostgreSQL / CI/CD / Gitlab],
    [Implémentation d'une application de messagerie chiffrée],
    [Utilisation du protocole Signal],
    [Utilisation de Flutter pour le front-end (pour les builds cross-platform)],
    [Utilisation de Typescript pour le back-end (API REST, authentification JWT)],
    [Utilisation de Gitlab CI/CD pour tests unitaires et génération automatique de la documentation],
  ),
)

#cvEntry(
  title: [What the Git],
  society: [Projet personnel],
  date: [2021],
  location: [Home],
  description: list(
    [Technologies : Typescript / React],
    [Création d'une application qui explique la syntaxe Git de manière visuelle],
    [Utilisation de React pour le front-end avec Typescript],
    [Gestion des commandes et des descriptions depuis un fichier JSON],
    [Traitement des arguments et des fanions pour visualisation sur la page],
  ),
)
