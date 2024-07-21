/* cjlint-ignore -start !G.OTH.03  suppress this stupid warning */
/**
 * Copyright (c) 2024 xffish(xffish#126.com)
 * terminalcolor is licensed under Mulan PSL v2.
 * You can use this software according to the terms and conditions of the Mulan PSL v2.
 * You may obtain a copy of Mulan PSL v2 at:
 *          https://license.coscl.org.cn/MulanPSL2
 * THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
 * EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */
/* cjlint-ignore -end suppress this stupid warning */

internal package terminalcolor.color

@Test
class ColorTests {
    @TestCase
    func testToString(): Unit {
        @PowerAssert(Color.Black.toString() == "Black-fg:30-bg:40")
        @PowerAssert(Color.Red.toString() == "Red-fg:31-bg:41")
        @PowerAssert(Color.Green.toString() == "Green-fg:32-bg:42")
        @PowerAssert(Color.Yellow.toString() == "Yellow-fg:33-bg:43")
        @PowerAssert(Color.Blue.toString() == "Blue-fg:34-bg:44")
        @PowerAssert(Color.Magenta.toString() == "Magenta-fg:35-bg:45")
        @PowerAssert(Color.Cyan.toString() == "Cyan-fg:36-bg:46")
        @PowerAssert(Color.White.toString() == "White-fg:37-bg:47")
        @PowerAssert(Color.BrightBlack.toString() == "BrightBlack-fg:90-bg:100")
        @PowerAssert(Color.BrightRed.toString() == "BrightRed-fg:91-bg:101")
        @PowerAssert(Color.BrightGreen.toString() == "BrightGreen-fg:92-bg:102")
        @PowerAssert(Color.BrightYellow.toString() == "BrightYellow-fg:93-bg:103")
        @PowerAssert(Color.BrightBlue.toString() == "BrightBlue-fg:94-bg:104")
        @PowerAssert(Color.BrightMagenta.toString() == "BrightMagenta-fg:95-bg:105")
        @PowerAssert(Color.BrightCyan.toString() == "BrightCyan-fg:96-bg:106")
        @PowerAssert(Color.BrightWhite.toString() == "BrightWhite-fg:97-bg:107")
    }

    @TestCase
    func testToFgStr(): Unit {
        @PowerAssert(Color.Black.toFgStr() == "30")
        @PowerAssert(Color.Red.toFgStr() == "31")
        @PowerAssert(Color.Green.toFgStr() == "32")
        @PowerAssert(Color.Yellow.toFgStr() == "33")
        @PowerAssert(Color.Blue.toFgStr() == "34")
        @PowerAssert(Color.Magenta.toFgStr() == "35")
        @PowerAssert(Color.Cyan.toFgStr() == "36")
        @PowerAssert(Color.White.toFgStr() == "37")
        @PowerAssert(Color.BrightBlack.toFgStr() == "90")
        @PowerAssert(Color.BrightRed.toFgStr() == "91")
        @PowerAssert(Color.BrightGreen.toFgStr() == "92")
        @PowerAssert(Color.BrightYellow.toFgStr() == "93")
        @PowerAssert(Color.BrightBlue.toFgStr() == "94")
        @PowerAssert(Color.BrightMagenta.toFgStr() == "95")
        @PowerAssert(Color.BrightCyan.toFgStr() == "96")
        @PowerAssert(Color.BrightWhite.toFgStr() == "97")
    }

    @TestCase
    func testToBgStr(): Unit {
        @PowerAssert(Color.Black.toBgStr() == "40")
        @PowerAssert(Color.Red.toBgStr() == "41")
        @PowerAssert(Color.Green.toBgStr() == "42")
        @PowerAssert(Color.Yellow.toBgStr() == "43")
        @PowerAssert(Color.Blue.toBgStr() == "44")
        @PowerAssert(Color.Magenta.toBgStr() == "45")
        @PowerAssert(Color.Cyan.toBgStr() == "46")
        @PowerAssert(Color.White.toBgStr() == "47")
        @PowerAssert(Color.BrightBlack.toBgStr() == "100")
        @PowerAssert(Color.BrightRed.toBgStr() == "101")
        @PowerAssert(Color.BrightGreen.toBgStr() == "102")
        @PowerAssert(Color.BrightYellow.toBgStr() == "103")
        @PowerAssert(Color.BrightBlue.toBgStr() == "104")
        @PowerAssert(Color.BrightMagenta.toBgStr() == "105")
        @PowerAssert(Color.BrightCyan.toBgStr() == "106")
        @PowerAssert(Color.BrightWhite.toBgStr() == "107")
    }

    @TestCase
    func testColorSize(): Unit {
        @PowerAssert(16 == Color.COLOR.size)
    }
}
