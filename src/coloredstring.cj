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

    // The color of the text as it will be printed.
    private var fgcolor: Option<Color>
    /* The background color (if any). None means that the text will be printed
    without a special background.*/
    private var bgcolor: Option<Color>
    /* Any special styling to be applied to the text (see Styles for a list of
    available options).*/
    private let style: ArrayList<Style>
    private var styleValue: UInt8

    public ColoredString(input: String) {
        this.input = input
        this.fgcolor = None<Color>
        this.bgcolor = None<Color>
        this.style = ArrayList<Style>()
        this.styleValue = 0u8
    }

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

    /**
     * 核心代码，转换成最终要输出的颜色样式字符串
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

    /**
     * * 判断ColoredString是否是纯文本，即没有颜色和样式
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
     * "brightblack".colored.brightBlack()
     */
    public func brightBlack(): This {
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
     * "brightred".colored.brightRed()
     */
    public func brightRed(): This {
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
     * "brightgreen".colored.brightGreen()
     */
    public func brightGreen(): This {
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
     * "brightyellow".colored.brightYellow()
     */
    public func brightYellow(): This {
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
     * "brightblue".colored.brightBlue()
     */
    public func brightBlue(): This {
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
     * "brightmagenta".colored.brightMagenta()
     */
    public func brightMagenta(): This {
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
     * "brightcyan".colored.brightCyan()
     */
    public func brightCyan(): This {
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
     * "brightwhite".colored.brightWhite()
     */
    public func brightWhite(): This {
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
     * "red".colored.setFgColor(Color.Red)
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

    // #region bg color
    /**
     * 输出背景色黑色
     * ANSI 值 40
     *
     * @return ColoredString
     *
     * @example
     * "black".colored.onBlack()
     */
    public func onBlack(): This {
        this.setBgColor(Color.Black)
        return this
    }

    /**
     * 输出背景色红色
     * ANSI 值 41
     *
     * @return ColoredString
     *
     * @example
     * "black".colored.onRed()
     */
    public func onRed(): This {
        this.setBgColor(Color.Red)
        return this
    }

    /**
     * 输出背景色绿色
     * ANSI 值 42
     *
     * @return ColoredString
     *
     * @example
     * "black".colored.onGreen()
     */
    public func onGreen(): This {
        this.setBgColor(Color.Green)
        return this
    }
    /**
     * 输出背景色黄色
     * ANSI 值 43
     *
     * @return ColoredString
     *
     * @example
     * "black".colored.onYellow()
     */
    public func onYellow(): This {
        this.setBgColor(Color.Yellow)
        return this
    }

    /**
     * 输出背景色蓝色
     * ANSI 值 44
     *
     * @return ColoredString
     *
     * @example
     * "black".colored.onBlue()
     */
    public func onBlue(): This {
        this.setBgColor(Color.Blue)
        return this
    }
    /**
     * 输出背景色洋红色
     * ANSI 值 45
     *
     * @return ColoredString
     *
     * @example
     * "black".colored.onMagenta()
     */
    public func onMagenta(): This {
        this.setBgColor(Color.Magenta)
        return this
    }
    /**
     * 输出背景色青色
     * ANSI 值 46
     *
     * @return ColoredString
     *
     * @example
     * "black".colored.onCyan()
     */
    public func onCyan(): This {
        this.setBgColor(Color.Cyan)
        return this
    }
    /**
     * 输出背景色白色
     * ANSI 值 47
     *
     * @return ColoredString
     *
     * @example
     * "black".colored.onWhite()
     */
    public func onWhite(): This {
        this.setBgColor(Color.White)
        return this
    }

    /**
     * 输出背景色亮黑色
     * ANSI 值 100
     *
     * @return ColoredString
     *
     * @example
     * "black".colored.onBrightBlack()
     */
    public func onBrightBlack(): This {
        this.setBgColor(Color.BrightBlack)
        return this
    }

    /**
     * 输出背景色亮红色
     * ANSI 值 101
     *
     * @return ColoredString
     *
     * @example
     * "black".colored.onBrightRed()
     */
    public func onBrightRed(): This {
        this.setBgColor(Color.BrightRed)
        return this
    }

    /**
     * 输出背景色亮绿色
     * ANSI 值 102
     *
     * @return ColoredString
     *
     * @example
     * "black".colored.onBrightGreen()
     */
    public func onBrightGreen(): This {
        this.setBgColor(Color.BrightGreen)
        return this
    }

    /**
     * 输出背景色亮黄色
     * ANSI 值 103
     *
     * @return ColoredString
     *
     * @example
     * "black".colored.onBrightYellow()
     */
    public func onBrightYellow(): This {
        this.setBgColor(Color.BrightYellow)
        return this
    }
    /**
     * 输出背景色亮蓝色
     * ANSI 值 104
     *
     * @return ColoredString
     *
     * @example
     * "black".colored.onBrightBlue()
     */
    public func onBrightBlue(): This {
        this.setBgColor(Color.BrightBlue)
        return this
    }

    /**
     * 输出背景色亮洋红色
     * ANSI 值 105
     *
     * @return ColoredString
     *
     * @example
     * "black".colored.onBrightMagenta()
     */
    public func onBrightMagenta(): This {
        this.setBgColor(Color.BrightMagenta)
        return this
    }

    /**
     * 输出背景色亮青色
     * ANSI 值 106
     *
     * @return ColoredString
     *
     * @example
     * "black".colored.onBrightCyan()
     */
    public func onBrightCyan(): This {
        this.setBgColor(Color.BrightCyan)
        return this
    }

    /**
     * 输出背景色亮白色
     * ANSI 值 107
     *
     * @return ColoredString
     *
     * @example
     * "black".colored.onBrightWhite()
     */
    public func onBrightWhite(): This {
        this.setBgColor(Color.BrightWhite)
        return this
    }

    /**
     * 为了内部单元测试方便，配合 enum Color 遍历检查结果的
     * 本函数和 enum Color 暂时考虑不对外公开，减少用户的使用成本
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
    /**
     * 清除背景色
     *
     * @return ColoredString
     *
     * @example
     * "clearBgColor".colored.clearBgColor()
     */
    public func clearBgColor(): This {
        this.bgcolor = None<Color>
        return this
    }
    // #endregion bg color

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
        this.clearBgColor()

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
        this.addStyle(Style.Bold)
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
        this.addStyle(Style.Dimmed)
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
        this.addStyle(Style.Italic)
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
        this.addStyle(Style.Underline)
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
        this.addStyle(Style.Blink)
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
        this.addStyle(Style.Reversed)
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
        this.addStyle(Style.Hidden)
        return this
    }

    /**
     * 增加删除线样式
     * ANSI 值 9
     *
     * @return ColoredString
     *
     * @example
     * "delete".colored.strikethrough()
     */
    public func strikethrough(): This {
        this.addStyle(Style.Strikethrough)
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
    protected func addStyle(tmpStyle: Style): This {
        this.style.append(tmpStyle)
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
        this.styleValue = 0
        return this
    }

    // #endregion style

    // #region operator overload

    // cjlint-ignore -start !G.OPR.01 suppress this stupid warning

    // 对，这是前景色
    public operator func ()(color!: TerminalColor): This {
        this.colorAndStyle(fgcolor: color, bgcolor: None, style: None)
        return this
    }

    public operator func ()(style!: TerminalStyle): This {
        this.colorAndStyle(fgcolor: None, bgcolor: None, style: style)

        return this
    }

    // 为了兼容性，保留之前已经提供的color命名参数方法，以后再声明废弃再删除
    public operator func ()(color!: TerminalColor, style!: TerminalStyle): This {
        this.colorAndStyle(fgcolor: color, bgcolor: None, style: style)
        return this
    }

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

public interface Colorize {
    prop colored: ColoredString
}
// cjlint-ignore -end suppress this stupid warning
// 搜索文档“cjlint”“静态检查工具”以了解更多信息

// cjlint-ignore -start !G.ITF.02 suppress this stupid warning
extend String <: Colorize {
    /** 提供给用户用的入口 */
    public prop colored: ColoredString {
        get() {
            return ColoredString(this)
        }
    }

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
