export sass_make_file_compiler
export sass_compiler_parse
export sass_compiler_execute

function sass_make_file_compiler(sass_context)
    ccall((:sass_make_file_compiler, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Ptr{Cvoid}, (Ptr{Cvoid},), sass_context)
end

function sass_compiler_parse(compiler)
    ccall((:sass_compiler_parse, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid},), compiler)
end

function sass_compiler_execute(compiler)
    ccall((:sass_compiler_execute, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"),
        Cvoid, (Ptr{Cvoid},), compiler)
end
