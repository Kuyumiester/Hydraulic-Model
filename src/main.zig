const std = @import("std");

const hydraulic_system = @import("testsystem.zig");

pub fn main() !void {
    const first_pipe = component_reference{ .pipe = &hydraulic_system.a1 };
    const system_pressure: f32 = 1; //minimum pressure / bottleneck 1 pressure
    _ = findBottleneck(first_pipe);
    findPressure(first_pipe, system_pressure);
}

fn findBottleneck(pointer: component_reference) f32 {
    switch (pointer) {
        .pipe => |p| {
            if (p.*.downstream != null) {
                p.*.bottleneck_area = findBottleneck(p.*.downstream.?);
                if (p.*.bottleneck_area > p.*.area) {
                    p.*.is_bottleneck = true;
                    return p.*.area;
                } else return p.*.bottleneck_area;
            } else {
                p.*.bottleneck_area = p.*.area;
                p.*.is_bottleneck = true;
                return p.*.bottleneck_area;
            }
        },
        .valve => unreachable,
        .branch => |branch_pointer| {
            var btl: f32 = 0;
            for (branch_pointer.*) |v| {
                btl += findBottleneck(v);
            }
            return btl;
        },
    }
}

fn findPressure(pointer: component_reference, pressure: f32) void {
    switch (pointer) {
        .pipe => |p| {
            if (p.*.downstream == null) {
                p.*.pressure = pressure;
                std.debug.print("\npressure: {d}", .{p.*.pressure});
                return;
            }
            if (p.*.is_bottleneck) {
                p.*.pressure = pressure;
                std.debug.print("\npressure: {d}", .{p.*.pressure});
                findPressure(p.*.downstream.?, p.*.bottleneck_area / pressure);
            } else {
                p.*.pressure = pressure * p.*.area / p.*.bottleneck_area;
                std.debug.print("\npressure: {d}", .{p.*.pressure});
                findPressure(p.*.downstream.?, pressure);
            }
        },
        .valve => unreachable,
        .branch => |branch_pointer| for (branch_pointer.*) |v| {
            findPressure(v, pressure);
        },
    }
}

pub const component_reference = union(enum) {
    pipe: *pipe,
    valve: *valve,
    branch: *[2]component_reference,
};

pub const pipe = struct {
    pressure: f32 = undefined,
    area: f32,
    downstream: ?component_reference,
    is_bottleneck: bool = false,
    bottleneck_area: f32 = undefined,
};

pub const valve = struct {
    open: bool,
    downstream: ?component_reference,
};
