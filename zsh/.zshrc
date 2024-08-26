# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Path to powerlevel10k theme

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Path to lf
source ~/.config/lf/lf.zsh

# List of plugins used
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]] ; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local -a inPkg=("$@")
    local -a arch=()
    local -a aur=()

    for pkg in "${inPkg[@]}"; do
        if pacman -Si "${pkg}" &>/dev/null ; then
            arch+=("${pkg}")
        else 
            aur+=("${pkg}")
        fi
    done

    if [[ ${#arch[@]} -gt 0 ]]; then
        sudo pacman -S "${arch[@]}"
    fi

    if [[ ${#aur[@]} -gt 0 ]]; then
        ${aurhelper} -S "${aur[@]}"
    fi
}

# Helpful aliases
alias  c='clear' # clear terminal
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza --icons --color=always --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias yeet='$aurhelper -Rns' # uninstall package
alias yup='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias yuck='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias vc='code --ozone-platform-hint=wayland --disable-gpu' # gui code editor
alias loginn='python /home/kitsunekode/logout.py'
alias pip='/usr/bin/pip'
alias nfox='prime-run firefox' # run firefox with nvidia gpu
alias nfoxd='prime-run firefox-developer-edition' # run firefox with nvidia gpu
alias aw='prime-run ani-cli' # run ani-cli with nvidia gpu
alias chrome='google-chrome-stable --enable-features=UseOzonePlatform,TouchpadOverscrollHistoryNavigation,VaapiVideoDecodeLinuxGL --ozone-platform=wayland'
alias compass='mongodb-compass --disable-gpu' gui mongodb-compass
alias obs='prime-run flatpak run com.obsproject.Studio'
alias zoom='prime-run flatpak run us.zoom.Zoom'
alias wisdom-tree='python /home/kitsunekode/.local/lib/python3.12/site-packages/wisdom_tree/main.py'
alias t=tmux
alias hist='history'
function hg() {
    history | grep "$1";
}
alias rl='omz reload'
alias q='exit'
alias vi=vim
alias ga='git add'
alias gs='git status'
alias gp='git push'
alias gc='git commit -m'
alias gitc='git clone'
alias gitp='git pull'
alias py='python'
alias spotify='spotify-launcher'

# Handy change dir shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .,='cd $OLDPWD'
alias cb='cd $OLDPWD'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

# Fixes "Error opening terminal: xterm-kitty" when using the default kitty term to open some programs through ssh
alias ssh='kitten ssh'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Display Pokemon
pokemon-colorscripts --no-title -r 1,3,6

#Call neofetch only once
#printf "$-";
#printf "*i*";
#if [[ $- != *i* ]]; then
#	neofetch
#fi

export PATH=$PATH:/home/kitsunekode/.spicetify

if [ ! -f ~/.neofetch_has_run ]; then
    neofetch
    touch ~/.neofetch_has_run
fi

 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export FZF_COMPLETION_TRIGGER=''
#bindkey '^I' fzf-completion
#bindkey '^T' $fzf_default_completion

alias fzp="fzf --preview='bat --color=always {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

export VISUAL=vim
export EDITOR=vim

PATH="/home/kitsunekode/.local/share/solana/install/active_release/bin:$PATH"
alias pacpac='sudo pacman -Syu'
