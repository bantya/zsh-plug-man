# see: https://github.com/ChristianChiarulli/machfiles/blob/1b33dd4/zsh/.config/zsh/zshrc

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
setopt HIST_IGNORE_SPACE
setopt histignorealldups # substitute commands in the prompt
setopt sharehistory # share the same history between all shells
stty stop undef # disable ctrl+s to freeze terminal
zle_highlight=('paste:none')


# disable the beeps
unsetopt BEEP


# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots) # include hidden files


autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search


# colors
autoload -Uz colors && colors


# vim mode
bindkey -v
export KEYTIMEOUT=1


# useful functions
source "$ZDOTDIR/plugin-manager.zsh"


# load zsh files
zsh_add_file "exports.zsh"
zsh_add_file "aliases.zsh"
zsh_add_file "plugins.zsh"
zsh_add_file "functions.zsh"


# # key-bindings
# bindkey -s '^o' 'ranger^M'
# bindkey -s '^f' 'zi^M'
# bindkey -s '^s' 'ncdu^M'
# # bindkey -s '^n' 'nvim $(fzf)^M'
# # bindkey -s '^v' 'nvim\n'
# bindkey -s '^z' 'zi^M'
# bindkey '^[[P' delete-char
# bindkey "^p" up-line-or-beginning-search # Up
# bindkey "^n" down-line-or-beginning-search # Down
# bindkey "^k" up-line-or-beginning-search # Up
# bindkey "^j" down-line-or-beginning-search # Down
# bindkey -r "^u"
# bindkey -r "^d"
# 
# # fzf 
# [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
# [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"
# # export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
# compinit
# 
# # edit line in vim with ctrl-e:
# autoload edit-command-line; zle -N edit-command-line
# # bindkey '^e' edit-command-line
