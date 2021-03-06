const std = @import("std");

pub const Mat4 = [4][4]f32;

pub inline fn matrixTranslation(tx: f32, ty: f32, tz: f32) Mat4 {
    return Mat4{
        [_]f32{ 1.0, 0.0, 0.0, 0.0 },
        [_]f32{ 0.0, 1.0, 0.0, 0.0 },
        [_]f32{ 0.0, 0.0, 1.0, 0.0 },
        [_]f32{ tx, ty, tz, 1.0 },
    };
}

pub inline fn matrixPerspectiveRightHand(fovy_radians: f32, aspect: f32, near_z: f32, far_z: f32) Mat4 {
    const ys = 1 / std.math.tan(fovy_radians * 0.5);
    const xs = ys / aspect;
    const zs = far_z / (near_z - far_z);

    return Mat4{
        [_]f32{ xs, 0.0, 0.0, 0.0 },
        [_]f32{ 0.0, ys, 0.0, 0.0 },
        [_]f32{ 0.0, 0.0, zs, -1.0 },
        [_]f32{ 0.0, 0.0, near_z * zs, 1.0 },
    };
}

pub inline fn matrixMultiply(x: Mat4, y: Mat4) Mat4 {
    // zig fmt: off
    return Mat4{[_]f32{ y[0][0] * x[0][0] + y[0][1] * x[1][0] + y[0][2] * x[2][0] + y[0][3] * x[3][0],
                        y[0][0] * x[0][1] + y[0][1] * x[1][1] + y[0][2] * x[2][1] + y[0][3] * x[3][1],
                        y[0][0] * x[0][2] + y[0][1] * x[1][2] + y[0][2] * x[2][2] + y[0][3] * x[3][2],
                        y[0][0] * x[0][3] + y[0][1] * x[1][3] + y[0][2] * x[2][3] + y[0][3] * x[3][3],},
                [_]f32{ y[1][0] * x[0][0] + y[1][1] * x[1][0] + y[1][2] * x[2][0] + y[1][3] * x[3][0],
                        y[1][0] * x[0][1] + y[1][1] * x[1][1] + y[1][2] * x[2][1] + y[1][3] * x[3][1],
                        y[1][0] * x[0][2] + y[1][1] * x[1][2] + y[1][2] * x[2][2] + y[1][3] * x[3][2],
                        y[1][0] * x[0][3] + y[1][1] * x[1][3] + y[1][2] * x[2][3] + y[1][3] * x[3][3],},
                [_]f32{ y[2][0] * x[0][0] + y[2][1] * x[1][0] + y[2][2] * x[2][0] + y[2][3] * x[3][0],
                        y[2][0] * x[0][1] + y[2][1] * x[1][1] + y[2][2] * x[2][1] + y[2][3] * x[3][1],
                        y[2][0] * x[0][2] + y[2][1] * x[1][2] + y[2][2] * x[2][2] + y[2][3] * x[3][2],
                        y[2][0] * x[0][3] + y[2][1] * x[1][3] + y[2][2] * x[2][3] + y[2][3] * x[3][3],},
                [_]f32{ y[3][0] * x[0][0] + y[3][1] * x[1][0] + y[3][2] * x[2][0] + y[3][3] * x[3][0],
                        y[3][0] * x[0][1] + y[3][1] * x[1][1] + y[3][2] * x[2][1] + y[3][3] * x[3][1],
                        y[3][0] * x[0][2] + y[3][1] * x[1][2] + y[3][2] * x[2][2] + y[3][3] * x[3][2],
                        y[3][0] * x[0][3] + y[3][1] * x[1][3] + y[3][2] * x[2][3] + y[3][3] * x[3][3],},};
    // zig fmt: on
}
