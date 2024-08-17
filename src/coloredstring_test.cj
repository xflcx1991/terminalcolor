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

        @PowerAssert(word.colored.brightBlack() == colored_word)
        @PowerAssert(colored_word == word.colored.brightBlack())
        @PowerAssert(word.colored.brightBlack().toString() == colored_word)
    }

    /**
     * 测试亮红色
     */
    @TestCase
    func testBrightRed(): Unit {
        let word = "bright red"
        let colored_word = "\u{1B}[91m${word}\u{1B}[0m"

        @PowerAssert(word.colored.brightRed() == colored_word)
        @PowerAssert(colored_word == word.colored.brightRed())
        @PowerAssert(word.colored.brightRed().toString() == colored_word)
    }

    /**
     * 测试亮绿色
     */
    @TestCase
    func testBrightGreen(): Unit {
        let word = "bright green"
        let colored_word = "\u{1B}[92m${word}\u{1B}[0m"

        @PowerAssert(word.colored.brightGreen() == colored_word)
        @PowerAssert(colored_word == word.colored.brightGreen())
        @PowerAssert(word.colored.brightGreen().toString() == colored_word)
    }
    /**
     * 测试亮黄色
     */
    @TestCase
    func testBrightYellow(): Unit {
        let word = "bright yellow"
        let colored_word = "\u{1B}[93m${word}\u{1B}[0m"

        @PowerAssert(word.colored.brightYellow() == colored_word)
        @PowerAssert(colored_word == word.colored.brightYellow())
        @PowerAssert(word.colored.brightYellow().toString() == colored_word)
    }

    /**
     * 测试亮蓝色
     */
    @TestCase
    func testBrightBlue(): Unit {
        let word = "bright blue"
        let colored_word = "\u{1B}[94m${word}\u{1B}[0m"

        @PowerAssert(word.colored.brightBlue() == colored_word)
        @PowerAssert(colored_word == word.colored.brightBlue())
        @PowerAssert(word.colored.brightBlue().toString() == colored_word)
    }

    /**
     * 测试亮洋红色
     */
    @TestCase
    func testBrightMagenta(): Unit {
        let word = "bright magenta"
        let colored_word = "\u{1B}[95m${word}\u{1B}[0m"

        @PowerAssert(word.colored.brightMagenta() == colored_word)
        @PowerAssert(colored_word == word.colored.brightMagenta())
        @PowerAssert(word.colored.brightMagenta().toString() == colored_word)
    }

    /**
     * 测试亮青色
     */
    @TestCase
    func testBrightCyan(): Unit {
        let word = "bright cyan"
        let colored_word = "\u{1B}[96m${word}\u{1B}[0m"

        @PowerAssert(word.colored.brightCyan() == colored_word)
        @PowerAssert(colored_word == word.colored.brightCyan())
        @PowerAssert(word.colored.brightCyan().toString() == colored_word)
    }

    /**
     * 测试亮白色
     */
    @TestCase
    func testBrightWhite(): Unit {
        let word = "bright white"
        let colored_word = "\u{1B}[97m${word}\u{1B}[0m"

        @PowerAssert(word.colored.brightWhite() == colored_word)
        @PowerAssert(colored_word == word.colored.brightWhite())
        @PowerAssert(word.colored.brightWhite().toString() == colored_word)
    }

    @TestCase
    func testOnBlack(): Unit {
        let word = "on black"
        let colored_word = "\u{1B}[40m${word}\u{1B}[0m"

        @PowerAssert(word.colored.onBlack() == colored_word)
        @PowerAssert(word.colored.onBlack().toString() == colored_word)
    }

    @TestCase
    func testOnRed(): Unit {
        let word = "on red"
        let colored_word = "\u{1B}[41m${word}\u{1B}[0m"

        @PowerAssert(word.colored.onRed() == colored_word)
        @PowerAssert(word.colored.onRed().toString() == colored_word)
    }
    @TestCase
    func testOnGreen(): Unit {
        let word = "on green"
        let colored_word = "\u{1B}[42m${word}\u{1B}[0m"

        @PowerAssert(word.colored.onGreen() == colored_word)
        @PowerAssert(word.colored.onGreen().toString() == colored_word)
    }

    @TestCase
    func testOnYellow(): Unit {
        let word = "on yellow"
        let colored_word = "\u{1B}[43m${word}\u{1B}[0m"

        @PowerAssert(word.colored.onYellow() == colored_word)
        @PowerAssert(word.colored.onYellow().toString() == colored_word)
    }

    // 测试背景色蓝色
    @TestCase
    func testOnBlue(): Unit {
        let word = "on blue"
        let colored_word = "\u{1B}[44m${word}\u{1B}[0m"

        @PowerAssert(word.colored.onBlue() == colored_word)
        @PowerAssert(word.colored.onBlue().toString() == colored_word)
    }
    // 测试背景色洋红色
    @TestCase
    func testOnMagenta(): Unit {
        let word = "on magenta"
        let colored_word = "\u{1B}[45m${word}\u{1B}[0m"

        @PowerAssert(word.colored.onMagenta() == colored_word)
        @PowerAssert(word.colored.onMagenta().toString() == colored_word)
    }
    // 测试背景色青色
    @TestCase
    func testOnCyan(): Unit {
        let word = "on cyan"
        let colored_word = "\u{1B}[46m${word}\u{1B}[0m"

        @PowerAssert(word.colored.onCyan() == colored_word)
        @PowerAssert(word.colored.onCyan().toString() == colored_word)
    }
    // 测试背景色白色
    @TestCase
    func testOnWhite(): Unit {
        let word = "on white"
        let colored_word = "\u{1B}[47m${word}\u{1B}[0m"

        @PowerAssert(word.colored.onWhite() == colored_word)
        @PowerAssert(word.colored.onWhite().toString() == colored_word)
    }
    // 测试背景色亮黑色
    @TestCase
    func testOnBrightBlack(): Unit {
        let word = "on bright black"
        let colored_word = "\u{1B}[100m${word}\u{1B}[0m"

        @PowerAssert(word.colored.onBrightBlack() == colored_word)
        @PowerAssert(word.colored.onBrightBlack().toString() == colored_word)
    }
    // 测试背景色亮红色
    @TestCase
    func testOnBrightRed(): Unit {
        let word = "on bright red"
        let colored_word = "\u{1B}[101m${word}\u{1B}[0m"

        @PowerAssert(word.colored.onBrightRed() == colored_word)
        @PowerAssert(word.colored.onBrightRed().toString() == colored_word)
    }

    // 测试背景色亮绿色
    @TestCase
    func testOnBrightGreen(): Unit {
        let word = "on bright green"
        let colored_word = "\u{1B}[102m${word}\u{1B}[0m"

        @PowerAssert(word.colored.onBrightGreen() == colored_word)
        @PowerAssert(word.colored.onBrightGreen().toString() == colored_word)
    }

    // 测试背景色亮黄色
    @TestCase
    func testOnBrightYellow(): Unit {
        let word = "on bright yellow"
        let colored_word = "\u{1B}[103m${word}\u{1B}[0m"

        @PowerAssert(word.colored.onBrightYellow() == colored_word)
        @PowerAssert(word.colored.onBrightYellow().toString() == colored_word)
    }

    // 测试背景色亮蓝色
    @TestCase
    func testOnBrightBlue(): Unit {
        let word = "on bright blue"
        let colored_word = "\u{1B}[104m${word}\u{1B}[0m"

        @PowerAssert(word.colored.onBrightBlue() == colored_word)
        @PowerAssert(word.colored.onBrightBlue().toString() == colored_word)
    }

    // 测试背景色亮洋红色
    @TestCase
    func testOnBrightMagenta(): Unit {
        let word = "on bright magenta"
        let colored_word = "\u{1B}[105m${word}\u{1B}[0m"

        @PowerAssert(word.colored.onBrightMagenta() == colored_word)
        @PowerAssert(word.colored.onBrightMagenta().toString() == colored_word)
    }

    // 测试背景色亮青色
    @TestCase
    func testOnBrightCyan(): Unit {
        let word = "on bright cyan"
        let colored_word = "\u{1B}[106m${word}\u{1B}[0m"

        @PowerAssert(word.colored.onBrightCyan() == colored_word)
        @PowerAssert(word.colored.onBrightCyan().toString() == colored_word)
    }

    // 测试背景色亮白色
    @TestCase
    func testOnBrightWhite(): Unit {
        let word = "on bright white"
        let colored_word = "\u{1B}[107m${word}\u{1B}[0m"

        @PowerAssert(word.colored.onBrightWhite() == colored_word)
        @PowerAssert(word.colored.onBrightWhite().toString() == colored_word)
    }

    @TestCase
    func testGiveColorShow(): Unit {
        //循环给出所有前景色的输出

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
    func testGiveBgcolorShow(): Unit {
        //循环给出所有背景色的输出

        let enumTerminalColor = [TerminalColor.Black, TerminalColor.Red, TerminalColor.Green, TerminalColor.Yellow,
            TerminalColor.Blue, TerminalColor.Magenta, TerminalColor.Cyan, TerminalColor.White,
            TerminalColor.BrightBlack, TerminalColor.BrightRed, TerminalColor.BrightGreen, TerminalColor.BrightYellow,
            TerminalColor.BrightBlue, TerminalColor.BrightMagenta, TerminalColor.BrightCyan, TerminalColor.BrightWhite]
        var count = 0
        for (itemColor in enumTerminalColor) {
            let word = "${terminalColor2Color(itemColor)}"
            print(word.colored.colorAndStyle(bgcolor: itemColor))
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
        //循环给出所有前景色加一个样式的组合的输出
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

    @TestCase
    func testGiveFgcolorBgcolorAndAStyleShow(): Unit {
        //循环给出所有前景色背景色加一个样式的组合的输出
        let enumTerminalColor = [TerminalColor.Black, TerminalColor.Red, TerminalColor.Green, TerminalColor.Yellow,
            TerminalColor.Blue, TerminalColor.Magenta, TerminalColor.Cyan, TerminalColor.White,
            TerminalColor.BrightBlack, TerminalColor.BrightRed, TerminalColor.BrightGreen, TerminalColor.BrightYellow,
            TerminalColor.BrightBlue, TerminalColor.BrightMagenta, TerminalColor.Cyan, TerminalColor.White]
        let enumTerminalStyle = [TerminalStyle.Bold, TerminalStyle.Dimmed, TerminalStyle.Italic,
            TerminalStyle.Underline, TerminalStyle.Blink, TerminalStyle.Reversed, TerminalStyle.Hidden,
            TerminalStyle.Strikethrough]
        for (fgcolor in enumTerminalColor) {
            for (bgcolor in enumTerminalColor) {
                var count = 0
                for (itemStyle in enumTerminalStyle) {
                    let word = "${terminalColor2Color(fgcolor)} with ${terminalStyle2Style(itemStyle)}"
                    print(word.colored(fgcolor: fgcolor, bgcolor: bgcolor, style: itemStyle))
                    print("\t\t\t")
                    count += 1
                    if (count % 4 == 0) {
                        println()
                    }
                }
                println()
            }
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

    // TODO bgcolor need to be tested
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
