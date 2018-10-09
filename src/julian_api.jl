const attributes_setters = Dict(
    :precision => sass_option_set_precision,
    :source_comments => sass_option_set_source_comments,
)

function create_context(filename; kwargs...)
    context = sass_make_file_context(filename)
    options = sass_file_context_get_options(context)
    for (key, val) in kwargs
        setter = get(attributes_setters, key, nothing)
        setter === nothing || setter(options, val)
    end

    sass_file_context_set_options(context, options)
    context
end

compile(filename::AbstractString; kwargs...) = compile(create_context(filename; kwargs...))

function compile(context)
    compiler = sass_make_file_compiler(context)
    sass_compiler_parse(compiler)
    sass_compiler_execute(compiler)

    output = sass_context_get_output_string(context)
    sass_delete_compiler(compiler)
    output === nothing ? error(sass_context_get_error_text(context)) : output
end
