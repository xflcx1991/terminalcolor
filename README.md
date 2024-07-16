# terminalcolor

[![Crates.io](https://img.shields.io/badge/terminalcolor-0.0.1-2A6FDD)](https://gitcode.com/xffish/terminalcolor/overview) [![Crates.io](https://img.shields.io/badge/license-MulanPSL2-3DA638)](https://gitcode.com/xffish/terminalcolor/blob/main/LICENSE)

Coloring terminal so simple, you already know how to do it!

```java
    "this is balck".colored.black();
    "this is red".colored.red();
    "this is green".colored.green();
    "this is yellow".colored.yellow();
    "this is blue".colored.blue();
    "this is magenta".colored.magenta();
    "this is cyan".colored.cyan();
    "this is white".colored.white();
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
- just 8 ANSI standard colors yet
- don't support bright colors yet
- don't support background color yet
- don't support truecolors yet
- don't support style yet
- test on Linux

#### Colors:

- black
- red
- green
- yellow
- blue
- magenta
- cyan
- white


#### Truecolors

Colored has support for truecolors where you can specify any arbitrary rgb value.

This feature will only work correctly in terminals which support true colors (i.e. most modern terminals).

You can check if your terminal supports true color by checking the value of the environment variable `$COLORTERM` on your terminal. A value of `truecolor` or `24bit` indicates that it will work.


## Todo

- **More tests ?**
- add windows Macos?(I have no macos machine) support
- add bright colors support
- add background color support
- add style support
- add truecolors support

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
