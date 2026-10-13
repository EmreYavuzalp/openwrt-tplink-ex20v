#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-2.0-only
# Usage: ex20v-tctag.py <in-lzma> <out-file>

import struct
import sys

TCTAG_TEMPLATE = bytes.fromhex(
    "03000003021cf72d09b6f509132c594d"
    "bf272622cccc2233445566778899aabb"
    "ccddeeff000000000000000000000000"
    "000000000134a14a5900000001000000"
    "00000000000000000000000000000000"
    "0000000055aa55aaf1e2d3c4e5a66a5e"
    "4c3d2e1faa55aa550020008090658a80"
    "0000280200020000e9cc420000006000"
    "0090f40000000000000000000500aa55"
    "000800a500000000befc7191ffffffff"
    "ffffffffffffffffffffffffffffffff"
    "ffffffffffffffffffffffffffffffff"
    "ffffffffffffffffffffffffffffffff"
    "00000000000000000000000000000000"
    "00000000000000000000000000000000"
    "00000000000000000000000000000000"
    "00000000000000000000000000000000"
    "00000000000000000000000000000000"
    "00000000000000000000000000000000"
    "00000000000000000000000000000000"
    "00000000000000000000000000000000"
    "00000000000000000000000000000000"
    "00000000000000000000000000000000"
    "00000000000000000000000000000000"
    "00000000000000000000000000000000"
    "00000000000000000000000000000000"
    "00000000000000000000000000000000"
    "00000000000000000000000000000000"
    "00000000000000000000000000000000"
    "ffffffffffffffffffffffffffffffff"
    "ffffffffffffffffffffffffffffffff"
    "ffffffffffffffffffffffffffffffff"
)
assert len(TCTAG_TEMPLATE) == 0x200, hex(len(TCTAG_TEMPLATE))

OFF_ENTRY = 0x6C
OFF_KLEN = 0x78
OFF_RFSOFF = 0x7C
OFF_RFSLEN = 0x80

ENTRY = 0x80002000


def make_tag(lzma, entry=ENTRY, rootfs_off=0, rootfs_len=0):
    tag = bytearray(TCTAG_TEMPLATE)
    struct.pack_into("<I", tag, OFF_ENTRY, entry)
    struct.pack_into("<I", tag, OFF_KLEN, len(lzma))
    struct.pack_into("<I", tag, OFF_RFSOFF, rootfs_off)
    struct.pack_into("<I", tag, OFF_RFSLEN, rootfs_len)
    return bytes(tag)


def main():
    if len(sys.argv) != 3:
        sys.exit("usage: ex20v-tctag.py <in-lzma> <out-file>")
    lzma = open(sys.argv[1], "rb").read()
    out = make_tag(lzma) + lzma
    open(sys.argv[2], "wb").write(out)


if __name__ == "__main__":
    main()
