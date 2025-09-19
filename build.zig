const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const upstream = b.dependency("ms_compress", .{});

    const ms_compress = b.addLibrary(.{
        .name = "ms_compress",
        .root_module = b.createModule(.{
            .target = target,
            .optimize = optimize,
        }),
    });
    ms_compress.addCSourceFiles(.{
        .files = ms_compress_sources,
        .flags = &.{},
        .language = .cpp,
        .root = upstream.path(""),
    });
    ms_compress.addIncludePath(upstream.path("include"));
    ms_compress.installHeadersDirectory(upstream.path("include"), "", .{});

    ms_compress.linkLibC();
    ms_compress.linkLibCpp();

    b.installArtifact(ms_compress);
}

const ms_compress_sources = &.{
    "src/lznt1_compress.cpp",
    "src/lznt1_decompress.cpp",
    "src/mscomp.cpp",
    "src/xpress_compress.cpp",
    "src/xpress_decompress.cpp",
    "src/xpress_huff_compress.cpp",
    "src/xpress_huff_decompress.cpp",
};
