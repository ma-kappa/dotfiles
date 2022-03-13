# ma-kappa/dotfiles

ma-kappa/dotfiles is a tool for managing several .(dot) files corresponding to Mac OSX and Linux.

> Regarding Bash support in Git for Windows, we have confirmed that Bash and vim can be used, though not completely.

The management target is the following files.
* .bashrc: Configuration file for Bash.
* .tmux.conf: Configuration file for tmux.
* .vimrc: Configuration file for Vim.

# Installation
Installation is simple. Just clone from the repository and then create symbolic links in the user home directory with a shell script.

```bash
$ git clone https://github.com/ma-kappa/dotfiles.git ~/dotfiles
$ chmod u+x ~/dotfiles/install.sh
$ ~/dotfiles/install.sh
```

> Note: Running this script creates symbolic links to the .(dot) files under "~/dotfiles" in the user directory. For this reason, the existing the .(DOT) files are backed up with the date and time inserted between the file name and the extension. (Ex: .bashrc => .basrhc.20220301120004)



## Directory after installation.

```
~/
 |--dotfiles
 |   |--.git
 |   |--.aliases
 |   |--.bashrc
 |   |--.bashrc.git
 |   |--.bashrc.osx
 |   |--.gitignore
 |   |--.tmux.conf
 |   |--.tmux.conf.osx
 |   |--.vimrc
 |   |--.vimrc.bundle
 |   |--install.sh
 |   `--README.md
 |
 |--.bashrc (Symbolic link => ./dotfiles/.bashrc)
 |--.tmux.conf (Symbolic link => ./dotfiles/.tmux.conf)
 `--.vimrc (Symbolic link => ./dotfiles/.vimrc)
```

## Spec for dotfiles.

| Name           | Spec |
|:---------------|:-----|
| .aliass        | Alias ​​definition for Bash. |
| .bashrc        | Login shell definition for Bash.  |
| .bashrc.git    | Git related command definition. (for Bash) |
| .bashrc.osx    | Mac OSX specific definition. (for Bash) |
| .tmux.conf     | tmux setting file.  |
| .tmux.conf.osx | Mac OSX specific definition. (for tmux)  |
| .vimrc         | Vim setting file.  |
| .vimrc.bundle  | Vim plugin manager (Vundle.vim) definition file. |
| install.sh     | Installation script. |

# Enhancement of Shell (Bash)
T.B.D.

# Setting up tmux
T.B.D.

# Setting up Vim

## Plugin Manager

Use Vundle.vim as the plugin manager.
It is necessary to install Vundle under the .vim/bundle directory by Clone from the following Github repository in advance.

```bash
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### VundleVim
https://github.com/VundleVim/Vundle.vim

### Define plugins
This dotfile defines plugin definitions in a dedicated .vimrc.vundle file. Please refer to the official website and the .vimrc.vundle file for details.

## Vim plugins

The configuration of vim in this repository is used the following Vim plugin.

---

### Utility

#### Vim-Airline
https://github.com/vim-airline/vim-airline

#### Vim-Submode
https://github.com/kana/vim-submode

#### NEADTree
https://github.com/preservim/nerdtree

#### NERDTree Tabs
https://github.com/jistr/vim-nerdtree-tabs

#### NERDTree Git Plugin
https://github.com/Xuyuanp/nerdtree-git-plugin

#### fugitive.vim
https://github.com/tpope/vim-fugitive

#### Vim-Gitgutter
https://github.com/airblade/vim-gitgutter

#### tcomment_vim
https://github.com/tomtom/tcomment_vim

#### emmet-vim
https://github.com/mattn/emmet-vim

#### Tabular
https://github.com/godlygeek/tabular

#### vim-markdown-quote-syntax 
https://github.com/joker1007/vim-markdown-quote-syntax

#### Vim-markdown *(Disabled)*
https://github.com/rcmdnk/vim-markdown

#### Unite *(Disabled)*
https://github.com/Shougo/unite.vim

#### Vim-Auto-Save
https://github.com/vim-scripts/vim-auto-save

---

### Color schema
#### tendor.vim *(Disabled)*
https://github.com/jacoborus/tender.vim

#### lucario *(Disabled)*
https://github.com/raphamorim/lucario

#### hybrid *(Disabled)*
https://github.com/w0ng/vim-hybrid

#### Zenburn
https://github.com/jnurmine/Zenburn

#### tomorrow night *(Disabled)*
https://github.com/chriskempson/tomorrow-theme

#### vim-devicons
https://github.com/ryanoasis/vim-devicons

---

### Installation after defining plugins

After defining plugins are complete, execute the following command to install plugin at Vim.

```bash
$ vim

:PluginInstall
```

To update the installed plugins, enter the following command and execute it at Vim.

```bash
$ vim

:PluginUpdate
```

# The Future?
## Supports for enhancement of Z-Shell
T.B.D.

## Supports for Bash on Git for Windows
T.B.D.

# License
[MIT License](./LICENSE) Copyright (c) 2018-2022 ma-kappa
