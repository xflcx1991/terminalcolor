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

import std.collection.ArrayList
import terminalcolor.color.Color
import terminalcolor.style.Style

/**
 * @brief 通过函数调用运算符设置颜色时支持的颜色枚举
 *
 * TerminalColor 是提供给用户用的，和库内部用的颜色枚举隔离开
 * @see public operator func ()(color!: TerminalColor)
 */
public enum TerminalColor {
    /** @brief 黑色 */
    | Black
    /** @brief 红色 */
    | Red
    /** @brief 绿色 */
    | Green
    /** @brief 黄色 */
    | Yellow
    /** @brief 蓝色 */
    | Blue
    /** @brief 洋红色 */
    | Magenta
    /** @brief 青色 */
    | Cyan
    /** @brief 白色 */
    | White
    /** @brief 亮黑色 */
    | BrightBlack
    /** @brief 亮红色 */
    | BrightRed
    /** @brief 亮绿色 */
    | BrightGreen
    /** @brief 亮黄色 */
    | BrightYellow
    /** @brief 亮蓝色 */
    | BrightBlue
    /** @brief 亮洋红色 */
    | BrightMagenta
    /** @brief 亮青色 */
    | BrightCyan
    /** @brief 亮白色 */
    | BrightWhite
}

func terminalColor2Color(color: TerminalColor): Color {
    match (color) {
        case TerminalColor.Black => Color.Black
        case TerminalColor.Red => Color.Red
        case TerminalColor.Green => Color.Green
        case TerminalColor.Yellow => Color.Yellow
        case TerminalColor.Blue => Color.Blue
        case TerminalColor.Magenta => Color.Magenta
        case TerminalColor.Cyan => Color.Cyan
        case TerminalColor.White => Color.White
        case TerminalColor.BrightBlack => Color.BrightBlack
        case TerminalColor.BrightRed => Color.BrightRed
        case TerminalColor.BrightGreen => Color.BrightGreen
        case TerminalColor.BrightYellow => Color.BrightYellow
        case TerminalColor.BrightBlue => Color.BrightBlue
        case TerminalColor.BrightMagenta => Color.BrightMagenta
        case TerminalColor.BrightCyan => Color.BrightCyan
        case TerminalColor.BrightWhite => Color.BrightWhite
    }
}

/**
 * @brief 通过函数调用运算符设置样式时支持的样式枚举
 *
 * TerminalStyle 是提供给用户用的，和库内部用的样式枚举隔离开
 * @see TerminalColor
 * @see public operator func ()(style!: TerminalStyle)
 */
public enum TerminalStyle {
    | Bold
    | Dimmed
    | Italic
    | Underline
    | Blink
    | Reversed
    | Hidden
    | Strikethrough
}

func terminalStyle2Style(style: TerminalStyle): Style {
    match (style) {
        case TerminalStyle.Bold => Style.Bold
        case TerminalStyle.Dimmed => Style.Dimmed
        case TerminalStyle.Italic => Style.Italic
        case TerminalStyle.Underline => Style.Underline
        case TerminalStyle.Blink => Style.Blink
        case TerminalStyle.Reversed => Style.Reversed
        case TerminalStyle.Hidden => Style.Hidden
        case TerminalStyle.Strikethrough => Style.Strikethrough
    }
}

// cjlint-ignore -start !G.OTH.03 suppress this stupid warning
/**
 * @brief 一个可以管理终端颜色、样式的类，是本库的核心
 *
 * ColoredString 是一个可以设置颜色和样式的类，它通过一个需要修饰的字符串来构造。
 * @see TerminalColor
 * @see TerminalStyle
 */
public class ColoredString <: ToString {
    /** The plain text that will have color and style applied to it */
    private let input: String

    /** The color of the text as it will be printed */
    private var fgcolor: Option<Color>
    /** The background color (if has). None means that the text will be printed
    without a special background.*/
    private var bgcolor: Option<Color>
    /** Any special styling to be applied to the text (see Styles for a list of
    available options).*/
    private let style: ArrayList<Style>
    /** The value of the style, used to print the text. This is a bitfield, where
    each bit represents a different style.*/
    private var styleValue: UInt8

    public ColoredString(input: String) {
        this.input = input
        this.fgcolor = None<Color>
        this.bgcolor = None<Color>
        this.style = ArrayList<Style>()
        this.styleValue = 0u8
    }

    /**
     * @brief 输出可以输出到终端的带样色样式修饰的字符串
     */
    public override func toString(): String {
        return this.computeStyle()
    }
    /*
    // 写好了，但是似乎没有用的地方，以后要用的时候给类第一行补上实现 Equatable<ColoredString> 接口
    public operator override func ==(other: ColoredString): Bool { // cjlint-ignore !G.OPR.01 suppress this stupid warning
        // fgcolor 不同
        if (this.fgcolor != other.fgcolor) {
            return false
        }
        // bgcolor 不同
        if (this.bgcolor != other.bgcolor) {
            return false
        }
        // style 不同
        if (this.styleValue != other.styleValue) {
            return false
        }
        return true
    }

    public operator override func !=(other: ColoredString): Bool { // cjlint-ignore !G.OPR.01 suppress this stupid warning
        return !(this == other)
    }
     */

    /**
     * 原来 rust-colored 把style样式设置为数字类型而结构体只存样式的值是为了方便判等
     * 现在这里不能大改了，只能适应
     */
    /** 不给用户用，仅供内部方便单元测试用 */
    operator func ==(other: String): Bool {
        return this.computeStyle() == other
    }

    /// @cond
    /**
     * @brief 核心代码，转换成最终要输出的颜色样式字符串
     *
     * TODO 暂时不考虑no_color环境变量
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

        // 样式
        for (styleItem in style) {
            if (has_wrote) {
                res.append(";")
            }
            res.append(styleItem.toStyleString())
            has_wrote = true
        }

        // 背景色（文字背景颜色，下统称背景色）
        if (let Some(bgcolor) <- this.bgcolor) {
            if (has_wrote) {
                res.append(";")
            }
            res.append(bgcolor.toBgStr())

            has_wrote = true
        }

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
    /// @endcond

    /**
     * 判断ColoredString是否是纯文本，即没有颜色和样式
     *
     * @return Bool 是否是纯文本
     *
     */
    func isPlain(): Bool {
        // self.bgcolor.is_none() && self.fgcolor.is_none() && self.style == style::CLEAR
        return this.fgcolor.isNone() && this.bgcolor.isNone() && this.style.isEmpty() && this.styleValue == 0
    }

    // #region fg color

    /*cjlint-ignore -start !G.OTH.03  suppress this stupid warning*/
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
     * @brief 设置黑色
     *
     * ANSI 值 30 \n
     * 标准色-Black 黑色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "black".colored.black()
     * ```
     */
    public func black(): This {
        this.fgcolor = Color.Black
        return this
    }

    /**
     * @brief 设置红色
     *
     * ANSI 值 31 \n
     * 标准色-Red 红色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "red".colored.red()
     * ```
     */
    public func red(): This {
        this.fgcolor = Color.Red
        return this
    }

    /**
     * @brief 设置绿色
     *
     * ANSI 值 32 \n
     * 标准色-Green 绿色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "green".colored.green()
     * ```
     */
    public func green(): This {
        this.fgcolor = Color.Green
        return this
    }

    /**
     * @brief 设置黄色
     *
     * ANSI 值 33 \n
     * 标准色-Yellow 黄色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "yellow".colored.yellow()
     * ```
     */
    public func yellow(): This {
        this.fgcolor = Color.Yellow
        return this
    }

    /**
     * @brief 设置蓝色
     *
     * ANSI 值 34 \n
     * 标准色-Blue 蓝色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "blue".colored.blue()
     * ```
     */
    public func blue(): This {
        this.fgcolor = Color.Blue
        return this
    }

    /**
     * @brief 设置洋红色
     *
     * ANSI 值 35 \n
     * 标准色-Magenta 洋红色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "magenta".colored.magenta()
     * ```
     */
    public func magenta(): This {
        this.fgcolor = Color.Magenta
        return this
    }

    /**
     * @brief 设置青色
     *
     * ANSI 值 36 \n
     * 标准色-Cyan 青色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "cyan".colored.cyan()
     * ```
     */
    public func cyan(): This {
        this.fgcolor = Color.Cyan
        return this
    }

    /**
     * @brief 设置白色
     *
     * ANSI 值 37 \n
     * 标准色-White 白色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "white".colored.white()
     * ```
     */
    public func white(): This {
        this.fgcolor = Color.White
        return this
    }

    /**
     * @brief 设置亮黑色
     *
     * ANSI 值 90 \n
     * 扩展色-BrightBlack 亮黑色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "brightBlack".colored.brightBlack()
     * ```
     */
    public func brightBlack(): This {
        this.fgcolor = Color.BrightBlack
        return this
    }

    /**
     * @brief 设置亮红色
     *
     * ANSI 值 91 \n
     * 扩展色-BrightRed 亮红色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "brightRed".colored.brightRed()
     * ```
     */
    public func brightRed(): This {
        this.fgcolor = Color.BrightRed
        return this
    }

    /**
     * @brief 设置亮绿色
     *
     * ANSI 值 92 \n
     * 扩展色-BrightGreen 亮绿色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "brightGreen".colored.brightGreen()
     * ```
     */
    public func brightGreen(): This {
        this.fgcolor = Color.BrightGreen
        return this
    }

    /**
     * @brief 设置亮黄色
     *
     * ANSI 值 93 \n
     * 扩展色-BrightYellow 亮黄色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "brightYellow".colored.brightYellow()
     * ```
     */
    public func brightYellow(): This {
        this.fgcolor = Color.BrightYellow
        return this
    }

    /**
     * @brief 设置亮蓝色
     *
     * ANSI 值 94 \n
     * 扩展色-BrightBlue 亮蓝色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "brightBlue".colored.brightBlue()
     * ```
     */
    public func brightBlue(): This {
        this.fgcolor = Color.BrightBlue
        return this
    }

    /**
     * @brief 设置亮洋红色
     *
     * ANSI 值 95 \n
     * 扩展色-BrightMagenta 亮洋红色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "brightMagenta".colored.brightMagenta()
     * ```
     */
    public func brightMagenta(): This {
        this.fgcolor = Color.BrightMagenta
        return this
    }

    /**
     * @brief 设置亮青色
     *
     * ANSI 值 96 \n
     * 扩展色-BrightCyan 亮青色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "brightCyan".colored.brightCyan()
     * ```
     */
    public func brightCyan(): This {
        this.fgcolor = Color.BrightCyan
        return this
    }

    /**
     * @brief 设置亮白色
     *
     * ANSI 值 97 \n
     * 扩展色-BrightWhite 亮白色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "brightWhite".colored.brightWhite()
     * ```
     */
    public func brightWhite(): This {
        this.fgcolor = Color.BrightWhite
        return this
    }

    /// @cond
    /**
     * 暂时没人用，为了和setBgColor对称而保留
     *
     * @param tmpColor 设置前景色的 Color 枚举值
     * @return ColoredString
     *
     * ```py
     * "red".colored.setFgColor(Color.Red)
     * ```
     *
     */
    protected func setFgColor(tmpColor: Color): This {
        this.fgcolor = tmpColor
        return this
    }
    /// @endcond

    /**
     * @brief 清除前景色
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "clearFgColor".colored.clearFgColor()
     * ```
     */
    public func clearFgColor(): This {
        this.fgcolor = None<Color>
        return this
    }
    // #endregion fg color

    // #region bg color
    /**
     * @brief 设置背景色黑色
     *
     * ANSI 值 40
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "black".colored.onBlack()
     * ```
     */
    public func onBlack(): This {
        this.setBgColor(Color.Black)
        return this
    }

    /**
     * @brief 设置背景色红色
     *
     * ANSI 值 41
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "red".colored.onRed()
     * ```
     */
    public func onRed(): This {
        this.setBgColor(Color.Red)
        return this
    }

    /**
     * @brief 设置背景色绿色
     *
     * ANSI 值 42
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "green".colored.onGreen()
     * ```
     */
    public func onGreen(): This {
        this.setBgColor(Color.Green)
        return this
    }

    /**
     * @brief 设置背景色黄色
     *
     * ANSI 值 43
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "yellow".colored.onYellow()
     * ```
     */
    public func onYellow(): This {
        this.setBgColor(Color.Yellow)
        return this
    }

    /**
     * @brief 设置背景色蓝色
     *
     * ANSI 值 44
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "blue".colored.onBlue()
     * ```
     */
    public func onBlue(): This {
        this.setBgColor(Color.Blue)
        return this
    }

    /**
     * @brief 设置背景色洋红色
     *
     * ANSI 值 45
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "magenta".colored.onMagenta()
     * ```
     */
    public func onMagenta(): This {
        this.setBgColor(Color.Magenta)
        return this
    }

    /**
     * @brief 设置背景色青色
     *
     * ANSI 值 46
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "cyan".colored.onCyan()
     * ```
     */
    public func onCyan(): This {
        this.setBgColor(Color.Cyan)
        return this
    }

    /**
     * @brief 设置背景色白色
     *
     * ANSI 值 47
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "white".colored.onWhite()
     * ```
     */
    public func onWhite(): This {
        this.setBgColor(Color.White)
        return this
    }

    /**
     * @brief 设置背景色亮黑色
     *
     * ANSI 值 100
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "brightBlack".colored.onBrightBlack()
     * ```
     */
    public func onBrightBlack(): This {
        this.setBgColor(Color.BrightBlack)
        return this
    }

    /**
     * @brief 设置背景色亮红色
     *
     * ANSI 值 101
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "brightRed".colored.onBrightRed()
     * ```
     */
    public func onBrightRed(): This {
        this.setBgColor(Color.BrightRed)
        return this
    }

    /**
     * @brief 设置背景色亮绿色
     *
     * ANSI 值 102
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "brightGreen".colored.onBrightGreen()
     * ```
     */
    public func onBrightGreen(): This {
        this.setBgColor(Color.BrightGreen)
        return this
    }

    /**
     * @brief 设置背景色亮黄色
     *
     * ANSI 值 103
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "brightYellow".colored.onBrightYellow()
     * ```
     */
    public func onBrightYellow(): This {
        this.setBgColor(Color.BrightYellow)
        return this
    }

    /**
     * @brief 设置背景色亮蓝色
     *
     * ANSI 值 104
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "brightBlue".colored.onBrightBlue()
     * ```
     */
    public func onBrightBlue(): This {
        this.setBgColor(Color.BrightBlue)
        return this
    }

    /**
     * @brief 设置背景色亮洋红色
     *
     * ANSI 值 105
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "brightMagenta".colored.onBrightMagenta()
     * ```
     */
    public func onBrightMagenta(): This {
        this.setBgColor(Color.BrightMagenta)
        return this
    }

    /**
     * @brief 设置背景色亮青色
     *
     * ANSI 值 106
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "brightCyan".colored.onBrightCyan()
     * ```
     */
    public func onBrightCyan(): This {
        this.setBgColor(Color.BrightCyan)
        return this
    }

    /**
     * @brief 设置背景色亮白色
     *
     * ANSI 值 107
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "brightWhite".colored.onBrightWhite()
     * ```
     */
    public func onBrightWhite(): This {
        this.setBgColor(Color.BrightWhite)
        return this
    }

    /// @cond
    /**
     *
     * @param tmpColor 设置背景色的 Color 枚举值
     * @return ColoredString
     *
     * @example
     * "red".colored.setBgColor(Color.Red)
     *
     */
    protected func setBgColor(tmpColor: Color): This {
        this.bgcolor = tmpColor
        return this
    }
    /// @endcond

    /**
     * @brief 清除背景色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "clearBgColor".colored.clearBgColor()
     * ```
     */
    public func clearBgColor(): This {
        this.bgcolor = None<Color>
        return this
    }
    // #endregion bg color

    /**
     * @brief 清除所有样式，包括颜色
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "clear".colored.clear()
     * ```
     */
    public func clear(): This {
        this.clearStyle()
        this.clearFgColor()
        this.clearBgColor()

        return this
    }

    // #region style

    /**
     * @brief 增加粗体样式
     *
     * ANSI 值 1
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "bold".colored.bold()
     * ```
     */
    public func bold(): This {
        this.addStyle(Style.Bold)
        return this
    }

    /**
     * @brief 增加暗淡样式
     *
     * ANSI 值 2
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "dimmed".colored.dimmed()
     * ```
     */
    public func dimmed(): This {
        this.addStyle(Style.Dimmed)
        return this
    }

    /**
     * @brief 增加斜体样式
     *
     * ANSI 值 3
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "italic".colored.italic()
     * ```
     */
    public func italic(): This {
        this.addStyle(Style.Italic)
        return this
    }

    /**
     * @brief 增加下划线样式
     *
     * ANSI 值 4
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "underline".colored.underline()
     * ```
     */
    public func underline(): This {
        this.addStyle(Style.Underline)
        return this
    }

    /**
     * @brief 增加闪烁样式
     *
     * ANSI 值 5
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "blink".colored.blink()
     * ```
     */
    public func blink(): This {
        this.addStyle(Style.Blink)
        return this
    }

    /**
     * @brief 增加反转样式
     *
     * ANSI 值 7
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "reverse".colored.reverse()
     * ```
     */
    public func reversed(): This {
        this.addStyle(Style.Reversed)
        return this
    }

    /**
     * @brief 增加隐藏样式
     *
     * ANSI 值 8
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "hidden".colored.hidden()
     * ```
     */
    public func hidden(): This {
        this.addStyle(Style.Hidden)
        return this
    }

    /**
     * @brief 增加删除线样式
     *
     * ANSI 值 9
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "strikethrough".colored.strikethrough()
     * ```
     */
    public func strikethrough(): This {
        this.addStyle(Style.Strikethrough)
        return this
    }

    /// @cond
    /**
     * 本函数和 enum Style 暂时考虑不对外公开，减少用户的使用成本
     *
     * @param tmpStyle 传进来的Style枚举值
     *
     * @return ColoredString
     *
     *
     */
    protected func addStyle(tmpStyle: Style): This {
        this.style.add(tmpStyle)
        this.styleValue |= tmpStyle.toStyleValue()
        return this
    }

    /**
     * 本函数和 enum Style 暂时考虑不对外公开，减少用户的使用成本
     *
     * @param tmpStyle 传进来的Style枚举值
     *
     * @return ColoredString
     *
     *
     */
    protected func setStyle(tmpStyle: Style): This {
        this.clearStyle()
        this.addStyle(tmpStyle)

        return this
    }
    /// @endcond

    /**
     * @brief 清除样式
     *
     *
     * @return ColoredString
     *
     * 用法示例
     * ```py
     * # 直接在字符串后面调用colored 扩展属性然后调用本方法即可
     *
     * "clearStyle".colored.clearStyle()
     * ```
     */
    public func clearStyle(): This {
        this.style.clear()
        this.styleValue = 0
        return this
    }

    // #endregion style

    // #region operator overload

    // cjlint-ignore -start !G.OPR.01 suppress this stupid warning

    /**
     * @brief 用于设置前景色
     *
     * 重载()运算符
     * @param color TerminalColor 类型，\b 命名参数 传进来的颜色枚举值
     * @return ColoredString 返回设定后的ColoredString对象
     */
    public operator func ()(color!: TerminalColor): This {
        this.colorAndStyle(fgcolor: color, bgcolor: None, style: None)
        return this
    }

    /**
     * @brief 用于设置样式
     *
     * 重载()运算符
     * @param style TerminalStyle 类型，\b 命名参数 传进来的颜色枚举值
     * @return ColoredString 返回设定后的ColoredString对象
     */
    public operator func ()(style!: TerminalStyle): This {
        this.colorAndStyle(fgcolor: None, bgcolor: None, style: style)

        return this
    }

    /**
     * @brief 设置指定前景色、样式
     *
     * 重载()运算符
     * @param color TerminalColor 类型，\b 命名参数 传进来的前景色颜色枚举值
     * @param style TerminalStyle 类型，\b 命名参数 传进来的样式枚举值
     * @return ColoredString 返回设定后的ColoredString对象
     */
    public operator func ()(color!: TerminalColor, style!: TerminalStyle): This {
        this.colorAndStyle(fgcolor: color, bgcolor: None, style: style)
        return this
    }

    /**
     * @brief 设置指定前景色、背景色、样式
     *
     * 重载()运算符
     * @param fgcolor TerminalColor 类型，\b 命名参数 传进来的前景色颜色枚举值
     * @param bgcolor TerminalColor 类型，\b 命名参数 传进来的背景色颜色枚举值
     * @param style TerminalStyle 类型，\b 命名参数 传进来的样式枚举值
     * @return ColoredString 返回设定后的ColoredString对象
     */
    public operator func ()(fgcolor!: TerminalColor, bgcolor!: TerminalColor, style!: TerminalStyle): This {
        this.colorAndStyle(fgcolor: fgcolor, bgcolor: bgcolor, style: style)
        return this
    }

    // 为了单元测试用，开个口子不用private
    internal func colorAndStyle(fgcolor!: ?TerminalColor = None<TerminalColor>,
        bgcolor!: ?TerminalColor = None<TerminalColor>, style!: ?TerminalStyle = None<TerminalStyle>): This {
        if (let Some(value) <- fgcolor) {
            this.fgcolor = terminalColor2Color(value)
        }
        if (let Some(value) <- bgcolor) {
            this.bgcolor = terminalColor2Color(value)
        }
        if (let Some(value) <- style) {
            this.setStyle(terminalStyle2Style(value))
        }
        return this
    }

    // cjlint-ignore -end suppress this stupid warning
    // #endregion operator overload
}

/**
 * @brief 设定一个有 colored 属性的接口，为扩展 String 提供便利
 */
public interface Colorize {
    prop colored: ColoredString
}
// cjlint-ignore -end suppress this stupid warning
// 搜索文档“cjlint”“静态检查工具”以了解更多信息

// cjlint-ignore -start !G.ITF.02 suppress this stupid warning
/**
 * @brief 给 String 添加一个 colored 属性
 *
 * 扩展标准库 String，方便利用编辑器提示
 */
extend String <: Colorize {
    // 这里加 cond 是为了避免生成的文档多出一个 prop
    /// @cond
    /** @brief 提供给用户用的入口 */
    public prop colored: ColoredString {
        get() {
            return ColoredString(this)
        }
    }
    /// @endcond
    /** 让ColoredString 能直接和String判等
        不给用户用，仅供内部方便单元测试用
        不考虑 style的对比问题，仅仅是为了方便单元测试 */
    // TODO 为什么不让我用 protected？暂时用internal https://gitcode.com/Cangjie/UsersForum/issues/797 // cjlint-ignore !G.OTH.03 suppress this stupid warning
    operator func ==(other: ColoredString): Bool {
        return this == other.computeStyle()
    }

    // /** 不给用户用，仅供内部方便单元测试用 */
    // func color(tmpColor: Color): ColoredString {
    //     return ColoredString(this).setFgColor(tmpColor)
    // }
}
// cjlint-ignore -end suppress this stupid warning
