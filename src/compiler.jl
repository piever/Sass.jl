export sass_make_file_compiler
export sass_make_data_compiler
export sass_compiler_parse
export sass_compiler_execute
export sass_delete_compiler

function sass_make_file_compiler(sass_context)
    ccall((:sass_make_file_compiler, libsass_so),
        Ptr{Cvoid}, (Ptr{Cvoid},), sass_context)
end

function sass_make_data_compiler(sass_context)
    ccall((:sass_make_data_compiler, libsass_so),
        Ptr{Cvoid}, (Ptr{Cvoid},), sass_context)
end

function sass_compiler_parse(compiler)
    ccall((:sass_compiler_parse, libsass_so),
        Cvoid, (Ptr{Cvoid},), compiler)
end

function sass_compiler_execute(compiler)
    ccall((:sass_compiler_execute, libsass_so),
        Cvoid, (Ptr{Cvoid},), compiler)
end

function sass_delete_compiler(compiler)
    ccall((:sass_delete_compiler, libsass_so),
        Cvoid, (Ptr{Cvoid},), compiler)
end
