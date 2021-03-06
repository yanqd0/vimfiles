# vimfiles

![Release](https://img.shields.io/github/release/yanqd0/vimfiles.svg)
![License](https://img.shields.io/github/license/yanqd0/vimfiles.svg)

## Description

This repository holds my personal vim configurations.

*It's not recommended to use it directly yet.*

## Usage

This repository becomes unstable recently.
Many vim8 plugins will be installed to replace old ones at `master`.

Use the tag `0.2.1` instead, if there is someone want to use.

```sh
git clone --recursive https://github.com/yanqd0/vimfiles.git -b 0.2.1 ~/.vim
vim -c PluginInstall
```

[Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe) needs to be compiled isolately.

```sh
cd ~/.vim/bundle/YouCompleteMe/
./install.py --all
```

## Relation

This repository is related to:

- [bashes](https://github.com/yanqd0/bashes)
- [dotfiles](https://github.com/yanqd0/dotfiles)

And inspired by:

- [spf13/spf13-vim](https://github.com/spf13/spf13-vim)
- [liangxianzhe/oh-my-vim](https://github.com/liangxianzhe/oh-my-vim)
- [vim-dist/webvim](https://github.com/vim-dist/webvim)
- [skwp/dotfiles](https://github.com/skwp/dotfiles)

## License

[![Unlicense](https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/PD-icon.svg/120px-PD-icon.svg.png)](https://commons.wikimedia.org/wiki/File:PD-icon.svg)

This project is under the term of the **Unlicense**.

> This is free and unencumbered software released into the public domain.
>
> see: <http://unlicense.org>
