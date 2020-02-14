const attributes_setters = Dict(
    :output_style => sass_option_set_output_style,
    :source_comments => sass_option_set_source_comments,
    :source_map_file => sass_option_set_source_map_file,
    :omit_source_map_url => sass_option_set_omit_source_map_url,
    :source_map_embed => sass_option_set_source_map_embed,
    :source_map_contents => sass_option_set_source_map_contents,
    :source_map_file_urls => sass_option_set_source_map_file_urls,
    :source_map_root => sass_option_set_source_map_root,
    :is_indented_syntax_src => sass_option_set_is_indented_syntax_src,
    :include_path => sass_option_set_include_path,
    :plugin_path => sass_option_set_plugin_path,
    :indent => sass_option_set_indent,
    :linefeed => sass_option_set_linefeed,
    :input_path => sass_option_set_input_path,
    :output_path => sass_option_set_output_path,
    :precision => sass_option_set_precision,
)

"""
`compile_file(filename; kwargs...)`

Compile `filename` from sass or scss to a css string. Possible options, given by keyword
arguments, are:

- `output_style`: output style for the generated css code. See `Sass.Style` for options. For example `output_style  = Sass.nested`
- `source_comments`: a boolean to specify whether to insert inline source comments
- `source_map_file`: path to source map file, enables the source map generating used to create sourceMappingUrl
- `omit_source_map_url`: disable sourceMappingUrl in css output
- `source_map_embed`: embed sourceMappingUrl as data uri
- `source_map_contents`: embed include contents in maps
- `source_map_file_urls`: create file urls for sources
- `source_map_root`: pass-through as sourceRoot property
- `is_indented_syntax_src`: treat source_string as sass (as opposed to scss)
- `include_path` (`AbstractString` or `AbstractArray{<:AbstractString}`)
- `plugin_path` (`AbstractString` or `AbstractArray{<:AbstractString}`)
- `indent`: string to be used for indentation
- `linefeed`: string to be used to for line feeds
- `input_path`: the input path is used for source map generating. It can be used to define something with string compilation or to overload the input file path. It is set to `stdin` for data contexts and to the input file on file contexts.
- `output_path`: the output path is used for source map generating. LibSass will not write to this file, it is just used to create information in source-maps etc.
- `precision`: precision for outputting fractional numbers

## Examples

```julia
julia> filename = joinpath(Sass.examplefolder, "test.sass");

julia> Sass.compile_file(filename; output_style = Sass.compressed)
"body{font:100% Helvetica,sans-serif;color:#333}\n"
```
"""
function compile_file(filename; input_path = filename, source_map_file = nothing, kwargs...)
    ctx = sass_make_file_context(filename)
    ctx_out = sass_file_context_get_context(ctx)
    options = sass_context_get_options(ctx)
    for (key, val) in kwargs
        setter = get(attributes_setters, key, nothing)
        setter === nothing || setter(options, val)
    end
    sass_option_set_input_path(options, input_path)
    source_map_file === nothing || sass_option_set_source_map_file(options, source_map_file)

    sass_file_context_set_options(ctx, options)

    sass_compile_file_context(ctx)

    status = sass_context_get_error_status(ctx_out)

    status == 0 || error(sass_context_get_error_text(ctx_out))

    css =  sass_context_get_output_string(ctx_out)
    ret = source_map_file === nothing ? css : (css, sass_context_get_source_map_string(ctx_out))

    sass_delete_file_context(ctx)
    ret
end

"""
`compile_file(filename, dest; kwargs...)`

Same as `compile_file(filename; kwargs)` but writes the resulting string in file `dest`.
"""
function compile_file(filename, dest; output_path = dest, source_map_file = nothing, kwargs...)
    if source_map_file === nothing
        css = compile_file(filename; output_path = output_path, kwargs...)
        open(dest, "w") do io
             write(io, css)
         end
    else
        css, src_map = compile_file(filename; output_path = output_path, source_map_file = source_map_file, kwargs...)
        open(dest, "w") do io
            write(io, css)
        end
        open(source_map_file, "w") do io
            write(io, src_map)
        end
    end
 end
