const std = @import("std");

pub fn main() !void
{
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {s}!/n", .{"world"});


}

pub fn readfile() []u8
{
    var file = try std.fs.cwd().openFile("input.txt", .{});
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();

    var counter : u32 = 0;
    var buf: [1024]u8 = undefined;
    while (try in_stream.readUntilDelimiterOfEof(&buf, '\n')) |line|
    {
            counter += 1; // zig has no interger iteration operator
                          
    }
}
