using Sass
using Test

filename = joinpath(Sass.examplefolder, "test.sass")

context = sass_make_file_context(filename)
println("created a context")
compiler = sass_make_file_compiler(context)
print("created a compiler")
sass_compiler_parse(compiler)
print("parsed a compiler")

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
