# terminalcolor

[![Crates.io](https://img.shields.io/badge/terminalcolor-0.0.1-2A6FDD)](https://gitcode.com/xffish/terminalcolor/overview) [![Crates.io](https://img.shields.io/badge/license-MulanPSL2-3DA638)](https://gitcode.com/xffish/terminalcolor/blob/main/LICENSE)

Coloring terminal so simple, you already know how to do it!

```java
    println("this is balck".colored.black())
    println("this is red".colored.red())
    println("this is green".colored.green())
    println("this is yellow".colored.yellow())
    println("this is blue".colored.blue())
    println("this is magenta".colored.magenta())
    println("this is cyan".colored.cyan())
    println("this is white".colored.white())
```

![goodpoint.png](https://s2.loli.net/2024/07/16/rAZImUpJik1SVQ7.png)


## How to use

Add this in your `cjpm.toml`:

```toml
[dependencies]
terminalcolor = { git = "https://gitcode.com/xffish/terminalcolor.git", tag = "0.0.1" }
```
run `cjpm update` to update `cjpm.lock` file

and add this to your code:

```java
    import terminalcolor.Colorize

    // color function just return `String` type
    main():Unit {
        // Ta-da!red text is shown
        println("this is red".colored.red())
    }
```

## Features
- Just 8 ANSI standard colors yet
- Great editor support. Completion everywhere. Less time debugging.
- Don't support bright colors yet
- Don't support background color yet
- Don't support truecolors yet
- Don't support style yet
- Test on Linux、Windows 10 21H2（powershell and cmd）

completion

![completion](https://s2.loli.net/2024/07/16/pVralOUMzcAEgb5.jpg)



#### Colors:

- black
- red
- green
- yellow
- blue
- magenta
- cyan
- white


## Todo

- **More tests ?**
- add windows Macos?(I have no macos machine) support
- add bright colors support
- add background color support
- add style support
- add truecolors support
- tet ColoredString can add String to expand the color text in an intuitive way

## Credits
This library wouldn't have been the same without the marvelous rust crate [colored](https://github.com/colored-rs/colored).


## Minimum Supported Cangjie Version (cjnative)
The current cjnative is `0.54.3`, which has a huge set of changes.

## License

[Mulan Permissive Software License v2](https://opensource.org/license/mulanpsl-2-0). See the
[LICENSE](https://gitcode.com/xffish/terminalcolor/blob/main/LICENSE) file at the
root of the repository.


## Contributors

- xffish: [@xffsh](https://gitcode.com/xffish)
