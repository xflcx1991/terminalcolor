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

public enum TerminalColor {
    | Black
    | Red
    | Green
    | Yellow
    | Blue
    | Magenta
    | Cyan
    | White
    | BrightBlack
    | BrightRed
    | BrightGreen
    | BrightYellow
    | BrightBlue
    | BrightMagenta
    | BrightCyan
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
public class ColoredString <: ToString {
    // The plain text that will have color and style applied to it. 
    private let input: String

    /// The color of the text as it will be printed.
    private var fgcolor: Option<Color>
    /// The background color (if any). None means that the text will be printed
    /// without a special background.
    // pub bgcolor: Option<Color>,
    /// Any special styling to be applied to the text (see Styles for a list of
    /// available options).
    private let style: ArrayList<Style>
    public ColoredString(input: String) {
        this.input = input
        this.fgcolor = None<Color>
        this.style = ArrayList<Style>()
    }

    public override func toString(): String {
        return this.computeStyle()
    }
    /*
    public operator func ==(other: ColoredString): Bool {
        // 如果fgcolor 不同，用模式匹配来判等
        match ((this.fgcolor, other.fgcolor)) {
            case (Some(Color.Black), Some(Color.Black)) | (Some(Color.Red), Some(Color.Red)) | (Some(Color.Green), Some(Color.
                            Green)) | (Some(Color.Yellow), Some(Color.Yellow)) | (Some(Color.Blue), Some(Color.Blue)) | (Some(Color.
                            Magenta), Some(Color.Magenta)) | (Some(Color.Cyan), Some(Color.Cyan)) | (Some(Color.White), Some(Color.
                            White)) | (Some(Color.BrightBlack), Some(Color.BrightBlack)) | (Some(Color.BrightRed), Some(Color.
                            BrightRed)) | (Some(Color.BrightGreen), Some(Color.BrightGreen)) | (Some(Color.BrightYellow), Some(Color.
                            BrightYellow)) | (Some(Color.BrightBlue), Some(Color.BrightBlue)) | (Some(Color.
                            BrightMagenta), Some(Color.BrightMagenta)) | (Some(Color.BrightCyan), Some(Color.BrightCyan)) | (Some(Color.
                            BrightWhite), Some(Color.BrightWhite)) => true
            case _ => false
        }

        // TODO 以后加了bgcolor 再写

        // 如果style 不同

    }
     */
    /**
     * 原来 rust-colored 把style样式设置为数字类型而结构体只存样式的值是为了方便判等
     * 现在这里不能大改了，只能适应
     */
    public operator func ==(other: String): Bool {
        return this.computeStyle() == other
    }

    /**
     * 核心代码，转换成最终要输出的颜色样式字符串
     * TODO 暂时不考虑no_color环境变量
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

        // 样式
        for (styleItem in style) {
            if (has_wrote) {
                res.append(";")
            }
            res.append(styleItem.toStyleString())
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

    /**
     * * 判断ColoredString是否是纯文本，即没有颜色和样式
     *
     * @return Bool 是否是纯文本
     *
     */
    func isPlain(): Bool {
        // self.bgcolor.is_none() && self.fgcolor.is_none() && self.style == style::CLEAR
        return this.fgcolor.isNone() && this.style.isEmpty()
    }

    // #region fg color

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
     * @return ColoredString
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
     * @return ColoredString
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
     * @return ColoredString
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
     * @return ColoredString
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
     * @return ColoredString
     *
     * @example
     * "blue".colored.blue()
     */
    public func blue(): This {
        this.fgcolor = Color.Blue
        return this
    }

    /**
     * 输出洋红色文字
     * ANSI 值 35
     *
     * 标准色-Magenta 洋红色
     *
     * @return ColoredString
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
     * @return ColoredString
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
     * @return ColoredString
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
     * @return ColoredString
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
     * @return ColoredString
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
     * @return ColoredString
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
     * @return ColoredString
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
     * @return ColoredString
     *
     * @example
     * "brightblue".colored.brightblue()
     */
    public func brightblue(): This {
        this.fgcolor = Color.BrightBlue
        return this
    }

    /**
     * 输出亮洋红色文字
     * ANSI 值 95
     *
     * 扩展色-BrightMagenta 亮洋红色
     *
     * @return ColoredString
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
     * @return ColoredString
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
     * @return ColoredString
     *
     * @example
     * "brightwhite".colored.brightwhite()
     */
    public func brightwhite(): This {
        this.fgcolor = Color.BrightWhite
        return this
    }

    /**
     * 为了内部单元测试方便，配合 enum Color 遍历检查结果的
     * 本函数和 enum Color 暂时考虑不对外公开，减少用户的使用成本
     *
     * @param tmpColor 设置前景色的 Color 枚举值
     * @return ColoredString
     *
     * @example
     * "red".color(Color.Red)
     *
     */
    protected func setFgColor(tmpColor: Color): This {
        this.fgcolor = tmpColor
        return this
    }

    /**
     * 清除前景色
     *
     * @return ColoredString
     *
     * @example
     * "clearFgColor".colored.clearFgColor()
     */
    public func clearFgColor(): This {
        this.fgcolor = None<Color>
        return this
    }
    // #endregion fg color

    /**
     * 清除所有样式，包括前景色
     *
     * @return ColoredString
     *
     * @example
     * "clear".colored.clear()
     */
    public func clear(): This {
        this.clearStyle()
        this.clearFgColor()

        return this
    }

    // #region style

    /**
     * 增加粗体样式
     * ANSI 值 1
     *
     * @return ColoredString
     *
     * @example
     * "bold".colored.bold()
     */
    public func bold(): This {
        this.style.append(Style.Bold)
        return this
    }

    /**
     * 增加暗淡样式
     * ANSI 值 2
     *
     * @return ColoredString
     *
     * @example
     * "dim".colored.dimmed()
     */
    public func dimmed(): This {
        this.style.append(Style.Dimmed)
        return this
    }

    /**
     * 增加斜体样式
     * ANSI 值 3
     *
     * @return ColoredString
     *
     * @example
     * "italic".colored.italic()
     */
    public func italic(): This {
        this.style.append(Style.Italic)
        return this
    }

    /**
     * 增加下划线样式
     * ANSI 值 4
     *
     * @return ColoredString
     *
     * @example
     * "underline".colored.underline()
     */
    public func underline(): This {
        this.style.append(Style.Underline)
        return this
    }

    /**
     * 增加闪烁样式
     * ANSI 值 5
     *
     * @return ColoredString
     *
     * @example
     * "blink".colored.blink()
     */
    public func blink(): This {
        this.style.append(Style.Blink)
        return this
    }

    /**
     * 增加反转样式
     * ANSI 值 7
     *
     * @return ColoredString
     *
     * @example
     * "reverse".colored.reverse()
     */
    public func reversed(): This {
        this.style.append(Style.Reversed)
        return this
    }
    /**
     * 增加隐藏样式
     * ANSI 值 8
     *
     * @return ColoredString
     *
     * @example
     * "hidden".colored.hidden()
     */
    public func hidden(): This {
        this.style.append(Style.Hidden)
        return this
    }

    /**
     * 增加删除线样式
     * ANSI 值 9
     *
     * @return ColoredString
     *
     * @example
     * "delete".colored.delete()
     */
    public func strikethrough(): This {
        this.style.append(Style.Strikethrough)
        return this
    }

    /**
     * 为了内部单元测试方便，配合 enum Style 遍历检查结果的
     * 本函数和 enum Style 暂时考虑不对外公开，减少用户的使用成本
     *
     * @param tmpStyle 传进来的Style枚举值
     *
     * @return ColoredString
     *
     * @example
     * "style".style(Style.Bold)
     *
     */
    protected func setStyle(tmpStyle: Style): This {
        this.style.append(tmpStyle)
        return this
    }

    /**
     * 清除样式
     *
     * @return ColoredString
     *
     * @example
     * "clearStyle".colored.clearStyle()
     */
    public func clearStyle(): This {
        this.style.clear()
        return this
    }

    // #endregion style

    // #region overload ()
    public operator func ()(color!: TerminalColor): This { // cjlint-ignore !G.OPR.01 just use it
        this.fgcolor = terminalColor2Color(color)
        return this
    }

    public operator func ()(style!: TerminalStyle): This { // cjlint-ignore !G.OPR.01 just use it
        this.style.append(terminalStyle2Style(style))
        return this
    }
    public operator func ()(color!: TerminalColor, style!: TerminalStyle): This { // cjlint-ignore !G.OPR.01 just use it
        this.fgcolor = terminalColor2Color(color)
        this.style.append(terminalStyle2Style(style))
        return this
    }
    // #endregion style
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

    /** 让ColoredString 能直接和String判等 */
    public operator func ==(other: ColoredString): Bool {
        return this == other.computeStyle()
    }

    // /** 不给用户用，仅供内部方便单元测试用 */
    // func color(tmpColor: Color): ColoredString {
    //     return ColoredString(this).setFgColor(tmpColor)
    // }
    // /** 不给用户用，仅供内部方便单元测试用 */
    // func style(tmpStyle: Style): ColoredString {
    //     return ColoredString(this).setStyle(tmpStyle)
    // }
}
// cjlint-ignore -end suppress this stupid warning
