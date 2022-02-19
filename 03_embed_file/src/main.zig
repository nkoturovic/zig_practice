const std = @import("std");

const Hero = struct { attack: u32, armor: u32 };

pub fn main() !void {
    const hero: Hero = comptime blk: {
        @setEvalBranchQuota(10000);
        const fc = @embedFile("../file.json");
        var stream = std.json.TokenStream.init(fc);
        var res = std.json.parse(Hero, &stream, .{});
        break :blk res catch unreachable;
    };

    @compileLog("Armor from file.json: ", hero.armor);
}
