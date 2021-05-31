const std = @import("std");

fn factorial(n: u64) u64 {
    return switch (n) {
        0 | 1 => 1,
        else => n * factorial(n - 1),
    };
}

pub fn main() u8 {
    // const nargs = @truncate(u8, std.os.argv.len);
    // const f = factorial(nargs);
    const f = factorial(5);
    return @truncate(u8, f);
}
