const std = @import("std");
const ncs = @import("wrapper.zig");
const types = @import("types.zig");
const drawing = @import("basic_drawing.zig");
const Vec = types.Vec;

const nc = ncs.nc;

pub fn msleep(miliseconds: u64) void {
    std.time.sleep(miliseconds * 1_000_000);
}

pub fn main() !void {
    nc.initscr();

    const point0 = Vec(2, f32).init([_]f32{ 0, 0 });
    const point1 = Vec(2, f32).init([_]f32{ 50, 50 });

    drawing.plot(point0);
    drawing.plot(point1);

    const i = drawing.draw_line(point0, point1);

    nc.refresh();
    _ = nc.getch();
    nc.endwin();

    std.debug.print("{}", .{i});
}
