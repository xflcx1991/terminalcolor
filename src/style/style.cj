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

internal package terminalcolor.style

protected enum Style <: ToString & Equatable<Style> {
    | Bold
    | Dimmed
    | Italic
    | Underline
    | Blink
    | Reversed
    | Hidden
    | Strikethrough
    // 双下划线、上划线等不考虑支持
    // wikipedia 说了支持的不多
    // https://en.wikipedia.org/wiki/ANSI_escape_code#SGR_(Select_Graphic_Rendition)_parameters // cjlint-ignore !G.OTH.03 suppress this stupid warning

    // protected static prop STYLE: Array<Style> {
    //     get() {
    //         return [Style.Bold, Style.Dimmed, Style.Italic, Style.Underline, Style.Blink, Style.Reversed, Style.Hidden,
    //             Style.Strikethrough]
    //     }
    // }

    public override func toString(): String {
        return match (this) {
            case Style.Bold => "Bold"
            case Style.Dimmed => "Dimmed"
            case Style.Italic => "Italic"
            case Style.Underline => "Underline"
            case Style.Blink => "Blink"
            case Style.Reversed => "Reversed"
            case Style.Hidden => "Hidden"
            case Style.Strikethrough => "Strikethrough"
        }
    }

    // #region style parameter
    // https://tableconvert.com/zh-cn/excel-to-ascii // cjlint-ignore !G.OTH.03 suppress this stupid warning
    // https://en.wikipedia.org/wiki/ANSI_escape_code#SGR_(Select_Graphic_Rendition)_parameters // cjlint-ignore !G.OTH.03 suppress this stupid warning
    // +---------------+------+
    // | Style Name    | Code |
    // +---------------+------+
    // | Bold          | 1    |
    // | Dimmed        | 2    |
    // | Italic        | 3    |
    // | Underline     | 4    |
    // | Blink         | 5    |
    // | Reversed      | 7    |
    // | Hidden        | 8    |
    // | Strikethrough | 9    |
    // +---------------+------+

    protected func toStyleString(): String {
        return match (this) {
            case Style.Bold => "1"
            case Style.Dimmed => "2"
            case Style.Italic => "3"
            case Style.Underline => "4"
            case Style.Blink => "5"
            case Style.Reversed => "7"
            case Style.Hidden => "8"
            case Style.Strikethrough => "9"
        }
    }
    // #endregion

    public operator override func ==(rhs: Style): Bool { // cjlint-ignore !G.OPR.01  suppress this stupid warning
        return match ((this, rhs)) {
            case (Style.Bold, Style.Bold) => true
            case (Style.Dimmed, Style.Dimmed) => true
            case (Style.Italic, Style.Italic) => true
            case (Style.Underline, Style.Underline) => true
            case (Style.Blink, Style.Blink) => true
            case (Style.Reversed, Style.Reversed) => true
            case (Style.Hidden, Style.Hidden) => true
            case (Style.Strikethrough, Style.Strikethrough) => true
            case (_, _) => false
        }
    }

    public operator override func !=(rhs: Style): Bool { // cjlint-ignore !G.OPR.01  suppress this stupid warning
        return !(this == rhs)
    }
}
