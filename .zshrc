OS=`uname -s`

if [ $OS = "Darwin" ]; then
  OS="mac"
elif [ $OS = "Linux" ]; then
  OS="linux"
else
  OS="unknown"
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="norm"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias J="/Applications/j64-701/bin/jconsole; exit;"
alias rake="noglob rake" # allows square brackts for rake task invocation
alias brake='noglob bundle exec rake' # execute the bundled rake gem
alias srake='noglob sudo rake' # noglob must come before sudo
alias sbrake='noglob sudo bundle exec rake' # altogether now ... 
alias julia="exec '/Applications/Julia-0.2.1.app/Contents/Resources/julia/bin/julia'"

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
    find $1 -type f -mtime +1 -not -path "*/.hg/*" 
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
plugins=(git autojump brew compleat mercurial npm web-search history-substring-search)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...

bindkey -v
bindkey -M viins '^r' history-incremental-search-backward

if [[$OS == "mac"]]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source ~/.bin/tmuxinator.zsh

  defaults write -g InitialKeyRepeat -int 10
  defaults write -g KeyRepeat -int 1
  defaults write -g ApplePressEndHoldEnabled -bool false

  export PATH=/usr/local/bin:/usr/local/sbin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/Users/rich/bin:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin:/usr/local/share/npm/bin
fi

zmodload zsh/net/tcp
export VAGRANT_DEFAULT_PROVIDER='vmware_fusion'
export HOMEBREW_TEMP=~/tmp 
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
