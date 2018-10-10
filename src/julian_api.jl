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

function compile_file(filename; kwargs...)
    ctx = sass_make_file_context(filename)
    ctx_out = sass_file_context_get_context(ctx)
    options = sass_context_get_options(ctx)
    for (key, val) in kwargs
        setter = get(attributes_setters, key, nothing)
        setter === nothing || setter(options, val)
    end

    sass_file_context_set_options(ctx, options)

    sass_compile_file_context(ctx)

    status = sass_context_get_error_status(ctx_out)

    ret = status == 0 ? sass_context_get_output_string(ctx_out) :
        error(sass_context_get_error_text(ctx_out))

    sass_delete_file_context(ctx)
    ret
end

function compile_file(filename, dest; kwargs...)
    css = compile_file(filename; kwargs...)
    open(dest, "w") do io
         write(io, css)
     end
 end
