# Path to your oh-my-zsh installation.

DISABLE_AUTO_UPDATE="true"
export ZSH="/Users/mmg/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#333333"

bindkey '^l' autosuggest-accept

# export FZF_DEFAULT_COMMAND="fd --type file --color=always"
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

. ~/.openai-key

# if this is on mac os
if [[ "$OSTYPE" == "darwin"* ]]; then
        export PATH="/Users/mmg/bin:$PATH"
        export PATH=/Users/mmg/google-cloud-sdk/bin:$PATH
        export PATH=/Users/mmg/nvim-macos/bin:$PATH
        export PATH=/Applications/Docker.app/Contents/Resources/bin/:$PATH
        . "/Users/mmg/miniconda3/etc/profile.d/conda.sh"
        source /Users/mmg/.docker/init-zsh.sh || true # Added by Docker Desktop

        test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
fi

alias v=nvim
alias vim=nvim
alias vi=nvim

alias f="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias g="git"
alias gs="git status"
alias gco="git checkout"
alias gcm="git checkout master"
alias gcb="git checkout -b"
alias gpl="git pull"

# checkout previous commit
alias gcp="git checkout HEAD^"

# checkout next commit
alias gcn="git checkout HEAD@{1}"

# Aweseome aliases everyone should have
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"
alias c="clear"
alias h="history"
alias j="jobs -l"
alias l="ls -lah"
alias la="ls -A"
alias ll="ls -lh"
alias ls="ls -G"
alias mkdir="mkdir -p"
alias p="ps aux | grep -v grep | grep -i -e VSZ -e"
alias rm="rm -i"


