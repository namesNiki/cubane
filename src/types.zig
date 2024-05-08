const std = @import("std");

pub fn Vec(comptime dimension: comptime_int, comptime T: type) type {
    return struct {
        const data_type = [dimension]T;
        data: data_type,
        const Self = @This();

        pub fn init_zero() Self {
            return Self{ .data = std.mem.zeroes(data_type) };
        }

        pub fn init(data: data_type) Self {
            return Self{ .data = data };
        }
    };
}
