const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const stdOut = std.io.getStdOut().writer();
    const stdIn = std.io.getStdIn().reader();

    try stdOut.print("Hi there! I'll be swapping two numbers\n", .{});
    try stdOut.print("Enter a number A: ", .{});
    var num1 = try stdIn.readInt(u16, 10);
    try stdOut.print("Enter another number B: ", .{});
    var num2 = try stdIn.readInt(allocator, 10);

    var temp = num1;
    num1 = num2;
    num2 = temp;

    try stdOut.print("A is now: {d}\n", .{num1});
    try stdOut.print("B is now: {d}\n", .{num2});
    try stdOut.print("Thanks for playing!\n", .{});
}
