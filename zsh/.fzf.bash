# Setup fzf
# ---------
if [[ ! "$PATH" == */home/kitsunekode/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/kitsunekode/.fzf/bin"
fi

eval "$(fzf --bash)"
