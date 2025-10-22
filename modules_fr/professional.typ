// Imports
#import "/brilliant-cv/lib.typ": cvEntry, cvSection
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)


#cvSection("Expérience professionnelle")

#cvEntry(
  title: [Stage],
  society: [KTFM],
  date: [2023],
  location: [Genève],
  description: list(
    [Gestion de l'infrastructure IT d'une petite entreprise],
    [Maintenance de leur site internet],
    [Implémentation d'une newsletter dans le but de trouver de nouveaux clients],
  ),
)
#cvEntry(
  title: [Stage],
  society: [CERN],
  date: [Juillet 2016],
  location: [Genève],
  description: list(
    [Introduction à la programmation en Java],
    [Aide à la maintenance de serveurs sous Linux],
    [Déploiement de machines pour le CCC (CERN Control Center)],
  ),
)

