// Imports
#import "/brilliant-cv/lib.typ": cvEntry, cvSection
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)


#cvSection("Professional Experience")

#cvEntry(
  title: [Internship],
  society: [KTFM],
  date: [2023],
  location: [Geneva],
  description: list(
    [Handled the IT infrastructure of a small business],
    [Maintained their website],
    [Implemented a newsletter to seek new clients],
  ),
)
#cvEntry(
  title: [Internship],
  society: [CERN],
  date: [July 2016],
  location: [Geneva],
  description: list(
    [Learned the basics of Java],
    [Helped with maintaining Linux server],
    [Set up machines for the CCC (CERN Control Center)],
  ),
)

