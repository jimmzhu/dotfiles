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
```
sudo zypper install pyenv

# Install latest python version
pyenv install -l
pyenv install 3.7.2
pyenv rehash
pyenv global 3.7.2
```

#### Install python language server
```
pip install python-language-server
```

### Install ruby via rbenv

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
