export sass_option_get_precision, sass_option_set_precision
export sass_option_get_source_comments, sass_option_set_source_comments

function sass_option_get_precision(options)
    ccall((:sass_option_get_precision, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cint, (Ptr{Cvoid},), options)
end

function sass_option_set_precision(options, precision)
    ccall((:sass_option_set_precision, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cint), options, precision)
end

function sass_option_get_source_comments(options)
    ccall((:sass_option_get_source_comments, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cint, (Ptr{Cvoid},), options)
end

function sass_option_set_source_comments(options, comment)
    ccall((:sass_option_set_source_comments, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cint), options, comment)
end
