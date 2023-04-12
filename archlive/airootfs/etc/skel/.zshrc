# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

### Woof Stuff
alias cls="clear"
alias icat="kitty +kitten icat"
alias :q="exit"
alias :wq="exit"
alias q="exit"

### starship completions ###
autoload -U compinit
compinit
eval "$(starship init zsh)"
source <(starship completions zsh)
compdef _starship starship