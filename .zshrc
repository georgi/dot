# Path to your oh-my-zsh installation.

DISABLE_AUTO_UPDATE="true"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="eastwood"
plugins=(git zsh-autosuggestions kubectl docker docker-compose fzf fzf-tab)

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
  fdfind --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fdfind --type d --hidden --follow --exclude ".git" . "$1"
}

. ~/.fzf.zsh

# if this is on mac os
if [[ "$OSTYPE" == "darwin"* ]]; then
        export PATH="/Users/mmg/bin:$PATH"
        export PATH=/Users/mmg/google-cloud-sdk/bin:$PATH
        export PATH=/Users/mmg/nvim-macos/bin:$PATH
        export PATH=/Applications/Docker.app/Contents/Resources/bin/:$PATH
        source /Users/mmg/.docker/init-zsh.sh || true # Added by Docker Desktop

        test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
fi

export PATH="${HOME}/dasht/bin:$PATH"
export MANPATH="${HOME}/dasht/man:$MANPATH"
source "${HOME}/dasht/etc/zsh/completions.zsh"

export EDITOR=nvim

alias s="sudo"
alias d="docker"
alias g="git"
alias h="history"
alias c="conda"
alias ca="conda activate"
alias b="bat"
alias t="tree"
alias n="neovide --multigrid"
alias i="ipython"
alias j="jobs -l"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"
alias l="ls -lah"
alias la="ls -A"
alias ll="ls -lh"
alias ls="ls -G"
alias lg="lazygit"
alias mkdir="mkdir -p"
alias p="ps aux | grep -v grep | grep -i -e VSZ -e"
alias rm="rm -i"

alias fd=fdfind
alias f="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias g="git"
alias gs="git status"
alias gco="git checkout"
alias gcm="git checkout master"
alias gcb="git checkout -b"
alias gpl="git pull"
alias gpu="git push"

# checkout previous commit
alias gcp="git checkout HEAD^"

# checkout next commit
alias gcn="git checkout HEAD@{1}"


# conda aliases
alias ca="conda activate"
alias cenv="conda env"
alias cenvl="conda env list"
alias cenvc="conda env create"
alias cenvr="conda env remove"
alias cenvu="conda env update"
alias cenvi="conda env info"
alias cenva="conda env export --no-builds > environment.yml"
alias cenvc="conda env create --file environment.yml"
alias cenvu="conda env update --file environment.yml --prune"


# kubectl aliases
alias k="kubectl"
alias kg="kubectl get"
alias kga="kubectl get all"
alias kgd="kubectl get deployments"
alias kgp="kubectl get pods"
alias kgs="kubectl get services"
alias kgn="kubectl get nodes"
alias kgc="kubectl get configmaps"
alias kge="kubectl get events"
alias kgr="kubectl get replicasets"
alias kgi="kubectl get ingress"

alias kd="kubectl describe"
alias kdp="kubectl describe pods"
alias kdd="kubectl describe deployments"
alias kds="kubectl describe services"
alias kdn="kubectl describe nodes"
alias kdc="kubectl describe configmaps"
alias kde="kubectl describe events"
alias kdr="kubectl describe replicasets"
alias kdi="kubectl describe ingress"

alias krm="kubectl delete"
alias krmf="kubectl delete -f"
alias krmgp="kubectl delete --grace-period=0 --force"
alias krmgpf="kubectl delete --grace-period=0 --force -f"

alias kaf="kubectl apply -f"
alias kafk="kubectl apply -f -k"

alias kex="kubectl exec -it"
alias klo="kubectl logs -f"

alias kctx="kubectl config use-context"
alias kctxs="kubectl config get-contexts"
alias kctxc="kubectl config current-context"

alias kdr="kubectl drain"
alias kunc="kubectl uncordon"
alias kdel="kubectl delete"

# kubectl monitoring
alias ktop="kubectl top"
alias ktopp="kubectl top pods"
alias ktopn="kubectl top nodes"

# kubectl port forwarding
alias kpf="kubectl port-forward"
alias kpfsvc="kubectl port-forward svc"


# kubectl debugging
alias kdebug="kubectl run -i --tty --rm debug --image=busybox --restart=Never -- sh"

# kubectl kustomize
alias kust="kubectl kustomize"

# kubectl krew
alias krew="kubectl krew"

# kubectl k9s
alias k9s="k9s"


# Minikube aliases

alias mk="minikube"

# minikube service aliases
alias mks="minikube service"
alias mksg="minikube service list"
alias mksgp="minikube service list --url"
alias mkdebug="minikube ssh"
alias mkad="minikube addons"
alias mkd="minikube dashboard"
alias mkk="minikube kubectl"
alias mkdocker="minikube docker-env"
alias mkssh="minikube ssh"
alias mkst="minikube status"
alias mkstart="minikube start"
alias mkstop="minikube stop"
alias mkdel="minikube delete"
alias mkip="minikube ip"
alias mkcfg="minikube config"
alias mkall="alias | grep mk"
alias kall="alias | grep kubectl"
alias awsall="alias | grep aws"
alias gall="alias | grep git"
alias dall="alias | grep docker"
alias call="alias | grep conda"
alias vall="alias | grep vim"
alias zall="alias | grep zsh"


# vim aliases
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias vdiff="nvim -d"



# useful aliases for aws cli

set_aws_aliases() {
  alias s3="aws s3"
  alias sqs="aws sqs"
  alias ec2="aws ec2"
  alias ssm="aws ssm"
  alias iam="aws iam"
  alias sts="aws sts"
  alias ses="aws ses"
  alias ecr="aws ecr"
}

set_aws_aliases

use_localstack() {
  alias aws="aws --endpoint-url=http://localhost:4566"
  set_aws_aliases
}


. ~/.openai-key
. ~/.localstack-key

eval "$(github-copilot-cli alias -- "$0")"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mmg/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if anaconda3 is installed
if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
  . $HOME/anaconda3/etc/profile.d/conda.sh
  export PATH="$HOME/anaconda3/bin:$PATH"
fi

# if miniconda is installed
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
  . $HOME/miniconda3/etc/profile.d/conda.sh
  export PATH="$HOME/miniconda3/bin:$PATH"
fi

# <<< conda initialize <<<


# pnpm
export PNPM_HOME="/Users/mmg/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform


ZSH_AUTOSUGGEST_STRATEGY=(history completion)
enable-fzf-tab
