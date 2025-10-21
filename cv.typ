// Imports
#import "/brilliant-cv/lib.typ": cv
#let metadata = toml("./metadata.toml")
#let importModules(modules, lang: metadata.language) = {
  for module in modules {
    include {
      "modules_" + lang + "/" + module + ".typ"
    }
  }
}

#show: cv.with(
  metadata,
  profilePhoto: "",
  // profilePhoto: image("./src/avatar.png"),
)
#importModules((
  "education",
  "projects",
  "professional",
  "skills",
))
