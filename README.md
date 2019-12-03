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

### Install python, python-devel

https://github.com/Valloric/YouCompleteMe#fedora-linux-x64
```
sudo zypper install automake gcc gcc-c++ kernel-devel cmake python-devel python3-devel
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
git dag alias
fzf customization
font patch for vim-airline
configure autocomplete to use tab completion
language servers
syntastic replacement
