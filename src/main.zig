const std = @import("std");
const zap = @import("zap");

const Mustache = zap.Mustache;

fn on_request(r: zap.Request) void {
    r.setStatus(.not_found);
    r.sendBody("<html><body><h1>404 - File not found</h1></body></html>") catch return;

    // var mustache = Mustache.fromFile("view/layout/base.html") catch return;
    // defer mustache.deinit();

    // const ret = mustache.build(.{});
    // defer ret.deinit();

    // if (r.setContentType(.HTML)) {
    //     if (ret.str()) |s| {
    //         r.sendBody(s) catch return;
    //     } else {
    //         r.sendBody("<html><body><h1>mustacheBuild() failed!</h1></body></html>") catch return;
    //     }
    // } else |err| {
    //     std.debug.print("Error while setting content type: {}\n", .{err});
    // }
}

pub fn main() !void {
    const CERT_FILE = "configs/mycert.pem";
    const KEY_FILE = "configs/mykey.pem";

    const tls = try zap.Tls.init(.{
        .server_name = "localhost:3000",
        .public_certificate_file = CERT_FILE,
        .private_key_file = KEY_FILE,
    });
    defer tls.deinit();

    var listener = zap.HttpListener.init(.{
        .port = 3000,
        .on_request = on_request,
        .log = true,
        .max_clients = 100000,
        .public_folder = "view",
        .tls = tls,
    });
    try listener.listen();

    std.debug.print("Listening on https://127.0.0.1:3000\n", .{});

    zap.start(.{
        .threads = 1,
        .workers = 1,
    });
}
