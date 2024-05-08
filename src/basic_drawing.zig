const std = @import("std");
const ncs = @import("wrapper.zig");
const types = @import("types.zig");
const Vec = types.Vec;

const nc = ncs.nc;

pub fn plot(point: Vec(2, f32)) void {
    nc.mvaddch(point.data[0], point.data[1], '#');
}

pub fn draw_line(point0: Vec(2, f32), point1: Vec(2, f32)) i32 {
    const x0: i32 = @intFromFloat(point0.data[0]);
    const x1: i32 = @intFromFloat(point0.data[1]);
    const y0: i32 = @intFromFloat(point1.data[0]);
    const y1: i32 = @intFromFloat(point1.data[1]);

    const dx: i32 = x1 - x0;
    const dy: i32 = y1 - y0;

    const steps = if (@abs(dx) > @abs(dy)) @abs(dx) else @abs(dy);

    const steps_signed: i32 = @intCast(steps);

    const x_inc = dx / steps_signed;
    const y_inc = dy / steps_signed;

    var x = x0;
    var y = y0;
    for (0..@as(usize, @intFromFloat(steps))) |_| {
        std.debug.print("aaaa", .{});
        plot(Vec(2, f32).init([_]f32{ x, y }));
        x += x_inc;
        y += y_inc;
    }

    // var i: i32 = 0;
    // while (i < @as(usize, @intFromFloat(steps))) : (i += 1) {
    //     // std.debug.print("aaaa", .{});
    //     plot(Vec(2, f32).init([_]f32{ x, y }));
    //     x += x_inc;
    //     y += y_inc;

    //     std.debug.print("{}, {}\n", .{ x, y });
    // }

    return 0;
}
