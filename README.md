# Sass

![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)<!--
![Lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-retired-orange.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-archived-red.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-dormant-blue.svg) -->
[![Build Status](https://travis-ci.org/piever/Sass.jl.svg?branch=master)](https://travis-ci.org/piever/Sass.jl)
[![codecov.io](http://codecov.io/github/piever/Sass.jl/coverage.svg?branch=master)](http://codecov.io/github/piever/Sass.jl?branch=master)

## Compile scss and sass file to css in Julia

This library provides a simple Julian API to use the libsass library to compile scss and sass files to css.

```julia
Sass.compile_file(filename; precision = 1, source_comments = true)
```

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
