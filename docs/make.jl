using Documenter, Sass

makedocs(
    modules = [Sass],
    format = :html,
    sitename = "Sass.jl",
    pages = Any["index.md"]
)

deploydocs(
    repo = "github.com/piever/Sass.jl.git",
    target = "build",
    julia = "1.0",
    deps = nothing,
    make = nothing,
)
