function libsass_version()
    s = ccall((:libsass_version, libsass_so), Cstring, ())
    unsafe_string(s)
end
