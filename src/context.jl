export sass_make_file_context, sass_delete_file_context, sass_compile_file_context
export sass_file_context_get_context, sass_file_context_get_options, sass_file_context_set_options
export sass_make_data_context, sass_delete_data_context, sass_compile_data_context
export sass_data_context_get_context, sass_data_context_get_options, sass_data_context_set_options
export sass_context_get_options, sass_context_set_options
export sass_context_get_output_string
export sass_context_get_source_map_string
export sass_context_get_error_status
export sass_context_get_error_json
export sass_context_get_error_text
export sass_context_get_error_message

# File

function sass_make_file_context(filename)
    ccall((:sass_make_file_context, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Ptr{Cvoid}, (Cstring,), filename)
end

function sass_delete_file_context(context)
    ccall((:sass_delete_file_context, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid},), context)
end

function sass_compile_file_context(context)
    ccall((:sass_compile_file_context, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cint, (Ptr{Cvoid},), context)
end

function sass_file_context_get_context(context)
    ccall((:sass_file_context_get_context, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Ptr{Cvoid}, (Ptr{Cvoid},), context)
end

function sass_file_context_get_options(context)
    ccall((:sass_file_context_get_options, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Ptr{Cvoid}, (Ptr{Cvoid},), context)
end

function sass_file_context_set_options(context, options)
    ccall((:sass_file_context_get_options, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}), context, options)
end

# Data

function sass_make_data_context(data)
    ccall((:sass_make_data_context, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Ptr{Cvoid}, (Ptr{UInt8},), data)
end

function sass_delete_data_context(context)
    ccall((:sass_delete_data_context, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid},), context)
end

function sass_compile_data_context(context)
    ccall((:sass_compile_data_context, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cint, (Ptr{Cvoid},), context)
end

function sass_data_context_get_context(context)
    ccall((:sass_data_context_get_context, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Ptr{Cvoid}, (Ptr{Cvoid},), context)
end

function sass_data_context_get_options(context)
    ccall((:sass_data_context_get_options, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Ptr{Cvoid}, (Ptr{Cvoid},), context)
end

function sass_data_context_set_options(context, options)
    ccall((:sass_data_context_get_options, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}), context, options)
end

# Context

function sass_context_get_options(context)
    ccall((:sass_context_get_options, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Ptr{Cvoid}, (Ptr{Cvoid},), context)
end

function sass_context_set_options(context, options)
    ccall((:sass_context_get_options, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}), context, options)
end

function sass_context_get_output_string(context)
    s = ccall((:sass_context_get_output_string, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cstring, (Ptr{Cvoid},), context)
    s == C_NULL ? nothing : unsafe_string(s)
end

function sass_context_get_source_map_string(context)
    s = ccall((:sass_context_get_source_map_string, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cstring, (Ptr{Cvoid},), context)
    s == C_NULL ? nothing : unsafe_string(s)
end

function sass_context_get_error_status(context)
    ccall((:sass_context_get_error_status, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cint, (Ptr{Cvoid},), context)
end

function sass_context_get_error_json(context)
    s = ccall((:sass_context_get_error_json, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cstring, (Ptr{Cvoid},), context)
    s == C_NULL ? nothing : unsafe_string(s)
end

function sass_context_get_error_text(context)
    s = ccall((:sass_context_get_error_text, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cstring, (Ptr{Cvoid},), context)
    s == C_NULL ? nothing : unsafe_string(s)
end

function sass_context_get_error_message(context)
    s = ccall((:sass_context_get_error_message, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cstring, (Ptr{Cvoid},), context)
    s == C_NULL ? nothing : unsafe_string(s)
end
