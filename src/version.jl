function libsass_version()
    s = ccall((:libsass_version, "/home/pietro/.julia/dev/Sass/deps/lib/libsass.so"), Cstring, ())
    unsafe_string(s)
end
