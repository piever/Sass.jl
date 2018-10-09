export sass_make_file_context, sass_file_context_get_options, sass_file_context_set_options
export sass_context_get_output_string
export sass_context_get_error_status
export sass_context_get_error_json
export sass_context_get_error_text

function sass_make_file_context(filename)
    ccall((:sass_make_file_context, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Ptr{Cvoid}, (Cstring,), filename)
end

function sass_file_context_get_options(context)
    ccall((:sass_file_context_get_options, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Ptr{Cvoid}, (Ptr{Cvoid},), context)
end

function sass_file_context_set_options(context, options)
    ccall((:sass_file_context_get_options, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}), context, options)
end

function sass_context_get_output_string(context)
    s = ccall((:sass_context_get_output_string, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
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
    unsafe_string(s)
end

function sass_context_get_error_text(context)
    s = ccall((:sass_context_get_error_text, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cstring, (Ptr{Cvoid},), context)
    unsafe_string(s)
end
