export sass_option_get_output_style, sass_option_set_output_style
export sass_option_get_source_comments, sass_option_set_source_comments
export sass_option_get_precision, sass_option_set_precision

function sass_option_get_output_style(options)
    ccall((:sass_option_get_output_style, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cint, (Ptr{Cvoid},), options)
end

function sass_option_set_output_style(options, output_style)
    ccall((:sass_option_set_output_style, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cint), options, output_style)
end

function sass_option_get_source_comments(options)
    ccall((:sass_option_get_source_comments, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cint, (Ptr{Cvoid},), options)
end

function sass_option_set_source_comments(options, comment)
    ccall((:sass_option_set_source_comments, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cint), options, comment)
end

function sass_option_get_precision(options)
    ccall((:sass_option_get_precision, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cint, (Ptr{Cvoid},), options)
end

function sass_option_set_precision(options, precision)
    ccall((:sass_option_set_precision, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cint), options, precision)
end
