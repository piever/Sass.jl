module Sass

const libsass_so = "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"

include("version.jl")
include("context.jl")
include("options.jl")
include("compiler.jl")
include("julian_api.jl")

examplefolder = normpath(joinpath(@__DIR__, "..", "test", "css"))

end # module
