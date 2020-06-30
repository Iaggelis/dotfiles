# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin/scripts:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH


export EDITOR='vim'
# Path to your oh-my-zsh installation.
export ZSH="/home/john/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_PROMPT_PREFIXES_SHOW=false
SPACESHIP_DIR_TRUNC=1


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# autoload -U colors && colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
#

## vi mode
##bindkey -v


#export KEYTIMEOUT=1
#
## Edit line in vim with ctrl-e:
#autoload edit-command-line; zle -N edit-command-line
#bindkey '^e' edit-command-line
##
### Change cursor shape for different vi modes.
##function zle-keymap-select {
##  if [[ ${KEYMAP} == vicmd ]] ||
##     [[ $1 = 'block' ]]; then
##    echo -ne '\e[1 q'
##  elif [[ ${KEYMAP} == main ]] ||
##       [[ ${KEYMAP} == viins ]] ||
##       [[ ${KEYMAP} = '' ]] ||
##       [[ $1 = 'beam' ]]; then
##    echo -ne '\e[5 q'
##  fi
##}
##zle -N zle-keymap-select
##zle-line-init() {
##    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
##    echo -ne "\e[5 q"
##}
##zle -N zle-line-init
##echo -ne '\e[5 q' # Use beam shape cursor on startup.
##preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

###### ROOT #########
export ROOTSYS=$HOME/Programs/root
#export ROOTSYS=$HOME/Programs/root6.20.06
export PATH=$ROOTSYS/bin:$PYTHONDIR/bin:$PATH
export LD_LIBRARY_PATH=$ROOTSYS/lib:$PYTHONDIR/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$ROOTSYS/lib:$PYTHONPATH
export CPATH=$ROOTSYS/include:$CPATH
. $ROOTSYS/bin/thisroot.sh

######GEANT4#####
export G4SYS=$HOME/Programs/Geant4/geant4.10.06-install/lib/Geant4-10.6.2
export CPATH=$HOME/Programs/Geant4/geant4.10.06-install/include/Geant4:$CPATH
cd $HOME/Programs/Geant4/geant4.10.06-install/bin 
source ./geant4.sh
cd - > /dev/null


##### PYTHIA ###############
export PYTHIA8=$HOME/Programs/pythia/pythia8301
export PYTHIA8DATA=$PYTHIA8/share/Pythia8/xmldoc
export LD_LIBRARY_PATH=$PYTHIA8/lib:$LD_LIBRARY_PATH
export CPATH=$PYTHIA8/include:$CPATH
export PYTHONPATH=$PYTHIA8/lib:$PYTHONPATH

alias upd='sudo pacman -Syyu && yay -Syu'
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/john/miniconda3/bin/conda' 'shell.bash' 'hook    ' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/john/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/john/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/john/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


alias study='$HOME/miniconda3/bin/pomodoro 30 5 --timer=True --notif=True --repeat=3 --alarm=False'

# Connect monitor with mirroring
alias SameMonitor="xrandr --output DP1 --auto --same-as eDP1"

# Connect monitor as extended
alias NextMonitor="xrandr --output DP1 --auto --right-of eDP1"

# Disconnect monitor
alias NoMonitor="xrandr --output DP1 --off"

alias ls="lsd"

# auto init my key
alias lkey='sh ~/.l_key'

#alias rethernet='sudo modprobe -r r8168 && sudo modprobe r8168'
alias today='date +%Y%m%d'

alias mv='mv -iv'
alias cp='cp -v'
alias rm='rm -iv'


export XDG_CONFIG_HOME="$HOME/.config"
source /usr/share/fzf/completion.zsh
# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER="~~"

# Options to fzf command
export FZF_COMPLETION_OPTS="+c -x"

_fzf_compgen_path() {
fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
fd --type d --hidden --follow --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}


alias gS='cd $HOME/Documents/SubAtomics/Semester4'

export MANWIDTH=81
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"    
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n' 


alias se='cd $HOME/.local/bin && vim $(fzf)'
