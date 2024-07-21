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

internal package terminalcolor.color

protected enum Color <: ToString {
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
    // 不考虑支持256色和真彩色，真的有必要花里胡哨吗

    protected static prop COLOR: Array<Color> {
        get() {
            return [Color.Black, Color.Red, Color.Green, Color.Yellow, Color.Blue, Color.Magenta, Color.Cyan,
                Color.White, Color.BrightBlack, Color.BrightRed, Color.BrightGreen, Color.BrightYellow,
                Color.BrightBlue, Color.BrightMagenta, Color.BrightCyan, Color.BrightWhite]
        }
    }

    public override func toString(): String {
        return match (this) {
            case Color.Black => "Black-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Color.Red => "Red-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Color.Green => "Green-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Color.Yellow => "Yellow-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Color.Blue => "Blue-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Color.Magenta => "Magenta-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Color.Cyan => "Cyan-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Color.White => "White-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Color.BrightBlack => "BrightBlack-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Color.BrightRed => "BrightRed-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Color.BrightGreen => "BrightGreen-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Color.BrightYellow => "BrightYellow-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Color.BrightBlue => "BrightBlue-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Color.BrightMagenta => "BrightMagenta-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Color.BrightCyan => "BrightCyan-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Color.BrightWhite => "BrightWhite-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
        }
    }
    // #region color codes
    // https://tableconvert.com/zh-cn/excel-to-ascii // cjlint-ignore !G.OTH.03 suppress this stupid warning
    // https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797 // cjlint-ignore !G.OTH.03 suppress this stupid warning
    // +-----------------+------------------------+-----------------------+
    // | Color Name      | Foreground Color Code  | Background Color Code |
    // +-----------------+------------------------+-----------------------+
    // | Black           | 30                     | 40                    |
    // | Red             | 31                     | 41                    |
    // | Green           | 32                     | 42                    |
    // | Yellow          | 33                     | 43                    |
    // | Blue            | 34                     | 44                    |
    // | Magenta         | 35                     | 45                    |
    // | Cyan            | 36                     | 46                    |
    // | White           | 37                     | 47                    |
    // | Bright Black    | 90                     | 100                   |
    // | Bright Red      | 91                     | 101                   |
    // | Bright Green    | 92                     | 102                   |
    // | Bright Yellow   | 93                     | 103                   |
    // | Bright Blue     | 94                     | 104                   |
    // | Bright Magenta  | 95                     | 105                   |
    // | Bright Cyan     | 96                     | 106                   |
    // | Bright White    | 97                     | 107                   |
    // +-----------------+------------------------+-----------------------+

    protected func toFgStr(): String {
        return match (this) {
            case Color.Black => "30"
            case Color.Red => "31"
            case Color.Green => "32"
            case Color.Yellow => "33"
            case Color.Blue => "34"
            case Color.Magenta => "35"
            case Color.Cyan => "36"
            case Color.White => "37"
            case Color.BrightBlack => "90"
            case Color.BrightRed => "91"
            case Color.BrightGreen => "92"
            case Color.BrightYellow => "93"
            case Color.BrightBlue => "94"
            case Color.BrightMagenta => "95"
            case Color.BrightCyan => "96"
            case Color.BrightWhite => "97"
        }
    }

    protected func toBgStr(): String {
        return match (this) {
            case Color.Black => "40"
            case Color.Red => "41"
            case Color.Green => "42"
            case Color.Yellow => "43"
            case Color.Blue => "44"
            case Color.Magenta => "45"
            case Color.Cyan => "46"
            case Color.White => "47"
            case Color.BrightBlack => "100"
            case Color.BrightRed => "101"
            case Color.BrightGreen => "102"
            case Color.BrightYellow => "103"
            case Color.BrightBlue => "104"
            case Color.BrightMagenta => "105"
            case Color.BrightCyan => "106"
            case Color.BrightWhite => "107"
        }
    }
    // #endregion
}
