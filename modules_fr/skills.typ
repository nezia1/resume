// Imports
#import "/brilliant-cv/lib.typ": cvSection, cvSkill, hBar
#let metadata = toml("/metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)

#cvSection("Compétences")

#cvSkill(
  type: [Langages],
  info: [TypeScript #hBar() C\# #hBar() C #hBar() PHP #hBar() Dart],
)

#cvSkill(
  type: [Frameworks],
  info: [React #hBar() Vue.js #hBar() Flutter],
)

#cvSkill(
  type: [Outils],
  info: [Nix #hBar() Docker #hBar() Git #hBar() CI/CD #hBar() Linux],
)

#cvSkill(
  type: [Bases de données],
  info: [PostgreSQL #hBar() MySQL #hBar() SQL #hBar() NoSQL],
)

#cvSkill(
  type: [Langues],
  info: [Français (langue maternelle) #hBar() Anglais (bilingue)],
)

#cvSkill(
  type: [Hobbies],
  info: [DevOps #hBar() FOSS #hBar() Music],
)

