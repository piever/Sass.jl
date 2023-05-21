using Sass
using Test

@testset "outputstyle" begin
    filename = joinpath(Sass.examplefolder, "test.sass")
    css = Sass.compile_file(filename; output_style = Sass.nested)
    @test css == "body {\n  font: 100% Helvetica, sans-serif;\n  color: #333; }\n"
    css = Sass.compile_file(filename; output_style = Sass.expanded)
    @test css == "body {\n  font: 100% Helvetica, sans-serif;\n  color: #333;\n}\n"
    css = Sass.compile_file(filename; output_style = Sass.compact)
    @test css == "body { font: 100% Helvetica, sans-serif; color: #333; }\n"
    css = Sass.compile_file(filename; output_style = Sass.compressed)
    @test css == "body{font:100% Helvetica,sans-serif;color:#333}\n"
end

@testset "compile_string" begin
    filename = joinpath(Sass.examplefolder, "test.sass")
    sass = read(filename, String)
    @test_throws ErrorException Sass.compile_string(sass)

    css = Sass.compile_string(sass; output_style = Sass.nested, is_indented_syntax_src = true)
    @test css == "body {\n  font: 100% Helvetica, sans-serif;\n  color: #333; }\n"

    css = Sass.compile_sass(sass)
    @test css == "body {\n  font: 100% Helvetica, sans-serif;\n  color: #333; }\n"

    scss = raw"
    $font-stack:    Helvetica, sans-serif;
    $primary-color: #333;

    body {
        font: 100% $font-stack;
        color: $primary-color;
    }"
    css = Sass.compile_scss(scss)
    @test css == "body {\n  font: 100% Helvetica, sans-serif;\n  color: #333; }\n"
end

@testset "wrongpath" begin
    filename = joinpath(Sass.examplefolder, "wrongpath.sass")
    @test_throws ErrorException Sass.compile_file(filename)
end
