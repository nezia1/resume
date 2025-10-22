// Imports
#import "/brilliant-cv/lib.typ": cvEntry, cvSection, hBar
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)

#cvSection("Education")

#cvEntry(
  title: [Bachelor of Science - Informatique et Systèmes de Communication],
  society: [HEPIA],
  date: [2024 - Present],
  location: [Geneva],
  description: "",
)
#v(-2em)
#cvEntry(
  title: [Technicien ES - Développement d'applications],
  society: [CFPT],
  date: [2022 – 2024],
  location: [Geneva],
  description: "",
)
#v(-2em)
#cvEntry(
  title: [CFC - Développement d'applications],
  society: [CFPT],
  date: [2017 – 2021],
  location: [Geneva],
  description: "",
)
#v(-2em)
