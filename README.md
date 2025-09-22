# ms-compress

This is [ms-compress](https://github.com/coderforlife/ms-compress), packaged for Zig.

## Installation

First, update your `build.zig.zon`:

```
# Initialize a `zig build` project if you haven't already
zig init
zig fetch --save git+https://github.com/lukaskastern/ms-compress.git
```

You can then import `ms-compress` in your `build.zig` with:

```zig
const ms_compress_dependency = b.dependency("ms_compress", .{
    .target = target,
    .optimize = optimize,
});
your_exe.linkLibrary(ms_compress_dependency.artifact("ms_compress"));
```

And use the library like this:
```zig
const mscomp = @cImport({
    @cInclude("mscomp.h");
});

...
```

### Zig Version
The target zig version is 0.14.0


