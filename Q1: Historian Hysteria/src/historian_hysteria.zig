const std = @import("std");
const Alloc = std.mem.Allocator;
pub fn main() !void
{
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {s}!/n", .{"world"});
    
    const ArrayList = std.ArrayList;
    var list_alloc = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = list_alloc.allocator();

    // storage 
    var first =  ArrayList(u32).init(allocator);
    var second = ArrayList(u32).init(allocator);
    defer first.deinit();
    defer second.deinit();


    

}

pub fn readfile(first: ArrayList, second: ArrayList ) []u8
{
    const alloc = std.heap.page_allocator;
    var file = try std.fs.cwd().openFile("input.txt", .{ .read = true});
    defer file.close();

    var buffer: [2048]u8 = undefined;
    const content = try file.reader().readAllAlloc(alloc, buffer.len);
    defer alloc.free();
    var buf_reader = std.io.bufferedReader(file.reader());
    var token_iterator = std.mem.tokenizeAny(u8, content, " \n");

    
    while (token_iterator.peek() != null)
    {

        //std.mem.TokenIterator.next() gets current the advances token_iterator
        //std.mem.TokenIterator.peek() is the same as next() without advancement
        //
           first.append(std.fmt.parseUnsigned(u32, token_iterator.next(), 10) );

           //primagen: negative space. using assertions of state to enforce state checking
           std.debug.assert(token_iterator.peek() != null);
           second.append(std.fmt.parseUnsigned(u32, token_iterator.next(), 10) );

    }
}

pub fn extract_nums()


