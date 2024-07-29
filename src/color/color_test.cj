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
        @PowerAssert(Color.Black.toString() == "Black")
        @PowerAssert(Color.Red.toString() == "Red")
        @PowerAssert(Color.Green.toString() == "Green")
        @PowerAssert(Color.Yellow.toString() == "Yellow")
        @PowerAssert(Color.Blue.toString() == "Blue")
        @PowerAssert(Color.Magenta.toString() == "Magenta")
        @PowerAssert(Color.Cyan.toString() == "Cyan")
        @PowerAssert(Color.White.toString() == "White")
        @PowerAssert(Color.BrightBlack.toString() == "BrightBlack")
        @PowerAssert(Color.BrightRed.toString() == "BrightRed")
        @PowerAssert(Color.BrightGreen.toString() == "BrightGreen")
        @PowerAssert(Color.BrightYellow.toString() == "BrightYellow")
        @PowerAssert(Color.BrightBlue.toString() == "BrightBlue")
        @PowerAssert(Color.BrightMagenta.toString() == "BrightMagenta")
        @PowerAssert(Color.BrightCyan.toString() == "BrightCyan")
        @PowerAssert(Color.BrightWhite.toString() == "BrightWhite")
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

    // @TestCase
    // func testColorSize(): Unit {
    //     @PowerAssert(16 == Color.COLOR.size)
    // }

    /**
     * 测试 Equal 接口的重载==函数
     */
    @TestCase
    func testEqual(): Unit {
        @PowerAssert(Color.Black == Color.Black)
        @PowerAssert(Color.Red == Color.Red)
        @PowerAssert(Color.Green == Color.Green)
        @PowerAssert(Color.Yellow == Color.Yellow)
        @PowerAssert(Color.Blue == Color.Blue)
        @PowerAssert(Color.Magenta == Color.Magenta)
        @PowerAssert(Color.Cyan == Color.Cyan)
        @PowerAssert(Color.White == Color.White)
        @PowerAssert(Color.BrightBlack == Color.BrightBlack)
        @PowerAssert(Color.BrightRed == Color.BrightRed)
        @PowerAssert(Color.BrightGreen == Color.BrightGreen)
        @PowerAssert(Color.BrightYellow == Color.BrightYellow)
        @PowerAssert(Color.BrightBlue == Color.BrightBlue)
        @PowerAssert(Color.BrightMagenta == Color.BrightMagenta)
        @PowerAssert(Color.BrightCyan == Color.BrightCyan)
        @PowerAssert(Color.BrightWhite == Color.BrightWhite)

        @PowerAssert(!(Color.Black == Color.BrightBlack))
        @PowerAssert(!(Color.Cyan == Color.BrightBlue))
    }

    /**
     * 测试 NotEqual 接口的重载!=函数
     */
    @TestCase
    func testNotEqual(): Unit {
        @PowerAssert(Color.Black != Color.Red)
        @PowerAssert(Color.Red != Color.Green)
        @PowerAssert(Color.Green != Color.Yellow)
        @PowerAssert(Color.Yellow != Color.Blue)
        @PowerAssert(Color.Blue != Color.Magenta)
        @PowerAssert(Color.Magenta != Color.Cyan)
        @PowerAssert(Color.Cyan != Color.White)
        @PowerAssert(Color.White != Color.BrightBlack)
        @PowerAssert(Color.BrightBlack != Color.BrightRed)
        @PowerAssert(Color.BrightRed != Color.BrightGreen)
        @PowerAssert(Color.BrightGreen != Color.BrightYellow)
        @PowerAssert(Color.BrightYellow != Color.BrightBlue)
        @PowerAssert(Color.BrightBlue != Color.BrightMagenta)
        @PowerAssert(Color.BrightMagenta != Color.BrightCyan)
        @PowerAssert(Color.BrightCyan != Color.BrightWhite)
        @PowerAssert(Color.BrightWhite != Color.Black)

        @PowerAssert(!(Color.Black != Color.Black))
        @PowerAssert(!(Color.Cyan != Color.Cyan))
    }
}
