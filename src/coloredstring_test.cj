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
// import std.unittest.testmacro.*
/**
 * 参考以下文档颜色定义
 * https://www.cnblogs.com/aifengqi/p/15395422.html
 * https://bixense.com/clicolors/
 * https://no-color.org/
 */
@Test
class Tests {
    @TestCase
    func testNoGiveColor(): Unit {
        var word = "abczyx"
        // println(word.colored)
        @PowerAssert(word.colored == word)
        word = ""
        @PowerAssert(word.colored == word)
    }

    @TestCase
    func testBlack(): Unit {
        let word = "black"
        let colored_word = "\u{1B}[30m${word}\u{1B}[0m"
        // println(colored_word)

        @PowerAssert(word.colored.black() == colored_word)
        @PowerAssert(word.colored.black().toString() == colored_word)
    }

    @TestCase
    func testRed(): Unit {
        let word = "red"
        let colored_word = "\u{1B}[31m${word}\u{1B}[0m"
        // println(colored_word)

        @PowerAssert(word.colored.red() == colored_word)
        @PowerAssert(word.colored.red().toString() == colored_word)
    }

    @TestCase
    func testGreen(): Unit {
        let word = "green"
        let colored_word = "\u{1B}[32m${word}\u{1B}[0m"
        // println(colored_word)
        @PowerAssert(word.colored.green() == colored_word)
        @PowerAssert(word.colored.green().toString() == colored_word)
    }

    @TestCase
    func testYellow(): Unit {
        let word = "yellow"
        let colored_word = "\u{1B}[33m${word}\u{1B}[0m"
        // println(colored_word)

        @PowerAssert(word.colored.yellow() == colored_word)
        @PowerAssert(word.colored.yellow().toString() == colored_word)
    }

    @TestCase
    func testBlue(): Unit {
        let word = "blue"
        let colored_word = "\u{1B}[34m${word}\u{1B}[0m"
        // println(colored_word)

        @PowerAssert(word.colored.blue() == colored_word)
        @PowerAssert(word.colored.blue().toString() == colored_word)
    }

    @TestCase
    func testMagenta(): Unit {
        let word = "magenta"
        let colored_word = "\u{1B}[35m${word}\u{1B}[0m"
        // println(colored_word)

        @PowerAssert(word.colored.magenta() == colored_word)
        @PowerAssert(word.colored.magenta().toString() == colored_word)
    }

    @TestCase
    func testCyan(): Unit {
        let word = "cyan"
        let colored_word = "\u{1B}[36m${word}\u{1B}[0m"
        // println(colored_word)

        @PowerAssert(word.colored.cyan() == colored_word)
        @PowerAssert(word.colored.cyan().toString() == colored_word)
    }

    @TestCase
    func testWhite(): Unit {
        let word = "white"
        let colored_word = "\u{1B}[37m${word}\u{1B}[0m"
        // println(colored_word)

        @PowerAssert(word.colored.white() == colored_word)
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
        @PowerAssert(word.colored.brightwhite().toString() == colored_word)
    }

    @TestCase
    func testGiveAShow(): Unit {

        //循环给出所有颜色的输出

        for (item in Color.COLOR) {
            println(item.toString().color(item).toString())
        }
    }
}
