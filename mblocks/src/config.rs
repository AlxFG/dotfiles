use crate::block::Block;
#[allow(unused_imports)]
use crate::block::BlockType::{Interval, Once, Signal};
#[allow(unused_imports)]
use crate::block::CommandType::{Function, Shell};

use crate::blocks::cpu::cpu_usage;
use crate::blocks::datetime::current_time;
use crate::blocks::memory::memory_usage;

pub const SEPARATOR: &str = "";
pub const PREFIX: &str = "";
pub const SUFFIX: &str = "";

pub const BLOCKS: &[Block] = &[
    Block {
        kind: Once,
        command: Shell(&["whoami"]),
        prefix: "[",
        suffix: "]",
    },
    Block {
        kind: Interval(5),
        command: Shell(&["date", "+%a %d %H:%M"]),
        prefix: "[",
        suffix: "]",
    },
];
