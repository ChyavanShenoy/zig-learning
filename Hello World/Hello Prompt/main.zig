const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();

    try stdout.print("Hello, What is your name?\nEnter your name here: ", .{});

    var name = try stdin.readUntilDelimiterAlloc(allocator, '\n', 100);

    if (name.len < 1) {
        name = try allocator.alloc(u8, 5);
        std.mem.copy(u8, name, "Guest");
    }

    try stdout.print("Hello, {s}! Nice to meet you!", .{name});
}
