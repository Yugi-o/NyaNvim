<h1 align=center>NyaNvim</h1>

NyaNvim is an easy to use neovim setup, with a variety of plugins that make it a stable and functional editor.

## Showcase

![Alpha Image](/.github/img/alpha.png)
![Code Image](/.github/img/code.png)

## Requeriments

- [Neovim 0.8.1.](https://github.com/neovim/neovim/releases/tag/v0.8.1.)
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) (Optional).
- Optional Requirements:
  - [Ripgrep](https://github.com/BurntSushi/ripgrep) - Live greep telescope search.
  - [Lazygit](https://github.com/jesseduffield/lazygit) - Git ui toggle terminal.
  - [Bottom](https://github.com/ClementTsang/bottom) - Process viewer toggle terminal.
  - [Python](https://www.python.org/) - Python repl toggle terminal.
  - [Node](https://nodejs.org/en/) - Node repl toggle terminal.

## Installation

#### Linux

```
git clone https://github.com/Yugi-o/NyaNvim ~/.config/nvim
nvim +PackerSync
```

#### Windows

###### PowerShell

```
git clone https://github.com/Yugi-o/NyaNvim "$env:LOCALAPPDATA\nvim"
nvim +PackerSync
```

###### Cmd

```
git clone https://github.com/Yugi-o/NyaNvim "%localappdata%\nvim"
nvim +PackerSync
```

## Setup

#### Install LSP

Enter `:Mason` and in the LSP section, search for the language and press `i` to install (press `g?` for more information).

#### Install Formatter

Enter `:Mason` and in the Formatter section, search for the formatter and press `i` to install (press `g?` for more information).

#### Install language parser

enter `:TSInstall` followed by the language name or press `tab` to see the list of languages.

## Credits

I am grateful to the following repositories as without them the development of NyaNvim would not have been possible.
I took various things from these and modified them (I think).

- [AstroNvim](https://github.com/AstroNvim/AstroNvim)
- [nvim-basic-ide](https://github.com/LunarVim/nvim-basic-ide) for [Lunarvim](https://github.com/LunarVim)
- [Neovim-from-scarch](https://github.com/LunarVim/Neovim-from-scratch) for [LunarVim](https://github.com/LunarVim)
