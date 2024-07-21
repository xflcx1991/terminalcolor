# terminalcolor

[![Crates.io](https://img.shields.io/badge/terminalcolor-0.0.5-2A6FDD)](https://gitcode.com/xffish/terminalcolor/overview) [![Crates.io](https://img.shields.io/badge/license-MulanPSL2-3DA638)](https://gitcode.com/xffish/terminalcolor/blob/main/LICENSE)

> 0.0.2版本有问题，请使用 0.0.5 版本

Coloring terminal so simple, you already know how to do it!

```java
    "this is blue".colored.blue()
    "this is red".colored.red()
    "this is red with bold".colored.red().bold()
    "this is also red with bold".colored.bold().red()
    "bright colors are welcome as well".colored.brightgreen()
    "you can also make bold comments".colored.bold()
    '${"or use".colored.cyan()} ${"any".colored.italic()} ${"style type".colored.yellow()}'
    "or change advice. This is red".colored.yellow().blue().red()
    "or clear things up. This is default color and style".colored.red().bold().clear()
    "or just clear color".colored.white().underline().clearFgColor()
    "or just clear style".colored.black().blink().clearStyle()
    // any order is allowed
    "just work".colored.reversed().strikethrough().brightmagenta()
```


![image.png](https://s2.loli.net/2024/07/21/NXsyIQkBj2bJiov.png)


## How to use

1. Add this in your `cjpm.toml`:

```toml
[dependencies]
terminalcolor = { git = "https://gitcode.com/xffish/terminalcolor.git", tag = "0.0.5" }
```
2. run `cjpm update` to update cjpm.lock file

3. add this to your code:

```java
    import terminalcolor.Colorize

    // color function return `ColoredString` type
    // but you can treat is as String
    main():Unit {
        // Ta-da!red text is shown
        println("this is red".colored.red())
    }
```

## Features
- 4-bit(16) ANSI colors support
- Great editor support. Completion everywhere. Less time debugging.
- Don't support background color yet
- Don't support style yet
- Don't intend to support 256 colors
- Don't intend to support truecolors
- Test on Linux、Windows 10 21H2（powershell and cmd）

completion

![image.png](https://s2.loli.net/2024/07/21/falRcn5jKEpquBM.png)



#### Colors:

- black
- red
- green
- yellow
- blue
- magenta
- cyan
- white
- brightblack
- brightred
- brightgreen
- brightyellow
- brightblue
- brightmagenta
- brightcyan
- brightwhite

#### Styles:

- bold
- dimmed
- italic
- underline
- blink
- reversed
- hidden
- strikethrough

## Todo

- **More tests ?**
- do more test on windows macOS
- add background color support
- let ColoredString can add String to expand the color text in an intuitive way

## Credits
This library wouldn't have been the same without the marvelous rust crate [colored](https://github.com/colored-rs/colored).


## Minimum Supported Cangjie Version (cjnative)
The current cjnative is `0.53.4`, which has a huge set of changes.

## License

[Mulan Permissive Software License v2](https://opensource.org/license/mulanpsl-2-0). See the
[LICENSE](https://gitcode.com/xffish/terminalcolor/blob/main/LICENSE) file at the
root of the repository.


## Contributors

- xffish: [@xffsh](https://gitcode.com/xffish)
