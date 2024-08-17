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

import std.deriving.Derive

@Derive[Equatable] // cjlint-ignore !G.OPR.01 suppress this stupid warning
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

    // protected static prop COLOR: Array<Color> {
    //     get() {
    //         return [Color.Black, Color.Red, Color.Green, Color.Yellow, Color.Blue, Color.Magenta, Color.Cyan,
    //             Color.White, Color.BrightBlack, Color.BrightRed, Color.BrightGreen, Color.BrightYellow,
    //             Color.BrightBlue, Color.BrightMagenta, Color.BrightCyan, Color.BrightWhite]
    //     }
    // }

    public override func toString(): String {
        return match (this) {
            case Color.Black => "Black"
            case Color.Red => "Red"
            case Color.Green => "Green"
            case Color.Yellow => "Yellow"
            case Color.Blue => "Blue"
            case Color.Magenta => "Magenta"
            case Color.Cyan => "Cyan"
            case Color.White => "White"
            case Color.BrightBlack => "BrightBlack"
            case Color.BrightRed => "BrightRed"
            case Color.BrightGreen => "BrightGreen"
            case Color.BrightYellow => "BrightYellow"
            case Color.BrightBlue => "BrightBlue"
            case Color.BrightMagenta => "BrightMagenta"
            case Color.BrightCyan => "BrightCyan"
            case Color.BrightWhite => "BrightWhite"
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

    // public operator override func ==(rhs: Color): Bool { // cjlint-ignore !G.OPR.01  suppress this stupid warning
    //     return match ((this, rhs)) {
    //         case (Color.Black, Color.Black) => true
    //         case (Color.Red, Color.Red) => true
    //         case (Color.Green, Color.Green) => true
    //         case (Color.Yellow, Color.Yellow) => true
    //         case (Color.Blue, Color.Blue) => true
    //         case (Color.Magenta, Color.Magenta) => true
    //         case (Color.Cyan, Color.Cyan) => true
    //         case (Color.White, Color.White) => true
    //         case (Color.BrightBlack, Color.BrightBlack) => true
    //         case (Color.BrightRed, Color.BrightRed) => true
    //         case (Color.BrightGreen, Color.BrightGreen) => true
    //         case (Color.BrightYellow, Color.BrightYellow) => true
    //         case (Color.BrightBlue, Color.BrightBlue) => true
    //         case (Color.BrightMagenta, Color.BrightMagenta) => true
    //         case (Color.BrightCyan, Color.BrightCyan) => true
    //         case (Color.BrightWhite, Color.BrightWhite) => true
    //         case (_, _) => false
    //     }
    // }

    // public operator override func !=(rhs: Color): Bool { // cjlint-ignore !G.OPR.01  suppress this stupid warning
    //     return !(this == rhs)
    // }
}
