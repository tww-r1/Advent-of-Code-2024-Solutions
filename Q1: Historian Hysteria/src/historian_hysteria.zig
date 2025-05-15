const std = @import("std");

pub fn main() !void
{
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {s}!/n", .{"world"});


}

pub fn readfile() []u8
{
    const alloc = std.heap.page_allocator;
    var file = try std.fs.cwd().openFile("input.txt", .{ .read = true});
    defer file.close();

    var buffer: [2048]u8 = undefined;
    const content = try file.reader().readAllAlloc(alloc, buffer.len);
    defer alloc.free();

    var tokenize = std.mem.tokenize(u8, content, " \n");

    var buf_reader = std.io.bufferedReader(file.reader());
    
}

pub fn extract_nums()


