HISTFILE="$DATA_HOME/zsh/history"
HISTSIZE=1000000
SAVEHIST=1000000


HISTTIMEFORMAT="%Y-%m-%d %T "
HISTIGNORE='ls:bg:fg:history*'
HISTCONTROL=ignoreboth # ignoreboth: Ignored ignoredups and starting whitespace


#
# Tools - 28-09-2021
# ----------------------


# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#
# Applications - 28-09-2021
# ----------------------
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# bun completions
export BUN_DIR="$HOME/.bun"
# [ -s "$BUN_DIR/_bun" ] && source "$BUN_DIR/_bun"
export PATH="$BUN_DIR/bin:$PATH"

# export PATH="/usr/local/opt/php@8.0/sbin:$PATH"
# export PATH="/usr/local/opt/php@8.0/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH" # 28-12-2021
export PATH="$HOME/bin:$PATH" # 04-01-2022

export PATH="/usr/local/sbin:$PATH" # 03-06-2022
export PATH="/usr/local/bin:$PATH" # 03-06-2022

export WARP_THEMES_DIR="$HOME/.warp/themes" # 07-03-2024


#
# Flags - 22.12.2024
# ----------------------
export BAT_THEME="gruvbox-dark" # 22.12.2024
export HOMEBREW_NO_AUTO_UPDATE=1 # 22.12.2024

# Remove duplicate entries from the PATH - 28-12-2021
# clean-path
