export sass_make_file_context, sass_file_context_get_options, sass_file_context_set_options

function sass_make_file_context(s)
    ccall((:sass_make_file_context, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Ptr{Cvoid}, (Cstring,), s)
end

function sass_file_context_get_options(context)
    ccall((:sass_file_context_get_options, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Ptr{Cvoid}, (Ptr{Cvoid},), context)
end

function sass_file_context_set_options(context, options)
    ccall((:sass_file_context_get_options, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}), context, options)
end
