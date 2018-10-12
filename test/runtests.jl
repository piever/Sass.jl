println("Before running test!")
using Sass
println("Precompiled successfully!")
using Test

filename = joinpath(Sass.examplefolder, "test.sass")

@testset "outputstyle" begin
    css = Sass.compile_file(filename; output_style = Sass.nested)
    @test css == "body {\n  font: 100% Helvetica, sans-serif;\n  color: #333; }\n"
    css = Sass.compile_file(filename; output_style = Sass.expanded)
    @test css == "body {\n  font: 100% Helvetica, sans-serif;\n  color: #333;\n}\n"
    css = Sass.compile_file(filename; output_style = Sass.compact)
    @test css == "body { font: 100% Helvetica, sans-serif; color: #333; }\n"
    css = Sass.compile_file(filename; output_style = Sass.compressed)
    @test css == "body{font:100% Helvetica,sans-serif;color:#333}\n"
end
