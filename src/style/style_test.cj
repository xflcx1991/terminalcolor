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

internal package terminalcolor.style

@Test
class StyleTests {
    @TestCase
    func testToString(): Unit {
        @PowerAssert(Style.Bold.toString() == "Bold-code:1")
        @PowerAssert(Style.Dimmed.toString() == "Dimmed-code:2")
        @PowerAssert(Style.Italic.toString() == "Italic-code:3")
        @PowerAssert(Style.Underline.toString() == "Underline-code:4")
        @PowerAssert(Style.Blink.toString() == "Blink-code:5")
        @PowerAssert(Style.Reversed.toString() == "Reversed-code:7")
        @PowerAssert(Style.Hidden.toString() == "Hidden-code:8")
        @PowerAssert(Style.Strikethrough.toString() == "Strikethrough-code:9")
    }
    @TestCase
    func testToStyleString(): Unit {
        @PowerAssert(Style.Bold.toStyleString() == "1")
        @PowerAssert(Style.Dimmed.toStyleString() == "2")
        @PowerAssert(Style.Italic.toStyleString() == "3")
        @PowerAssert(Style.Underline.toStyleString() == "4")
        @PowerAssert(Style.Blink.toStyleString() == "5")
        @PowerAssert(Style.Reversed.toStyleString() == "7")
        @PowerAssert(Style.Hidden.toStyleString() == "8")
        @PowerAssert(Style.Strikethrough.toStyleString() == "9")
    }

    @TestCase
    func testStyleSize(): Unit {
        @PowerAssert(8 == Style.STYLE.size)
    }
}
