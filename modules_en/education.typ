// Imports
#import "/brilliant-cv/lib.typ": cvEntry, cvSection, hBar
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)

#cvSection("Education")

#cvEntry(
  title: [Bachelor of Science - Computer Science],
  society: [HEPIA],
  date: [2024 - Present],
  location: [Geneva],
  description: "",
)
#v(-2em)  // reduces the gap
#cvEntry(
  title: [Technicien ES - Software Development],
  society: [CFPT],
  date: [2022 – 2024],
  location: [Geneva],
  description: "",
)
#v(-2em)  // reduces the gap
#cvEntry(
  title: [CFC - Software Development],
  society: [CFPT],
  date: [2017 – 2021],
  location: [Geneva],
  description: "",
)
#v(-2em)  // reduces the gap
