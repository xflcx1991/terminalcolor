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

// cjlint-ignore -start !G.OTH.03 suppress this stupid warning
public class ColoredString <: ToString {
    // The plain text that will have color and style applied to it. 
    // private let input: String

    public ColoredString(private let input: String) {}

    public func toString(): String {
        return this.input
    }

    /*
     * 颜色命名参考标准值
     * https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
     * https://jakob-bagterp.github.io/colorist-for-python/user-guide/materials/ansi-escape-codes/#foreground-text-and-background-colors
     * https://www.cnblogs.com/aifengqi/p/15395422.html
     * https://bixense.com/clicolors/
     * https://no-color.org/
     */

    /**
     * 输出黑色文字
     * ANSI 值 30
     *
     * 标准色-Black 黑色
     *
     * @return String 黑色文字
     *
     * @example
     * "black".black()
     */
    public func black(): String {
        let color_start = "\u{1B}[30m"
        let color_reset = "\u{1B}[0m"

        return "${color_start}${this.input}${color_reset}"
    }

    /**
     * 输出红色文字
     * ANSI 值 31
     *
     * 标准色-Red 红色
     *
     * @return String 红色文字
     *
     * @example
     * "red".red()
     */
    public func red(): String {
        let color_start = "\u{1B}[31m"
        let color_reset = "\u{1B}[0m"

        return "${color_start}${this.input}${color_reset}"
    }

    /**
     * 输出绿色文字
     * ANSI 值 32
     *
     * 标准色-Green 绿色
     *
     * @return String 绿色文字
     *
     * @example
     * "green".green()
     */
    public func green(): String {
        let a = this.toString()
        let color_start = "\u{1B}[32m"
        let color_reset = "\u{1B}[0m"

        return "${color_start}${a}${color_reset}"
    }

    /**
     * 输出黄色文字
     * ANSI 值 33
     *
     * 标准色-Yellow 黄色
     *
     * @return String 黄色文字
     *
     * @example
     * "yellow".yellow()
     */
    public func yellow(): String {
        let a = this.toString()
        let color_start = "\u{1B}[33m"
        let color_reset = "\u{1B}[0m"

        return "${color_start}${a}${color_reset}"
    }
    /*cjlint-ignore !G.CHK.04 */
    /*cjlint-ignore !G.CHK.04!G.CHK.02 */
    /**
     * 输出蓝色文字
     * ANSI 值 34
     *
     * 标准色-Blue 蓝色
     *
     * @return String 蓝色文字
     *
     * @example
     * "blue".blue()
     */
    public func blue(): String {
        let a = this.toString()
        let color_start = "\u{1B}[34m"
        let color_reset = "\u{1B}[0m"

        return "${color_start}${a}${color_reset}"
    }

    /**
     * 输出品红色文字
     * ANSI 值 35
     *
     * 标准色-Magenta 品红色
     *
     * @return String 品红色文字
     *
     * @example
     * "magenta".magenta()
     */
    public func magenta(): String {
        let a = this.toString()
        let color_start = "\u{1B}[35m"
        let color_reset = "\u{1B}[0m"

        return "${color_start}${a}${color_reset}"
    }

    /**
     * 输出青色文字
     * ANSI 值 36
     *
     * 标准色-Cyan 青色
     *
     * @return String 青色文字
     *
     * @example
     * "cyan".cyan()
     */
    public func cyan(): String {
        let a = this.toString()
        let color_start = "\u{1B}[36m"
        let color_reset = "\u{1B}[0m"

        return "${color_start}${a}${color_reset}"
    }

    /**
     * 输出白色文字
     * ANSI 值 37
     *
     * 标准色-White 白色
     *
     * @return String 白色文字
     *
     * @example
     * "white".white()
     */
    public func white(): String {
        let a = this.toString()
        let color_start = "\u{1B}[37m"
        let color_reset = "\u{1B}[0m"

        return "${color_start}${a}${color_reset}"
    }
}
// cjlint-ignore -end suppress this stupid warning

public interface Colorize {
    prop colored: ColoredString
}

// 搜索文档“cjlint”“静态检查工具”以了解更多信息

// cjlint-ignore -start !G.ITF.02 suppress this stupid warning
extend String <: Colorize {
    /** 提供给用户用的入口 */
    public prop colored: ColoredString {
        get() {
            return ColoredString(this)
        }
    }
}
// cjlint-ignore -end suppress this stupid warning
