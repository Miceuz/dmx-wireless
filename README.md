[![Build Status](https://travis-ci.org/WeAreLeka/Bare-Arduino-Project.svg?branch=master)](https://travis-ci.org/WeAreLeka/Bare-Arduino-Project)

# Bare Arduino Project

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [About](#about)
- [What you get](#what-you-get)
- [How to install and use](#how-to-install-and-use)
- [Bugs](#bugs)
- [Text editors](#text-editors)
	- [Sublime Text - SublimeClang](#sublime-text---sublimeclang)
	- [Vim - YouCompleteMe](#vim---youcompleteme)
	- [Bonus - `.editorconfig`](#bonus---editorconfig)
- [Contributing](#contributing)
- [Copyright and License](#copyright-and-license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## About

Ever wanted to start a new [Arduino](http://arduino.cc/) project and...

*	**not use** the *terrible* Arduino IDE?
*	**use** your **favorite text editor?**
*	**have** decent **code completion** and **syntax checking**?
*	**organize** your `directory tree` **as you like?**
	*	libraries in `lib`
	*	sources in `src`
	*	tests in `tests`
	*	binaries in `bin`
*	**use** a newer version of `avr-gcc` such as `4.8.2` or `4.9.1`?
*	**use** an awesome [`Makefile`](https://github.com/sudar/Arduino-Makefile) to compile and upload your code?

If you answered **yes** to one of the above, this [Bare Arduino Project](https://github.com/weareleka/arduino-project) is just what you're looking for! :)

## What you get

Based on what we've learned on our [Moti project](http://github.com/weareleka/moti), this repo will allow you to:

*	move away from the Arduino IDE and use your favorite text editor such as Vim or SublimeText
*	get up and running in less time
*	use `avr-gcc 4.8 or 4.9` to compile your code
*	use `C++11` for your standard coding
*	use `make` to compile, `make upload` to upload, thanks to [Sudar](https://github.com/sudar/)'s incredible project [Arduino-Makefile](https://github.com/sudar/Arduino-Makefile)
*	use our [Travis-CI](https://travis-ci.org) continuous integration configuration and adapt it to suit your needs

To put it in a nuttshell, it allows you to **write Arduino code as you ever wanted !**

## How to install and use

The full procedure is detailed in [INSTALL.md](./INSTALL.md).

## Bugs

If you encounter some issues while using the [Bare-Arduino-Project](https://github.com/WeAreLeka/bare-arduino-project), please first report the issue [here in this repo issue tracker](https://github.com/WeAreLeka/bare-arduino-project/issues) and **not in Arduino-Makefile**. 

It will allow us to investigate first and not overflow the Arduino-Makefile issue tracker. 

## Text editors

Because we are so awesome, we also provide your with 2 famous text editors configurations!

### Sublime Text - SublimeClang

To code in C/C++, we highly recommend using [SublimeClang](https://github.com/quarnster/SublimeClang), even if the plugin is not maintained anymore. As far as we can tell, it works beautifully well and will save you a lot of time! :)

As [quarnster](https://github.com/quarnster/) puts it:

> Clang plugin for Sublime Text 2 providing auto complete suggestions for C/C++/ObjC/ObjC++. It'll also optionally parse the code as it's typed and show errors and warnings.

The [`bare-arduino.sublime-project`](./bare-arduino.sublime-project) contains all you need to be up and running. Feel free to customize it to your needs with different `flags` for example.

### Vim - YouCompleteMe

Vim is our default text editor and we use the incredible vim plugin [YouCompleteMe](https://github.com/Valloric) for syntax checking and code completion.

As [Valloric](https://github.com/Valloric) puts it:

> YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for Vim. It has several completion engines: an identifier-based engine that works with every programming language, a semantic, Clang-based engine that provides native semantic code completion for C/C++/Objective-C/Objective-C++ (from now on referred to as "the C-family languages"), a Jedi-based completion engine for Python, an OmniSharp-based completion engine for C# and an omnifunc-based completer that uses data from Vim's omnicomplete system to provide semantic completions for many other languages (Ruby, PHP etc.).

The [`.ycm_extra_conf.py`](./.ycm_extra_conf.py) contains everything to be up and running. Beware that you really need to customize it for it to work properly. Each library must be added by hand to use auto completion.

### Bonus - `.editorconfig`

To make sure everything is always formatted as you like, you can customize the [`.editorconfig`](./.editorconfig) file to suit your needs.

Please refer to the [official Editorconfig documentation](http://editorconfig.org/) for more details and to download the plugins needed.

## Contributing

Help is always more than welcome. If you want to take part in this project, please, make sure you read our [Contributing guidelines](./CONTRIBUTING.md).

##Copyright and License

```
The MIT License (MIT)

Copyright (c) 2014 Ladislas de Toldi - ladislas at weareleka dot com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

