# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, git-extras, per-directory-history)

alias ccat=colorize
alias open=xdg-open
alias xclip="xclip -selection c"

source $ZSH/oh-my-zsh.sh

# User configuration

export GHC_BIN=$HOME/ghc_bins/ghc-8.0.1/bin

export ORIG_PATH=\
$HOME/bin:\
$HOME/.local/bin:\
$HOME/jdk1.8.0_25/bin:\
$HOME/arc/arcanist/bin:\
$HOME/.cabal/bin:\
$HOME/.cargo/bin:\
$GHC_BIN:\
$PATH
export PATH=$ORIG_PATH

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export JAVA_HOME=$HOME/jdk1.8.0_25/
export JAVA_ROOT=$HOME/jdk1.8.0_25/

unset SSH_ASKPASS

export TERM=xterm-256color

export LD_LIBRARY_PATH=$HOME/lib:$HOME/lib64:/usr/local/lib64:$LD_LIBRARY_PATH
export LIBRARY_PATH=$HOME/lib:$HOME/lib64:$LIBRARY_PATH
export CPLUS_INCLUDE_PATH=$HOME/include:$CPLUS_INCLUDE_PATH
export C_INCLUDE_PATH=$HOME/include:$C_INCLUDE_PATH
export PKG_CONFIG_PATH=$HOME/lib/pkgconfig:$HOME/lib64/pkgconfig:$PKG_CONFIG_PATH

alias gd="git diff --color"
alias gdc="git diff --color --cached"
alias gc="git commit -m"
alias gb="git checkout"
alias gcb="git checkout -b"
alias gpom="git push origin master"
alias gp="git push"
alias gs="git status"

alias gdb="gdb -q"

# edit-command-line
bindkey "^X^E" edit-command-line

# start a new terminal at the same directory
bindkey -s "^N^N" 'konsole\n'

load_ghc_dev() {
    export PATH=/home/kelvin/haskell/ghc/inplace/bin:$PATH
}

add_path() {
    export PATH=$1:$PATH
}

ubx_sum() {
    add_path $HOME/ghc_bins/ghc-ubx-sums-1.6/bin
}

add_ghc() {
    export PATH=$HOME/haskell/$1/inplace/bin:$PATH
}

reset_path() {
    export PATH=$ORIG_PATH
}

ns() {
    $* && notify-send "Done: $*"
}

:r() {
    fg cabal repl || fg ghci || fg stack repl
}

mc() {
    mkdir $1 && cd $1
}

x86() {
    lynx $HOME/Documents/x86/html/index.html -nolog -nomore -nopause -show_cursor -vikeys
}

cref() {
    lynx $HOME/Documents/cppref/reference/en/index.html -nolog -nomore -nopause -show_cursor -vikeys
}

tags() {
    time (rm -f tags && fast-tags --no-module-tags driver ghc compiler -R +RTS -N4 && sed -i.bak '/vectorise/d' ./tags)
}

rtstags() {
    tags
    time (ctags --append -R rts/**/*.c rts/**/*.h includes/**/*.h)
}

st() {
    git stash show -p stash@{$1}
}

layout() {
    sh $HOME/.screenlayout/$1.sh
}

# TODO: Write unload_ghc_dev()
