# Jimmy's dotfiles

### Link dotfiles

```
./link_dot_files.sh
```

### Install xsel

```
sudo zypper in xsel
```
To use with WSL, install VcXsrv and start XLaunch with defaults: https://superuser.com/a/1345241

### Set up ssh key for GitHub, BitBucket

https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

https://confluence.atlassian.com/bitbucket/set-up-an-ssh-key-728138079.html

### Install universal-ctags

This is needed for vim tagbar plugin.
```
sudo zypper in universal-ctags

sudo ln -s $(which universal-ctags) /usr/local/bin/ctags
```

### Install latest neovim

```
sudo zypper ar https://download.opensuse.org/repositories/editors/openSUSE_Leap_15.1/editors.repo
sudo zypper ref
sudo zypper in neovim python2-neovim python3-neovim
```

### Install Nerd Fonts

https://github.com/ryanoasis/nerd-fonts

Nerd Fonts to make vim-airline and other stuff pretty.

### Install vim plugins

Open nvim, then
```
:PlugInstall
```

### Install nodejs via nvm

https://github.com/creationix/nvm#install-script
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

nvm ls
nvm install node
```

#### Install javascript/typescript language server
```
npm install -g javascript-typescript-langserver
```

### Install python via pyenv

https://github.com/pyenv/pyenv#installation
https://github.com/pyenv/pyenv/wiki
https://github.com/pyenv/pyenv/wiki/Common-build-problems
https://vandragt.com/2018/install-python-371-on-opensuse-tumbleweed
```
sudo zypper install pyenv

# Install python build dependencies
zypper in zlib-devel bzip2 libbz2-devel libffi-devel libopenssl-devel \
readline-devel sqlite3 sqlite3-devel xz xz-devel

# Install latest python version
pyenv install -l
pyenv install 3.7.2
pyenv rehash
pyenv global 3.7.2

# Upgrade pip
which pip
pip install --upgrade pip
```

#### Install AWS CLI

https://docs.aws.amazon.com/cli/latest/userguide/install-cliv1.html
```
pip3 install awscli --upgrade
```

#### Install python language server
https://github.com/palantir/python-language-server

```
pip install python-language-server[pyflakes,rope]
```
Includes:
* Pyflakes linter to detect various errors
* Rope for Completions and renaming

See github link for more linters and formatters you might want.

### Install ruby via rbenv (optional)

https://en.opensuse.org/User:Tsu2/Install_Ruby
```
sudo zypper install automake gdbm-devel libyaml-devel ncurses-devel readline-devel zlib-devel openssl libopenssl-devel ruby-devel

git clone git://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install latest ruby version
rbenv install -l
rbenv install 2.5.1
rbenv rehash
rbenv global 2.5.1
```

#### TODO
upgrade to neovim 0.5 and use floating fzf windows
https://github.com/junegunn/fzf/blob/master/README-VIM.md
nnn.vim
https://github.com/mcchrish/nnn.vim
language servers
syntastic replacement
