module Sass

if isfile(joinpath(dirname(@__FILE__),"..","deps","deps.jl"))
    include("../deps/deps.jl")
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
