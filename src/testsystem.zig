//
//  this file holds data that represents a hydraulic system
//

const main = @import("main.zig");
const pipe = main.pipe;
const component_reference = main.component_reference;

pub var a1 = pipe{
    .area = 32,
    .downstream = component_reference{ .pipe = &a2 },
};
pub var a2 = pipe{
    .area = 6,
    .downstream = component_reference{ .pipe = &a3 },
};
pub var a3 = pipe{
    .area = 15,
    .downstream = component_reference{ .branch = &b },
};
pub var b = [2]component_reference{ component_reference{ .pipe = &b1 }, component_reference{ .pipe = &b2 } };

pub var b1 = pipe{
    .area = 24,
    .downstream = component_reference{ .branch = &c },
};
pub var b2 = pipe{
    .area = 21,
    .downstream = component_reference{ .branch = &d },
};

pub var c = [2]component_reference{ component_reference{ .pipe = &c1 }, component_reference{ .pipe = &c2 } };
pub var c1 = pipe{
    .area = 28,
    .downstream = null, //component_reference{ .pipe = & },
};
pub var c2 = pipe{
    .area = 13,
    .downstream = component_reference{ .pipe = &c3 },
};
pub var c3 = pipe{
    .area = 5,
    .downstream = null, //component_reference{ .pipe = & },
};

pub var d = [2]component_reference{ component_reference{ .pipe = &d1 }, component_reference{ .pipe = &d2 } };
pub var d1 = pipe{
    .area = 20,
    .downstream = component_reference{ .branch = &e },
};
pub var d2 = pipe{
    .area = 3,
    .downstream = component_reference{ .pipe = &d3 },
};
pub var d3 = pipe{
    .area = 17,
    .downstream = component_reference{ .branch = &f },
};

pub var e = [2]component_reference{ component_reference{ .pipe = &e1 }, component_reference{ .pipe = &e2 } };
pub var e1 = pipe{
    .area = 19,
    .downstream = null, //component_reference{ .branch = &e },
};
pub var e2 = pipe{
    .area = 10,
    .downstream = null, //component_reference{ .pipe = &d3 },
};

pub var f = [2]component_reference{ component_reference{ .pipe = &f1 }, component_reference{ .pipe = &f2 } };
pub var f1 = pipe{
    .area = 4,
    .downstream = null, //component_reference{ .pipe = & },
};
pub var f2 = pipe{
    .area = 14,
    .downstream = component_reference{ .pipe = &f3 },
};
pub var f3 = pipe{
    .area = 18,
    .downstream = null, //component_reference{ .branch = & },
};
