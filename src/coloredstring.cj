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
// cjlint-ignore -start !G.OTH.03 suppress this stupid warning
public class ColoredString <: ToString {
    // The plain text that will have color and style applied to it. 
    // private let input: String

    /// The color of the text as it will be printed.
    private var fgcolor: Option<Color>
    /// The background color (if any). None means that the text will be printed
    /// without a special background.
    // pub bgcolor: Option<Color>,
    /// Any special styling to be applied to the text (see Styles for a list of
    /// available options).
    // pub style: style::Style,
    public ColoredString(private let input: String) {
        fgcolor = None
    }

    public override func toString(): String {
        return this.computeStyle()
    }

    public operator func ==(other: String): Bool {
        return this.computeStyle() == other
    }

    /**
     * 核心代码，转换成最终要输出的颜色样式字符串
     * TODO 暂时不考虑no_color环境变量
     * TODO 暂时不考虑样式
     * TODO: 暂时不考虑背景色
     *
     * @return String 最终要输出的颜色样式字符串
     *
     */
    protected func computeStyle(): String {
        if (this.isPlain()) {
            return this.input
        }

        // \u{1B}[ num1;num2;num3;…… \u{1B}[0m
        let res = StringBuilder("\u{1B}[")

        var has_wrote = false

        // 前景色（文字颜色，下统称前景色）
        if (let Some(fgcolor) <- this.fgcolor) {
            if (has_wrote) {
                res.append(";")
            }
            res.append(fgcolor.toFgStr())

            has_wrote = true
        }

        if (!has_wrote) {
            res.append("0")
        }
        // 补上后面那个m
        res.append("m")
        // 拼上字符串
        res.append(this.input)
        // 补上固定的样式复原字符
        // TODO: 复原代码写这个函数还是写 toString() 里更好？

        res.append("\u{1B}[0m")

        return res.toString()
    }

    /**
     * * 判断ColoredString是否是纯文本，即没有颜色和样式
     *
     * @return Bool 是否是纯文本
     *
     */
    func isPlain(): Bool {
        // self.bgcolor.is_none() && self.fgcolor.is_none() && self.style == style::CLEAR
        return this.fgcolor.isNone()
    }

    /*cjlint-ignore !G.CHK.04  suppress this stupid warning*/
    /*
     * 颜色命名参考标准值
     * https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
     * https://jakob-bagterp.github.io/colorist-for-python/user-guide/materials/ansi-escape-codes/#foreground-text-and-background-colors
     * https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797
     * https://www.cnblogs.com/aifengqi/p/15395422.html
     * https://talyian.github.io/ansicolors/
     * https://bixense.com/clicolors/
     * https://no-color.org/
     */

    /**
     * 输出黑色文字
     * ANSI 值 30
     *
     * 标准色-Black 黑色
     *
     * @return ColoredString 黑色文字
     *
     * @example
     * "black".colored.black()
     */
    public func black(): This {
        this.fgcolor = Color.Black
        return this
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
     * "red".colored.red()
     */
    public func red(): This {
        this.fgcolor = Color.Red
        return this
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
     * "green".colored.green()
     */
    public func green(): This {
        this.fgcolor = Color.Green
        return this
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
     * "yellow".colored.yellow()
     */
    public func yellow(): This {
        this.fgcolor = Color.Yellow
        return this
    }

    /**
     * 输出蓝色文字
     * ANSI 值 34
     *
     * 标准色-Blue 蓝色
     *
     * @return String 蓝色文字
     *
     * @example
     * "blue".colored.blue()
     */
    public func blue(): This {
        this.fgcolor = Color.Blue
        return this
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
     * "magenta".colored.magenta()
     */
    public func magenta(): This {
        this.fgcolor = Color.Magenta
        return this
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
     * "cyan".colored.cyan()
     */
    public func cyan(): This {
        this.fgcolor = Color.Cyan
        return this
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
     * "white".colored.white()
     */
    public func white(): This {
        this.fgcolor = Color.White
        return this
    }

    /**
     * 输出亮黑色文字
     * ANSI 值 90
     *
     * 扩展色-BrightBlack 亮黑色
     *
     * @return String 亮黑色文字
     *
     * @example
     * "brightblack".colored.brightblack()
     */
    public func brightblack(): This {
        this.fgcolor = Color.BrightBlack
        return this
    }

    /**
     * 输出亮红色文字
     * ANSI 值 91
     *
     * 扩展色-BrightRed 亮红色
     *
     * @return String 亮红色文字
     *
     * @example
     * "brightred".colored.brightred()
     */
    public func brightred(): This {
        this.fgcolor = Color.BrightRed
        return this
    }

    /**
     * 输出亮绿色文字
     * ANSI 值 92
     *
     * 扩展色-BrightGreen 亮绿色
     *
     * @return String 亮绿色文字
     *
     * @example
     * "brightgreen".colored.brightgreen()
     */
    public func brightgreen(): This {
        this.fgcolor = Color.BrightGreen
        return this
    }

    /**
     * 输出亮黄色文字
     * ANSI 值 93
     *
     * 扩展色-BrightYellow 亮黄色
     *
     * @return String 亮黄色文字
     *
     * @example
     * "brightyellow".colored.brightyellow()
     */
    public func brightyellow(): This {
        this.fgcolor = Color.BrightYellow
        return this
    }

    /**
     * 输出亮蓝色文字
     * ANSI 值 94
     *
     * 扩展色-BrightBlue 亮蓝色
     *
     * @return String 亮蓝色文字
     *
     * @example
     * "brightblue".colored.brightblue()
     */
    public func brightblue(): This {
        this.fgcolor = Color.BrightBlue
        return this
    }

    /**
     * 输出亮品红色文字
     * ANSI 值 95
     *
     * 扩展色-BrightMagenta 亮紫色
     *
     * @return String 亮紫色文字
     *
     * @example
     * "brightmagenta".colored.brightmagenta()
     */
    public func brightmagenta(): This {
        this.fgcolor = Color.BrightMagenta
        return this
    }

    /**
     * 输出亮青色文字
     * ANSI 值 96
     *
     * 扩展色-BrightCyan 亮青色
     *
     * @return String 亮青色文字
     *
     * @example
     * "brightcyan".colored.brightcyan()
     */
    public func brightcyan(): This {
        this.fgcolor = Color.BrightCyan
        return this
    }

    /**
     * 输出亮白色文字
     * ANSI 值 97
     *
     * 扩展色-BrightWhite 亮白色
     *
     * @return String 亮白色文字
     *
     * @example
     * "brightwhite".colored.brightwhite()
     */
    public func brightwhite(): This {
        this.fgcolor = Color.BrightWhite
        return this
    }

    /**
     * 为了内部单元测试方便，配合 enum Color遍历检查结果的
     * 本函数和enum Color暂时考虑不对外公开，减少用户的使用成本
     *
     * @param color Color
     * @return ColoredString
     *
     * @example
     * "red".color(Color.Red)
     *
     */
    protected func color(tmpColor: Color): This {
        this.fgcolor = tmpColor
        return this
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
    /** 不给用户用，仅供内部方便单元测试用 */
    func color(tmpColor: Color): ColoredString {
        return ColoredString(this).color(tmpColor)
    }
}
// cjlint-ignore -end suppress this stupid warning
