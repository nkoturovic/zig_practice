const std = @import("std");

pub fn main() !void {
    var al = std.ArrayList(i32).init(std.testing.allocator);
    defer al.deinit();
    try al.append(1);
    try al.append(2);
    try al.appendSlice(&.{ 3, 4, 5 });
    std.debug.print("{any}\n", .{al.items});
    std.debug.print("{}\n", .{al.items[0]});
}
