export sass_option_get_output_style, sass_option_set_output_style
export sass_option_get_source_comments, sass_option_set_source_comments
export sass_option_get_source_map_file, sass_option_set_source_map_file
export sass_option_get_omit_source_map_url, sass_option_set_omit_source_map_url
export sass_option_get_source_map_embed, sass_option_set_source_map_embed
export sass_option_get_source_map_contents, sass_option_set_source_map_contents
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

function sass_option_set_source_comments(options, source_comments)
    ccall((:sass_option_set_source_comments, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cint), options, source_comments)
end

function sass_option_get_source_map_file(options)
    ccall((:sass_option_get_source_map_file, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cstring, (Ptr{Cvoid},), options)
end

function sass_option_set_source_map_file(options, map_file)
    ccall((:sass_option_set_source_map_file, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cstring), options, map_file)
end

function sass_option_get_omit_source_map_url(options)
    ccall((:sass_option_get_omit_source_map_url, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cint, (Ptr{Cvoid},), options)
end

function sass_option_set_omit_source_map_url(options, omit_source_map_url)
    ccall((:sass_option_set_omit_source_map_url, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cint), options, omit_source_map_url)
end

function sass_option_get_source_map_embed(options)
    ccall((:sass_option_get_source_map_embed, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cint, (Ptr{Cvoid},), options)
end

function sass_option_set_source_map_embed(options, source_map_embed)
    ccall((:sass_option_set_source_map_embed, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cint), options, source_map_embed)
end

function sass_option_get_source_map_contents(options)
    ccall((:sass_option_get_source_map_contents, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cint, (Ptr{Cvoid},), options)
end

function sass_option_set_source_map_contents(options, source_map_contents)
    ccall((:sass_option_set_source_map_contents, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cint), options, source_map_contents)
end

function sass_option_get_precision(options)
    ccall((:sass_option_get_precision, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cint, (Ptr{Cvoid},), options)
end

function sass_option_set_precision(options, precision)
    ccall((:sass_option_set_precision, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cint), options, precision)
end
