// Imports
#import "/brilliant-cv/lib.typ": cvEntry, cvSection
#let metadata = toml("../metadata.toml")
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)


#cvSection("Student Employment")

#cvEntry(
  title: [Cashier],
  society: [Migros],
  date: [August 2023 - Present],
  location: [Thoiry (France)],
  description: list(
    [Customer service],
    [Handling payments],
  ),
)
#cvEntry(
  title: [Logistics Associate],
  society: [Migros],
  date: [March 2023 - August 2023],
  location: [Thoiry (France)],
  description: list(
    [Shelving and stocking (drugstore department)],
  ),
)

#cvEntry(
  title: [Cashier],
  society: [Intermarché],
  date: [October 2020 - March 2023],
  location: [Péron (France)],
  description: list(
    [Customer service],
    [Handling payments],
  ),
)
