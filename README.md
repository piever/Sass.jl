# Sass

![Lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)<!--
![Lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-retired-orange.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-archived-red.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-dormant-blue.svg) -->
[![Build Status](https://travis-ci.org/piever/Sass.jl.svg?branch=master)](https://travis-ci.org/piever/Sass.jl)
[![codecov.io](http://codecov.io/github/piever/Sass.jl/coverage.svg?branch=master)](http://codecov.io/github/piever/Sass.jl?branch=master)

## Compile scss and sass file to css in Julia

This library provides a simple Julian API to use the libsass library to compile scss and sass files to css.

```julia
using Sass
filename = joinpath(Sass.examplefolder, "test.sass")
Sass.compile_file(filename; precision = 1, source_comments = true)
```

To write the output to a file use the signature:

```julia
Sass.compile_file(filename, dest; kwargs...)
```

## List of keyword arguments

All libsass options can be passed as keyword arguments:

- `output_style`: output style for the generated css code. See `Sass.Style` for options. For example `output_style  = Sass.nested`
- `source_comments`: a boolean to specify whether to insert inline source comments
- `source_map_file`: path to source map file, enables the source map generating used to create sourceMappingUrl
- `omit_source_map_url`: disable sourceMappingUrl in css output
- `source_map_embed`: embed sourceMappingUrl as data uri
- `source_map_contents`: embed include contents in maps
- `source_map_file_urls`: create file urls for sources
- `source_map_root`: pass-through as sourceRoot property
- `is_indented_syntax_src`: treat source_string as sass (as opposed to scss)
- `include_paths` (`AbstractString` or `AbstractArray{<:AbstractString}`)
- `plugin_paths` (`AbstractString` or `AbstractArray{<:AbstractString}`)
- `indent`: string to be used for indentation
- `linefeed`: string to be used to for line feeds
- `input_path`: the input path is used for source map generating. It can be used to define something with string compilation or to overload the input file path. It is set to `stdin` for data contexts and to the input file on file contexts.
- `output_path`: the output path is used for source map generating. LibSass will not write to this file, it is just used to create information in source-maps etc.
- `precision`: precision for outputting fractional numbers

## Using the libsass API

For more advanced use, the main functions of the libsass API are ported and can be used directly for a finer control. This is more complicated and should be unnecessary in most cases.

### Example (from libsass docs): building a file compiler

```julia
using Sass
filename = joinpath(Sass.examplefolder, "test.sass")
context = sass_make_file_context(filename)
options = sass_file_context_get_options(context)
sass_option_set_precision(options, 1)
sass_option_set_source_comments(options, true)

sass_file_context_set_options(context, options)

compiler = sass_make_file_compiler(context)
sass_compiler_parse(compiler)
sass_compiler_execute(compiler)

output = sass_context_get_output_string(context)
# Retrieve errors during compilation
error_status = sass_context_get_error_status(context)
json_error = sass_context_get_error_json(context)
# Release memory dedicated to the C compiler
sass_delete_compiler(compiler)
```
