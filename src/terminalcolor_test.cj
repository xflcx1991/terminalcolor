/*
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

package terminalcolor

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
    func testToString(): Unit {
        let word = "abczyx"
        println(word.colored)
        @PowerAssert(word.colored.toString() == word)
    }
    @TestCase
    func testBlack(): Unit {
        let word = "black"
        let colored_word = "\u{1B}[30m${word}\u{1B}[0m"
        println(colored_word)

        @PowerAssert(word.colored.black() == colored_word)
    }

    @TestCase
    func testRed(): Unit {
        let word = "red"
        let colored_word = "\u{1B}[31m${word}\u{1B}[0m"
        println(colored_word)

        @PowerAssert(word.colored.red() == colored_word)
    }

    @TestCase
    func testGreen(): Unit {
        let word = "green"
        let colored_word = "\u{1B}[32m${word}\u{1B}[0m"
        println(colored_word)
        @PowerAssert(word.colored.green() == colored_word)
    }

    @TestCase
    func testYellow(): Unit {
        let word = "yellow"
        let colored_word = "\u{1B}[33m${word}\u{1B}[0m"
        println(colored_word)

        @PowerAssert(word.colored.yellow() == colored_word)
    }

    @TestCase
    func testBlue(): Unit {
        let word = "blue"
        let colored_word = "\u{1B}[34m${word}\u{1B}[0m"
        println(colored_word)

        @PowerAssert(word.colored.blue() == colored_word)
    }

    @TestCase
    func testMagenta(): Unit {
        let word = "magenta"
        let colored_word = "\u{1B}[35m${word}\u{1B}[0m"
        println(colored_word)

        @PowerAssert(word.colored.magenta() == colored_word)
    }

    @TestCase
    func testCyan(): Unit {
        let word = "cyan"
        let colored_word = "\u{1B}[36m${word}\u{1B}[0m"
        println(colored_word)

        @PowerAssert(word.colored.cyan() == colored_word)
    }

    @TestCase
    func testWhite(): Unit {
        let word = "white"
        let colored_word = "\u{1B}[37m${word}\u{1B}[0m"
        println(colored_word)

        @PowerAssert(word.colored.white() == colored_word)
    }
}
