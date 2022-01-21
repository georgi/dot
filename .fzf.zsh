# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/mmg/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/mmg/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/mmg/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/mmg/.fzf/shell/key-bindings.zsh"
