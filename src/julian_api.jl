const attributes_setters = Dict(
    :precision => sass_option_set_precision,
    :source_comments => sass_option_set_source_comments,
)

function compile(filename; kwargs...)
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
