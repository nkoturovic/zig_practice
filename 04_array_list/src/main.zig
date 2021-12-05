const std = @import("std");

pub fn main() !void {
    {
        var gpa = std.heap.GeneralPurposeAllocator(.{}){};

        var xs = std.ArrayList(i32).init(&gpa.allocator);
        defer xs.deinit();
        
        try xs.append(1);
        try xs.appendSlice(&.{ 2, 3, 4});
        std.debug.print("Gpa ArrayList: {any}\n", .{xs.items});
    }
    {
        // Arena allocator
        var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
        defer arena.deinit();
        var xs = std.ArrayList(i32).init(&arena.allocator);
        try xs.append(1);
        try xs.append(2);
        try xs.appendSlice(&.{ 2, 4, 5 });
        std.debug.print("Arena ArrayList: {any}\n", .{xs.items});
    }
}
