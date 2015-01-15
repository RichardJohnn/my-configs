# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="riblet"

## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias J="/Applications/j64-701/bin/jconsole"
alias rake="noglob rake" # allows square brackts for rake task invocation
alias brake='noglob bundle exec rake' # execute the bundled rake gem
alias srake='noglob sudo rake' # noglob must come before sudo
alias sbrake='noglob sudo bundle exec rake' # altogether now ...
alias julia="exec '/Applications/Julia-0.2.1.app/Contents/Resources/julia/bin/julia'"
alias s="sound"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
alias highlight="ack -i --passthru"
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias xsp-profiler="MONO_OPTIONS=--profile=log xsp4"
alias dirs="dirs -v"
alias omni="mono /Users/rich/.vim/bundle/YouCompleteMe/python/ycm/completers/cs/OmniSharpServer/OmniSharp/bin/Debug/OmniSharp.exe -v -s ~/eflex/WebApi/EFlex.sln"
alias cling="/Users/rich/Documents/cling/inst/bin/cling"

function c () {
  cd "$@" && ls
}

function grap {
  grep -iIrn $1 *
}

function removeExtension {
  for file in *.$1; do
      mv $file ${file%%.$1}
  done
}

function volume {
  osascript -e "set Volume $@"
}

function lastModified {
  find $1 -type f -ctime -0 -not -path "*/.hg/*"
}

function findTag {
  mdfind "kMDItemUserTags == $@"
}

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump brew compleat mercurial npm history-substring-search)

DIRSTACKSIZE=6
setopt autopushd pushdminus pushdsilent pushdtohome

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.bin/tmuxinator.zsh
source ~/.profile
unsetopt correct_all

# ZSH Higher Order Functions
source ~/repos/my-configs/functional.zsh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/Users/rich/bin:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin
export LD_LIBRARY_PATH=/Library/Frameworks/Mono.framework/Versions/Current/lib

bindkey -v
bindkey -M viins '^r' history-incremental-search-backward

defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

zmodload zsh/net/tcp
defaults write -g ApplePressEndHoldEnabled -bool false
export VAGRANT_DEFAULT_PROVIDER='vmware_fusion'
export HOMEBREW_TEMP=~/tmp

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$PATH:$HOME/repos/sdb/bin" # Add RVM to PATH for scripting

#virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

source /sw/bin/init.sh
