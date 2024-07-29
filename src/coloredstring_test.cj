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

package terminalcolor

import terminalcolor.color.Color
import terminalcolor.style.Style
// import std.unittest.testmacro.*
/**
 * 参考以下文档颜色定义
 * https://www.cnblogs.com/aifengqi/p/15395422.html
 * https://bixense.com/clicolors/
 * https://no-color.org/
 */
@Test
class ColoredStringTests {
    @TestCase
    func testNoGiveColor(): Unit {
        var word = "abczyx"
        // println(word.colored)
        @PowerAssert(word.colored == word)
        @PowerAssert(word == word.colored)
        word = ""
        @PowerAssert(word.colored == word)
        @PowerAssert(word.colored == word)
    }

    @TestCase
    func testBlack(): Unit {
        let word = "black"
        let colored_word = "\u{1B}[30m${word}\u{1B}[0m"
        // println(colored_word)

        @PowerAssert(word.colored.black() == colored_word)
        @PowerAssert(colored_word == word.colored.black())
        @PowerAssert(word.colored.black().toString() == colored_word)
    }

    @TestCase
    func testRed(): Unit {
        let word = "red"
        let colored_word = "\u{1B}[31m${word}\u{1B}[0m"
        // println(colored_word)

        @PowerAssert(word.colored.red() == colored_word)
        @PowerAssert(colored_word == word.colored.red())
        @PowerAssert(word.colored.red().toString() == colored_word)
    }

    @TestCase
    func testGreen(): Unit {
        let word = "green"
        let colored_word = "\u{1B}[32m${word}\u{1B}[0m"
        // println(colored_word)
        @PowerAssert(word.colored.green() == colored_word)
        @PowerAssert(colored_word == word.colored.green())
        @PowerAssert(word.colored.green().toString() == colored_word)
    }

    @TestCase
    func testYellow(): Unit {
        let word = "yellow"
        let colored_word = "\u{1B}[33m${word}\u{1B}[0m"
        // println(colored_word)

        @PowerAssert(word.colored.yellow() == colored_word)
        @PowerAssert(colored_word == word.colored.yellow())
        @PowerAssert(word.colored.yellow().toString() == colored_word)
    }

    @TestCase
    func testBlue(): Unit {
        let word = "blue"
        let colored_word = "\u{1B}[34m${word}\u{1B}[0m"
        // println(colored_word)

        @PowerAssert(word.colored.blue() == colored_word)
        @PowerAssert(colored_word == word.colored.blue())
        @PowerAssert(word.colored.blue().toString() == colored_word)
    }

    @TestCase
    func testMagenta(): Unit {
        let word = "magenta"
        let colored_word = "\u{1B}[35m${word}\u{1B}[0m"
        // println(colored_word)

        @PowerAssert(word.colored.magenta() == colored_word)
        @PowerAssert(colored_word == word.colored.magenta())
        @PowerAssert(word.colored.magenta().toString() == colored_word)
    }

    @TestCase
    func testCyan(): Unit {
        let word = "cyan"
        let colored_word = "\u{1B}[36m${word}\u{1B}[0m"
        // println(colored_word)

        @PowerAssert(word.colored.cyan() == colored_word)
        @PowerAssert(colored_word == word.colored.cyan())
        @PowerAssert(word.colored.cyan().toString() == colored_word)
    }

    @TestCase
    func testWhite(): Unit {
        let word = "white"
        let colored_word = "\u{1B}[37m${word}\u{1B}[0m"
        // println(colored_word)

        @PowerAssert(word.colored.white() == colored_word)
        @PowerAssert(colored_word == word.colored.white())
        @PowerAssert(word.colored.white().toString() == colored_word)
    }
    /**
     * 测试亮黑色
     */
    @TestCase
    func testBrightBlack(): Unit {
        let word = "bright black"
        let colored_word = "\u{1B}[90m${word}\u{1B}[0m"

        @PowerAssert(word.colored.brightblack() == colored_word)
        @PowerAssert(colored_word == word.colored.brightblack())
        @PowerAssert(word.colored.brightblack().toString() == colored_word)
    }

    /**
     * 测试亮红色
     */
    @TestCase
    func testBrightRed(): Unit {
        let word = "bright red"
        let colored_word = "\u{1B}[91m${word}\u{1B}[0m"

        @PowerAssert(word.colored.brightred() == colored_word)
        @PowerAssert(colored_word == word.colored.brightred())
        @PowerAssert(word.colored.brightred().toString() == colored_word)
    }

    /**
     * 测试亮绿色
     */
    @TestCase
    func testBrightGreen(): Unit {
        let word = "bright green"
        let colored_word = "\u{1B}[92m${word}\u{1B}[0m"

        @PowerAssert(word.colored.brightgreen() == colored_word)
        @PowerAssert(colored_word == word.colored.brightgreen())
        @PowerAssert(word.colored.brightgreen().toString() == colored_word)
    }
    /**
     * 测试亮黄色
     */
    @TestCase
    func testBrightYellow(): Unit {
        let word = "bright yellow"
        let colored_word = "\u{1B}[93m${word}\u{1B}[0m"

        @PowerAssert(word.colored.brightyellow() == colored_word)
        @PowerAssert(colored_word == word.colored.brightyellow())
        @PowerAssert(word.colored.brightyellow().toString() == colored_word)
    }

    /**
     * 测试亮蓝色
     */
    @TestCase
    func testBrightBlue(): Unit {
        let word = "bright blue"
        let colored_word = "\u{1B}[94m${word}\u{1B}[0m"

        @PowerAssert(word.colored.brightblue() == colored_word)
        @PowerAssert(colored_word == word.colored.brightblue())
        @PowerAssert(word.colored.brightblue().toString() == colored_word)
    }

    /**
     * 测试亮洋红色
     */
    @TestCase
    func testBrightMagenta(): Unit {
        let word = "bright magenta"
        let colored_word = "\u{1B}[95m${word}\u{1B}[0m"

        @PowerAssert(word.colored.brightmagenta() == colored_word)
        @PowerAssert(colored_word == word.colored.brightmagenta())
        @PowerAssert(word.colored.brightmagenta().toString() == colored_word)
    }

    /**
     * 测试亮青色
     */
    @TestCase
    func testBrightCyan(): Unit {
        let word = "bright cyan"
        let colored_word = "\u{1B}[96m${word}\u{1B}[0m"

        @PowerAssert(word.colored.brightcyan() == colored_word)
        @PowerAssert(colored_word == word.colored.brightcyan())
        @PowerAssert(word.colored.brightcyan().toString() == colored_word)
    }

    /**
     * 测试亮白色
     */
    @TestCase
    func testBrightWhite(): Unit {
        let word = "bright white"
        let colored_word = "\u{1B}[97m${word}\u{1B}[0m"

        @PowerAssert(word.colored.brightwhite() == colored_word)
        @PowerAssert(colored_word == word.colored.brightwhite())
        @PowerAssert(word.colored.brightwhite().toString() == colored_word)
    }

    @TestCase
    func testGiveColorShow(): Unit {
        //循环给出所有颜色的输出
        let enumTerminalColor = [TerminalColor.Black, TerminalColor.Red, TerminalColor.Green, TerminalColor.Yellow,
            TerminalColor.Blue, TerminalColor.Magenta, TerminalColor.Cyan, TerminalColor.White,
            TerminalColor.BrightBlack, TerminalColor.BrightRed, TerminalColor.BrightGreen, TerminalColor.BrightYellow,
            TerminalColor.BrightBlue, TerminalColor.BrightMagenta, TerminalColor.BrightCyan, TerminalColor.BrightWhite]
        var count = 0
        for (itemColor in enumTerminalColor) {
            let word = "${terminalColor2Color(itemColor)}"
            print(word.colored(color: itemColor))
            print("\t\t\t")
            count += 1
            if (count % 4 == 0) {
                println()
            }
        }
        println("---------------------------------")
    }

    @TestCase
    func testGiveStyleShow(): Unit {
        //循环给出所有单样式的输出
        let enumTerminalStyle = [TerminalStyle.Bold, TerminalStyle.Dimmed, TerminalStyle.Italic,
            TerminalStyle.Underline, TerminalStyle.Blink, TerminalStyle.Reversed, TerminalStyle.Hidden,
            TerminalStyle.Strikethrough]
        for (itemStyle in enumTerminalStyle) {
            let word = "${terminalStyle2Style(itemStyle)}"
            println(word.colored(style: itemStyle))
        }
        println("---------------------------------")
    }

    @TestCase
    func testGiveColorAndAStyleShow(): Unit {
        //循环给出所有颜色加一个样式的组合的输出
        let enumTerminalColor = [TerminalColor.Black, TerminalColor.Red, TerminalColor.Green, TerminalColor.Yellow,
            TerminalColor.Blue, TerminalColor.Magenta, TerminalColor.Cyan, TerminalColor.White,
            TerminalColor.BrightBlack, TerminalColor.BrightRed, TerminalColor.BrightGreen, TerminalColor.BrightYellow,
            TerminalColor.BrightBlue, TerminalColor.BrightMagenta, TerminalColor.Cyan, TerminalColor.White]
        let enumTerminalStyle = [TerminalStyle.Bold, TerminalStyle.Dimmed, TerminalStyle.Italic,
            TerminalStyle.Underline, TerminalStyle.Blink, TerminalStyle.Reversed, TerminalStyle.Hidden,
            TerminalStyle.Strikethrough]
        for (itemColor in enumTerminalColor) {
            var count = 0
            for (itemStyle in enumTerminalStyle) {
                let word = "${terminalColor2Color(itemColor)} with ${terminalStyle2Style(itemStyle)}"
                print(word.colored(color: itemColor, style: itemStyle))
                print("\t\t\t")
                count += 1
                if (count % 4 == 0) {
                    println()
                }
            }
            println()
        }
        println("---------------------------------")
    }

    // @TestCase
    // func testGiveColorAndTwoStylesShow(): Unit {
    //     //循环给出所有颜色加两个样式的组合的输出
    //     for (item in Style.STYLE) {
    //         println(item.toString().style(item).toString())
    //     }
    // }

    @TestCase
    func testIsPlain(): Unit {
        let word = "plain"

        // just color
        @PowerAssert(word.colored.isPlain() == true)
        @PowerAssert(word.colored.black().isPlain() == false)
        @PowerAssert(word.colored.red().isPlain() == false)

        // just style
        @PowerAssert(word.colored.clear().isPlain() == true)
        @PowerAssert(word.colored.bold().isPlain() == false)
        @PowerAssert(word.colored.blink().isPlain() == false)
        @PowerAssert(word.colored.dimmed().clear().isPlain() == true)

        // color and style for clear
        @PowerAssert(word.colored.blue().italic().isPlain() == false)
        @PowerAssert(word.colored.italic().yellow().isPlain() == false)
        @PowerAssert(word.colored.underline().cyan().clear().isPlain() == true)
        @PowerAssert(word.colored.green().reversed().clear().isPlain() == true)

        // color and style for clearFgColor
        @PowerAssert(word.colored.blue().italic().clearFgColor().isPlain() == false)
        @PowerAssert(word.colored.italic().yellow().clearFgColor().isPlain() == false)
        @PowerAssert(word.colored.underline().clearFgColor().isPlain() == false)
        @PowerAssert(word.colored.green().clearFgColor().isPlain() == true)
    }

    @TestCase
    func testTerminalColor2Color(): Unit {
        @Assert(if (let Color.Black <- terminalColor2Color(TerminalColor.Black)){ true } else { false })
        @Assert(if (let Color.Red <- terminalColor2Color(TerminalColor.Red)){ true } else { false })
        @Assert(if (let Color.Green <- terminalColor2Color(TerminalColor.Green)){ true } else { false})
        @Assert(if (let Color.Yellow <- terminalColor2Color(TerminalColor.Yellow)){ true } else { false })
        @Assert(if (let Color.Blue <- terminalColor2Color(TerminalColor.Blue)){ true } else { false })
        @Assert(if (let Color.Magenta <- terminalColor2Color(TerminalColor.Magenta)){ true } else { false })
        @Assert(if (let Color.Cyan <- terminalColor2Color(TerminalColor.Cyan)){ true } else { false })
        @Assert(if (let Color.White <- terminalColor2Color(TerminalColor.White)){ true } else { false })
        @Assert(if (let Color.BrightBlack <- terminalColor2Color(TerminalColor.BrightBlack)){ true } else { false })
        @Assert(if (let Color.BrightRed <- terminalColor2Color(TerminalColor.BrightRed)){ true } else { false })
        @Assert(if (let Color.BrightGreen <- terminalColor2Color(TerminalColor.BrightGreen)){ true } else { false })
        @Assert(if (let Color.BrightYellow <- terminalColor2Color(TerminalColor.BrightYellow)){ true } else { false })
        @Assert(if (let Color.BrightBlue <- terminalColor2Color(TerminalColor.BrightBlue)){ true } else { false })
        @Assert(if (let Color.BrightMagenta <- terminalColor2Color(TerminalColor.BrightMagenta)){ true } else { false })
        @Assert(if (let Color.BrightCyan <- terminalColor2Color(TerminalColor.BrightCyan)){ true } else { false })
        @Assert(if (let Color.BrightWhite <- terminalColor2Color(TerminalColor.BrightWhite)){ true } else { false })
    }

    @TestCase
    func testTerminalStyle2Style(): Unit {
        @Assert(if (let Style.Bold <- terminalStyle2Style(TerminalStyle.Bold)){ true } else { false })
        @Assert(if (let Style.Dimmed <- terminalStyle2Style(TerminalStyle.Dimmed)){ true } else { false })
        @Assert(if (let Style.Italic <- terminalStyle2Style(TerminalStyle.Italic)){ true } else { false })
        @Assert(if (let Style.Underline <- terminalStyle2Style(TerminalStyle.Underline)){ true } else { false })
        @Assert(if (let Style.Blink <- terminalStyle2Style(TerminalStyle.Blink)){ true } else { false })
        @Assert(if (let Style.Reversed <- terminalStyle2Style(TerminalStyle.Reversed)){ true } else { false })
        @Assert(if (let Style.Hidden <- terminalStyle2Style(TerminalStyle.Hidden)){ true } else { false })
        @Assert(if (let Style.Strikethrough <- terminalStyle2Style(TerminalStyle.Strikethrough)){ true } else { false })
    }

    /**
     * 测试操作符重载函数（Function Call Operator）
     * 指定颜色
     * public operator func ()(color!: TerminalColor): This
     */
    @TestCase
    func testFunctionCallOperatorWithColor(): Unit {
        let word = "abc"
        let colored_word = "\u{1B}[31m${word}\u{1B}[0m"

        @PowerAssert(word.colored(color:TerminalColor.Red) == colored_word)
        @PowerAssert(colored_word == word.colored(color:TerminalColor.Red))
        @PowerAssert(word.colored(color:TerminalColor.Red).toString() == colored_word)
    }

    /**
     * 测试操作符重载函数（Function Call Operator）
     * 指定样式
     * public operator func ()(style!: TerminalStyle): This
     */
    @TestCase
    func testFunctionCallOperatorWithStyle(): Unit {
        let word = "abc"
        let styled_word = "\u{1B}[1m${word}\u{1B}[0m"

        @PowerAssert(word.colored(style:TerminalStyle.Bold) == styled_word)
        @PowerAssert(styled_word == word.colored(style:TerminalStyle.Bold))
        @PowerAssert(word.colored(style:TerminalStyle.Bold).toString() == styled_word)
    }

    /**
     * 测试操作符重载函数（Function Call Operator）
     * 指定一个颜色和一个样式
     * public operator func ()(color!: TerminalColor, style!: TerminalStyle): This
     */
    @TestCase
    func testFunctionCallOperatorWithColorAndStyle(): Unit {
        let word = "abc"
        let colored_styled_word = "\u{1B}[1;31m${word}\u{1B}[0m"

        @PowerAssert(word.colored(color:TerminalColor.Red, style:TerminalStyle.Bold) == colored_styled_word)
        @PowerAssert(colored_styled_word == word.colored(color:TerminalColor.Red, style:TerminalStyle.Bold))
        @PowerAssert(word.colored(color:TerminalColor.Red, style:TerminalStyle.Bold).toString() == colored_styled_word)
    }
}
