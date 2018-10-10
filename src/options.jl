export sass_option_get_output_style, sass_option_set_output_style
export sass_option_get_source_comments, sass_option_set_source_comments
export sass_option_get_source_map_file, sass_option_set_source_map_file
export sass_option_get_omit_source_map_url, sass_option_set_omit_source_map_url
export sass_option_get_source_map_embed, sass_option_set_source_map_embed
export sass_option_get_source_map_contents, sass_option_set_source_map_contents
export sass_option_get_source_map_file_urls, sass_option_set_source_map_file_urls
export sass_option_get_source_map_root, sass_option_set_source_map_root
export sass_option_get_is_indented_syntax_src, sass_option_set_is_indented_syntax_src
export sass_option_get_include_path, sass_option_set_include_path
export sass_option_get_plugin_path, sass_option_set_plugin_path
export sass_option_get_indent, sass_option_set_indent
export sass_option_get_linefeed, sass_option_set_linefeed
export sass_option_get_input_path, sass_option_set_input_path
export sass_option_get_output_path, sass_option_set_output_path
export sass_option_get_precision, sass_option_set_precision

@enum Style nested expanded compact compressed

function sass_option_get_output_style(options)
    i = ccall((:sass_option_get_output_style, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cint, (Ptr{Cvoid},), options)
    Style(i)
end

sass_option_set_output_style(options, output_style::Style) =
    sass_option_set_output_style(options, Int(output_style))

function sass_option_set_output_style(options, output_style::Integer)
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

function sass_option_get_source_map_file_urls(options)
    ccall((:sass_option_get_source_map_file_urls, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cint, (Ptr{Cvoid},), options)
end

function sass_option_set_source_map_file_urls(options, source_map_file_urls)
    ccall((:sass_option_set_source_map_file_urls, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cint), options, source_map_file_urls)
end

function sass_option_get_source_map_root(options)
    s = ccall((:sass_option_get_source_map_root, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cstring, (Ptr{Cvoid},), options)
    s == C_NULL ? nothing : unsafe_string(s)
end

function sass_option_set_source_map_root(options, source_map_root)
    ccall((:sass_option_set_source_map_root, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cstring), options, source_map_root)
end

function sass_option_get_is_indented_syntax_src(options)
    ccall((:sass_option_get_is_indented_syntax_src, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cint, (Ptr{Cvoid},), options)
end

function sass_option_set_is_indented_syntax_src(options, is_indented_syntax_src)
    ccall((:sass_option_set_is_indented_syntax_src, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cint), options, is_indented_syntax_src)
end

function sass_option_get_include_path(options)
    s = ccall((:sass_option_get_include_path, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cstring, (Ptr{Cvoid},), options)
    s == C_NULL && return nothing
    julia_pathlist(unsafe_string(s))
end

function sass_option_set_include_path(options, include_path)
    ccall((:sass_option_set_include_path, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cstring), options, c_pathlist(include_path))
end

function sass_option_get_plugin_path(options)
    s = ccall((:sass_option_get_plugin_path, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cstring, (Ptr{Cvoid},), options)
    s == C_NULL && return nothing
    julia_pathlist(unsafe_string(s))
end

function sass_option_set_plugin_path(options, plugin_path)
    ccall((:sass_option_set_plugin_path, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cstring), options, c_pathlist(plugin_path))
end

function sass_option_get_indent(options)
    s = ccall((:sass_option_get_indent, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cstring, (Ptr{Cvoid},), options)
    s == C_NULL ? nothing : unsafe_string(s)
end

function sass_option_set_indent(options, indent)
    ccall((:sass_option_set_indent, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cstring), options, indent)
end

function sass_option_get_linefeed(options)
    s = ccall((:sass_option_get_linefeed, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cstring, (Ptr{Cvoid},), options)
    s == C_NULL ? nothing : unsafe_string(s)
end

function sass_option_set_linefeed(options, linefeed)
    ccall((:sass_option_set_linefeed, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cstring), options, linefeed)
end

function sass_option_get_input_path(options)
    s = ccall((:sass_option_get_input_path, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cstring, (Ptr{Cvoid},), options)
    s == C_NULL ? nothing : unsafe_string(s)
end

function sass_option_set_input_path(options, input_path)
    ccall((:sass_option_set_input_path, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cstring), options, input_path)
end

function sass_option_get_output_path(options)
    s = ccall((:sass_option_get_output_path, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cstring, (Ptr{Cvoid},), options)
    s == C_NULL ? nothing : unsafe_string(s)
end

function sass_option_set_output_path(options, output_path)
    ccall((:sass_option_set_output_path, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cstring), options, output_path)
end

function sass_option_get_precision(options)
    ccall((:sass_option_get_precision, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cint, (Ptr{Cvoid},), options)
end

function sass_option_set_precision(options, precision)
    ccall((:sass_option_set_precision, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid}, Cint), options, precision)
end

const separator = Sys.iswindows() ? ';' : ':'

c_pathlist(s::AbstractString) = s
c_pathlist(s) = join(s, separator)

julia_pathlist(s) = split(s, separator)
