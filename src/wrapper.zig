const ncs = @cImport({
    @cInclude("curses.h");
});

pub const nc = struct {
    pub fn initscr() void {
        _ = ncs.initscr();
    }

    pub fn mvaddch(x: f32, y: f32, char: u8) void {
        _ = ncs.mvaddch(@as(c_int, @intFromFloat(x)), @as(c_int, @intFromFloat(y)), char);
    }

    pub fn curs_set(x: i32) void {
        _ = ncs.curs_set(x);
    }

    pub fn refresh() void {
        _ = ncs.refresh();
    }

    pub fn endwin() void {
        _ = ncs.endwin();
    }

    pub fn getch() i32 {
        return ncs.getch();
    }
};
