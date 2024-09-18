const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "zig-networking",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const zap = b.dependency("zap", .{
        .target = target,
        .optimize = optimize,
        .openssl = true, // set to true to enable TLS support
    });

    const getty = b.dependency("getty", .{
        .target = target,
        .optimize = optimize,
    });

    exe.root_module.addImport("zap", zap.module("zap"));
    exe.root_module.addImport("getty", getty.module("getty"));

    b.installArtifact(exe);
}
