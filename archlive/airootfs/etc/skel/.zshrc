# Created by newuser for 5.8.1

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# Plugin history-search-multi-word loaded with investigating.
zinit load zdharma-continuum/history-search-multi-word

# Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

# Snippet
zinit snippet https://gist.githubusercontent.com/hightemp/5071909/raw/

### Woof
alias clear="clear; pfetch"
alias icat="kitty +kitten icat"
alias :q="exit"
alias :wq="exit"
alias q="exit"
alias vim="nvim"

### starship completions ###
autoload -U compinit
compinit
source <(starship completions zsh | sed '$d')
compdef _starship starship
export GPG_TTY=$(tty)

command_not_found_handler() {
    # Find which package contains the file with the path /usr/bin/COMMAND
    package_name=$(pacman -Fq "/usr/bin/$1" | head)

    # If no package is found output the error message which ZSH shows by default
    [[ -z "$package_name" ]] && echo "zsh: command not found: $1" && exit 1

    # Notify user and ask whether or not they want to install the package
    echo -e "Command '\e[1m$1\e[0m' not found, but was found in the '\e[1m$package_name\e[0m' package."
    echo -n "Would you like to install it? [Y/n] "
    read -k confirm
    echo "\n"

    [[ "$confirm" == [yY] ]] && sudo pacman -S "$package_name"
}
