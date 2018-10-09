# Sass

![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)<!--
![Lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-retired-orange.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-archived-red.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-dormant-blue.svg) -->
[![Build Status](https://travis-ci.org/piever/Sass.jl.svg?branch=master)](https://travis-ci.org/piever/Sass.jl)
[![codecov.io](http://codecov.io/github/piever/Sass.jl/coverage.svg?branch=master)](http://codecov.io/github/piever/Sass.jl?branch=master)

## Example (from libsass docs)

Building a file compiler

```julia
context = sass_make_file_context("file.scss")
options = sass_file_context_get_options(context)
sass_option_set_precision(options, 1)
sass_option_set_source_comments(options, true)

sass_file_context_set_options(context, options)

compiler = sass_make_file_compiler(sass_context)
sass_compiler_parse(compiler)
sass_compiler_execute(compiler)

output = sass_context_get_output_string(context)
# Retrieve errors during compilation
error_status = sass_context_get_error_status(context)
json_error = sass_context_get_error_json(context)
# Release memory dedicated to the C compiler
sass_delete_compiler(compiler)
```

Building a data compiler

```julia
context = sass_make_data_context("div { a { color: blue; } }")
options = sass_data_context_get_options(context)
sass_option_set_precision(options, 1)
sass_option_set_source_comments(options, true)

sass_data_context_set_options(context, options)

compiler = sass_make_data_compiler(context)
sass_compiler_parse(compiler)
sass_compiler_execute(compiler)

output = sass_context_get_output_string(context)
# div a { color: blue; }
# Retrieve errors during compilation
error_status = sass_context_get_error_status(context)
json_error = sass_context_get_error_json(context)
# Release memory dedicated to the C compiler
sass_delete_compiler(compiler)
```
