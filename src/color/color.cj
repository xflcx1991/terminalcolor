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

    public func toString(): String {
        return match (this) {
            case Black => "Black-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Red => "Red-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Green => "Green-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Yellow => "Yellow-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Blue => "Blue-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Magenta => "Magenta-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case Cyan => "Cyan-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case White => "White-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case BrightBlack => "BrightBlack-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case BrightRed => "BrightRed-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case BrightGreen => "BrightGreen-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case BrightYellow => "BrightYellow-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case BrightBlue => "BrightBlue-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case BrightMagenta => "BrightMagenta-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case BrightCyan => "BrightCyan-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
            case BrightWhite => "BrightWhite-fg:${this.toFgStr()}-bg:${this.toBgStr()}"
        }
    }
    // #region color codes
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
            case Black => "30"
            case Red => "31"
            case Green => "32"
            case Yellow => "33"
            case Blue => "34"
            case Magenta => "35"
            case Cyan => "36"
            case White => "37"
            case BrightBlack => "90"
            case BrightRed => "91"
            case BrightGreen => "92"
            case BrightYellow => "93"
            case BrightBlue => "94"
            case BrightMagenta => "95"
            case BrightCyan => "96"
            case BrightWhite => "97"
        }
    }

    protected func toBgStr(): String {
        return match (this) {
            case Black => "40"
            case Red => "41"
            case Green => "42"
            case Yellow => "43"
            case Blue => "44"
            case Magenta => "45"
            case Cyan => "46"
            case White => "47"
            case BrightBlack => "100"
            case BrightRed => "101"
            case BrightGreen => "102"
            case BrightYellow => "103"
            case BrightBlue => "104"
            case BrightMagenta => "105"
            case BrightCyan => "106"
            case BrightWhite => "107"
        }
    }
    // #endregion
}
