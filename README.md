# terminalcolor

[![Crates.io](https://img.shields.io/badge/terminalcolor-0.0.4-2A6FDD)](https://gitcode.com/xffish/terminalcolor/overview) [![Crates.io](https://img.shields.io/badge/license-MulanPSL2-3DA638)](https://gitcode.com/xffish/terminalcolor/blob/main/LICENSE)

> 0.0.2版本有问题，请使用 0.0.4 版本

Coloring terminal so simple, you already know how to do it!

```java
    println("black".colored.black())
    println("red".colored.red())
    println("green".colored.green())
    println("yellow".colored.yellow())
    println("blue".colored.blue())
    println("magenta".colored.magenta())
    println("cyan".colored.cyan())
    println("white".colored.white())
    println("bright black".colored.brightblack())
    println("bright red".colored.brightred())
    println("bright green".colored.brightgreen())
    println("bright yellow".colored.brightyellow())
    println("bright blue".colored.brightblue())
    println("bright magenta".colored.brightmagenta())
    println("bright cyan".colored.brightcyan())
    println("bright white".colored.brightwhite())
```

![image.png](https://s2.loli.net/2024/07/21/Vyae1DSjqw2kPl3.png)


## How to use

1. Add this in your `cjpm.toml`:

```toml
[dependencies]
terminalcolor = { git = "https://gitcode.com/xffish/terminalcolor.git", tag = "0.0.4" }
```
2. run `cjpm update` to update cjpm.lock file

3. add this to your code:

```java
    import terminalcolor.Colorize

    // color function just return `String` type
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


## Todo

- **More tests ?**
- do more test on windows Macos
- add background color support
- add style support
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
