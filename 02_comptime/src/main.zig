const std = @import("std");

fn factorial(n: u64) u64 {
    return switch (n) {
        0 | 1 => 1,
        else => n * factorial(n - 1),
    };
}

pub fn main() !void {
    const x = comptime factorial(5);
    var xs : [x]i32 = [_]i32 { 0 } ** x;

    std.debug.print("{any}\n", .{xs});
}
