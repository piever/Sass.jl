module Sass

const deps_file = normpath(joinpath(dirname(@__FILE__),"..","deps","deps.jl"))
if isfile(deps_file)
    include(deps_file)
else
    error("Sass not properly installed. Please run `] build Sass` in the REPL")
end
include("version.jl")
include("context.jl")
include("options.jl")
include("compiler.jl")
include("julian_api.jl")

examplefolder = normpath(joinpath(@__DIR__, "..", "test", "css"))

end # module
