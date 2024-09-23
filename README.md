# Setup a new Mac

## Pre-requisite: Install oh my zsh

Run `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

## Install homebrew + git

1. `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. `eval "$(/opt/homebrew/bin/brew shellenv)"`
3. `brew install git`

## Clone down the config repo

```sh
git clone --bare https://github.com/wicksipedia/.cfg $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
```

## Install tools

```sh
xargs -L 1 brew tap < .brews/taps.txt
xargs -L 1 brew install < .brews/brews.txt
xargs -L 1 brew install --cask < .brews/casks.txt
```

## Done

Start a new terminal session and you should be done