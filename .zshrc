# Path to your oh-my-zsh installation.

export ZSH="/Users/mmg/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#333333"


export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'ls {}'"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

. ~/.fzf.zsh

[ -f "/Users/mmg/.ghcup/env" ] && source "/Users/mmg/.ghcup/env" # ghcup-env

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mmg/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mmg/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/mmg/opt/anaconda3/etc/profile.d/conda.sh"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/Users/mmg/opt/anaconda3/bin:$PATH"
export PATH="~/.emacs/bin:$PATH"
export PATH="/Users/mmg/bin:$PATH"
export PATH="/Users/mmg/bin:$PATH"
export PATH="/Users/mmg/go/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export JDK_HOME="/usr/local/opt/openjdk"
export JAVA_HOME="/usr/local/opt/openjdk"

alias eslint="node ~/node_modules/eslint/bin/eslint.js"
alias luamake=/Users/mmg/luamake/luamake
alias v=nvim
alias f="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

export PATH="/Users/mmg/git-fuzzy/bin:$PATH"
bindkey '^ ' autosuggest-accept
