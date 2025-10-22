// Imports
#import "/brilliant-cv/lib.typ": cvSection, cvSkill, hBar
#let metadata = toml("/metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)

#cvSection("Skills")

#cvSkill(
  type: [Languages],
  info: [TypeScript #hBar() C\# #hBar() C #hBar() PHP #hBar() Dart],
)

#cvSkill(
  type: [Frameworks],
  info: [React #hBar() Vue.js #hBar() Flutter],
)

#cvSkill(
  type: [Tools],
  info: [Nix #hBar() Docker #hBar() Git #hBar() CI/CD #hBar() Linux],
)

#cvSkill(
  type: [Databases],
  info: [PostgreSQL #hBar() MySQL],
)

#cvSkill(
  type: [Languages (Spoken)],
  info: [French (native) #hBar() English (bilingual)],
)

#cvSkill(
  type: [Interests],
  info: [DevOps #hBar() FOSS #hBar() Music],
)

