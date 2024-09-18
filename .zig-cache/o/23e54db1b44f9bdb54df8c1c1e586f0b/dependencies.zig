pub const packages = struct {
    pub const @"122014736a658ee30f82e5c6e3038c95727690fe01fced2791b213dba10c65fba7c5" = struct {
        pub const build_root = "/root/.cache/zig/p/122014736a658ee30f82e5c6e3038c95727690fe01fced2791b213dba10c65fba7c5";
        pub const build_zig = @import("122014736a658ee30f82e5c6e3038c95727690fe01fced2791b213dba10c65fba7c5");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
    pub const @"12204235c113ed912d951e381066d587bb398b7175dc635c50c17864946bbd570879" = struct {
        pub const build_root = "/root/.cache/zig/p/12204235c113ed912d951e381066d587bb398b7175dc635c50c17864946bbd570879";
        pub const build_zig = @import("12204235c113ed912d951e381066d587bb398b7175dc635c50c17864946bbd570879");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
            .{ "protest", "122014736a658ee30f82e5c6e3038c95727690fe01fced2791b213dba10c65fba7c5" },
        };
    };
};

pub const root_deps: []const struct { []const u8, []const u8 } = &.{
    .{ "getty", "12204235c113ed912d951e381066d587bb398b7175dc635c50c17864946bbd570879" },
};
