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
        @PowerAssert(Style.Bold.toString() == "Bold")
        @PowerAssert(Style.Dimmed.toString() == "Dimmed")
        @PowerAssert(Style.Italic.toString() == "Italic")
        @PowerAssert(Style.Underline.toString() == "Underline")
        @PowerAssert(Style.Blink.toString() == "Blink")
        @PowerAssert(Style.Reversed.toString() == "Reversed")
        @PowerAssert(Style.Hidden.toString() == "Hidden")
        @PowerAssert(Style.Strikethrough.toString() == "Strikethrough")
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

    // @TestCase
    // func testStyleSize(): Unit {
    //     @PowerAssert(8 == Style.STYLE.size)
    // }

    /**
     * 测试 Equal 接口的重载==函数
     */
    @TestCase
    func testEqual(): Unit {
        @PowerAssert(Style.Bold == Style.Bold)
        @PowerAssert(Style.Dimmed == Style.Dimmed)
        @PowerAssert(Style.Italic == Style.Italic)
        @PowerAssert(Style.Underline == Style.Underline)
        @PowerAssert(Style.Blink == Style.Blink)
        @PowerAssert(Style.Reversed == Style.Reversed)
        @PowerAssert(Style.Hidden == Style.Hidden)
        @PowerAssert(Style.Strikethrough == Style.Strikethrough)

        @PowerAssert(!(Style.Bold == Style.Dimmed))
        @PowerAssert(!(Style.Reversed == Style.Italic))
    }

    /**
     * 测试 NotEqual 接口的重载!=函数
     */
    @TestCase
    func testNotEqual(): Unit {
        @PowerAssert((Style.Bold != Style.Dimmed))
        @PowerAssert((Style.Dimmed != Style.Italic))
        @PowerAssert((Style.Italic != Style.Underline))
        @PowerAssert((Style.Underline != Style.Hidden))
        @PowerAssert((Style.Blink != Style.Reversed))
        @PowerAssert((Style.Reversed != Style.Bold))
        @PowerAssert((Style.Hidden != Style.Strikethrough))
        @PowerAssert((Style.Strikethrough != Style.Bold))

        @PowerAssert(!(Style.Bold != Style.Bold))
        @PowerAssert(!(Style.Strikethrough != Style.Strikethrough))
    }

    /**
     * 测试 toStyleValue 函数
     */
    @TestCase
    func testToStyleValue(): Unit {
        @PowerAssert(Style.Bold.toStyleValue() == BOLD)
        @PowerAssert(Style.Dimmed.toStyleValue() == DIMMED)
        @PowerAssert(Style.Italic.toStyleValue() == ITALIC)
        @PowerAssert(Style.Underline.toStyleValue() == UNDERLINE)
        @PowerAssert(Style.Blink.toStyleValue() == BLINK)
        @PowerAssert(Style.Reversed.toStyleValue() == REVERSED)
        @PowerAssert(Style.Hidden.toStyleValue() == HIDDEN)
        @PowerAssert(Style.Strikethrough.toStyleValue() == STRIKETHROUGH)
    }
}
