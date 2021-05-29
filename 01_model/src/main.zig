const std = @import("std");

const Length = struct {
    from: usize,
    to: usize,
    fn is_satisfied(self: *const @This(), arr: []const u8) bool {
        return arr.len >= self.from and arr.len <= self.to;
    }
};

fn Field(comptime T: type, comptime cs: anytype) type {
    return struct {
        const Self = @This();
        const value_type = T;
        const constraints = cs;
        value: T,
    };
}

fn Model(comptime T: type) type {
    //switch (@typeInfo(T)) {
    //    .Struct => |m| {
    //        for (m.fields) |mf| {
    //            switch (@typeInfo(mf.field_type)) {
    //                .Struct => |f| {
    //                    // f should b instance of Field
    //                    for (f.fields) |ff| {
    //                        @compileLog(ff.field_type);
    //                    }
    //                },
    //                else => {},
    //            }
    //        }
    //    },
    //    else => {
    //        @compileError("Provided type must be struct, found " ++ @typeName(T));
    //    },
    //}
    return T;
}

const User = Model(struct {
    firstname: Field([]const u8, .{Length{ .from = 1, .to = 5 }}), // should be different
    lastname: Field([]const u8, .{Length{ .from = 1, .to = 8 }}), // should be different
});

pub fn main() anyerror!void {
    const len_check = Length{ .from = 1, .to = 2 };
    std.debug.print("{}\n", .{len_check.is_satisfied("Hello world")});

    var u = User{ .firstname = .{ .value = "Nebojsa" }, .lastname = .{ .value = "Koturovic" } };
    std.debug.print("{}\n", .{u});
}
