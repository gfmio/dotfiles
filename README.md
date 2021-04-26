# .dotfiles

My personal Linux and macOS config files.

## Features

- Equivalently configured zsh and bash on macOS and Arch Linux with shared config files
- Tab completion
- Shell integrations
  - nvm
  - pyenv
  - poetry
  - terraform
- macOS:
  - Hammerspoon
  - Shell integrations:
    - homebrew
- Linux:
  - Equivalent i3 and sway configs
  - X config files
  - termite
  - greetd with greetd-gtk as login manager

## Todo

- review/update/align colors/themes
- add vim config
- add vscode config (color theme, extensions, global config)
- i3/sway:
  - deduplicate sway and i3 configs
  - Window restore
  - Window profiles
  - Screenshots
  - Special keys

## Notes

### Why?

- Same behaviour and config in bash and zsh where possible
  - In particular: Adapt bash behaviour loading behaviour to be similar to zsh
- Same behaviour and config on macOS and Linux
- Same behaviour and config across i3 and sway

### Shells, dotfiles and their behaviour

There are three types of shells:

- login shells
- interactive shells
- non-interactive shells

#### bash

In an **login shell**, bash first loads `/etc/profile` if present. `/etc/profile` sets up the environment configuration for all users. bash then executes the first of `~/.bash_profile`, `~/.bash_login` and `~/.profile`.

In an interactive shell, bash executes `~/.bashrc`.

In a non-interactive shell, none of the files are executed.

`~/.bash_logout` is executed when a login session ends.

#### zsh

zsh loads each config file from `/etc/zsh` for all users and then from `$ZDOTDIR` which is by default `$HOME`.

In a login shell, zsh loads `.zshenv`, `.zprofile`, `.zshrc` and `.zlogin`.

In an interactive shell, zsh loads `.zshenv` and `.zshrc`.

In a non-interactive shell, zsh loads `.zshenv`.

`.zlogout` is executed when a login session ends.

### Desired behaviour

#### Non-interactive shells

Only load `.zshenv` but avoid using it.

#### Interactive shells

In zsh, load `.zshenv` and `.zshrc`.

In bash, load `.bashrc`, but source a `.bash_env` to replicate the zsh behaviour.

#### Login shells

In zsh, load `.zshenv`, `.zprofile`, `.zshrc` and `.zlogin`.

In bash, load `.bash_profile`, but source `.bash_env`, `.bashrc` and `.bash_login` to replicate the zsh behaviour.

#### Config sharing between shells

Each dotfile should import a dotfile shared between both shells, i.e. `.zshrc` and `.bashrc` should both import a file `.rc`.

#### Config sharing between OSs

There are linux-specific, macOS-specific and common variants of all files. The OS-specific ones import the common ones and execute them before the OS specific ones, i.e. `macos/home/.bashrc` will load `common/home/.rc`, `common/home/.bashrc` and `macos/home/.rc` before its main body and `linux/home/.bashrc` will load `common/home/.rc`, `common/home/.bashrc` and `linux/home/.rc`.

## License

[MIT](LICENSE)
