# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'


# update zsh-plugins
alias zsh-update-plugins="find \"$ZDOTDIR/plugins\" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"


#
# General
# ----------------------
alias cls='clear'
alias treee="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"


#
# Suffixes
# ----------------------
# alias -s php="subl" # 19-06-2032


#
# Shortcuts
# ----------------------
alias c="code ."
alias s="subl ."
alias o="open ." # 28-12-2021
alias a="open -a" # 02-01-2022

# Open Finder at current location
alias f="open -a Finder ./" # 02-01-2022


#
# Dot files
# ----------------------
alias s.al="subl ~/.zsh_aliases"
alias s.fn="subl ~/.zsh_functions" # 20-10-2021
alias s.xp="subl ~/.zsh_exports"
alias s.zs="subl ~/.zshrc" # 06-10-2021
alias s.gc="subl ~/.gitconfig" # 13-01-2022
alias c.al="code ~/.zsh_aliases" # 04-06-2022
alias c.fn="code ~/.zsh_functions" # 04-06-2022
alias c.xp="code ~/.zsh_exports" # 04-06-2022
alias c.zs="code ~/.zshrc" # 04-06-2022
alias c.gc="code ~/.gitconfig" # 04-06-2022
alias .zs=". ~/.zshrc" # 06-10-2021
alias .zscl="clear; . ~/.zshrc" # 01-01-2022
alias v.host="sudo vim /etc/hosts" # 28-12-2021


#
# Git - 06-10-2021
# ----------------------
alias gs="git status -s"
alias glo="git log --graph --pretty=format:'%C(red bold)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gb="git branch"
alias gbv="git branch -v"
alias gch="git checkout" # 13-10-2021
alias gchm="git checkout master" # 14-10-2021
alias restore="git restore" # 25-10-2021
alias nah="git reset --hard && git clean-df" # 28-12-2021
# Remove all traces of git from a folder
alias degit="find . -name '.git' -exec rm -rf {} \;"
# add and remove new/deleted files from git index automatically
alias gitar="git ls-files -d -m -o -z --exclude-standard | xargs -0 git update-index --add --remove"


#
# NPM
# ----------------------
alias ni="npm i" # 01-01-2022
alias nig="npm i -g" # 01-01-2022
alias nrd='npm run dev' # 22-10-2021
alias nrb='npm run build' # 22-10-2021


#
# Workflows - 23-12-2021
# ----------------------
alias event="/usr/bin/automator ~/Documents/Workflows/CreateEvent.workflow" # 23-12-2021

# https://github.com/mathiasbynens/dotfiles/blob/main/.aliases
alias reload="exec $SHELL -l"
alias week='date +%V'
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
# Flush Directory Service cache
alias flush-dns="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias brew-update='brew update && brew upgrade && brew upgrade --cask && brew cleanup' # 30-04-2023
# alias all-update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'


# Intuitive git branch selector
alias g-b="git-branch" # 13-01-2022


# Flush the DNS records
alias flush="dscacheutil -flushcache" # 02-01-2022


#
# Set via cmd
# ----------------------
alias gtcode="cd ~/code" # 27-12-2021
alias gtwww="cd ~/www" # 27-12-2021
alias server="php -S localhost:8080" # 28-12-2021
alias cda="composer dump-autoload" # 28-12-2021
alias l.="ls -d .*" # 31-12-2021
alias bc="bc -l" # 31-12-2021
alias newdir="mkdir -pv" # 31-12-2021
alias now="date +%T%p" # 31-12-2021
alias nowdate="date +"%d-%m-%Y"" # 31-12-2021
alias ls="ls -F" # 31-12-2021
alias ll="ls -lh" # 31-12-2021
alias hg="history | grep" # 31-12-2021
alias path='echo $PATH | tr ":" "\n" | sort -n' # 01-01-2022
# alias path='echo -e ${PATH//:/\\n}'
alias cpwd='pwd | tr -d "\n" | pbcopy' # 01-01-2022
alias gmine="git status|grep -e '^U'|sed -e 's/^UU *//'|xargs git checkout --ours" # 01-01-2022
alias gtheirs="git status|grep -e '^U'|sed -e 's/^UU *//'|xargs git checkout --theirs" # 01-01-2022
alias sal="set-alias" # 01-01-2022
alias gal="get-alias" # 01-01-2022
alias kb="subl ~/Library/KeyBindings/DefaultKeyBinding.dict" # 02-01-2022
alias chup="osascript -e 'set volume output muted true'" # 02-01-2022
alias bol="osascript -e 'set volume output muted false'" # 02-01-2022
alias copy="pbcopy" # 02-01-2022
alias cp='rsync -ah — info=progress2' # 02-01-2022
alias ytdl="youtube-dl -o '~/Downloads/ytdl/%(uploader)s/%(title)s.%(ext)s'" # 04-01-2022
alias ytdl-pl="youtube-dl -o '~/Downloads/ytdl/%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'" # 04-01-2022
alias ytdlp="yt-dlp -o '~/Downloads/ytdl/%(uploader)s/%(title)s.%(ext)s' -S res,ext:mp4:m4a --recode mp4" # 08-01-2022
alias ytdlp-pl="yt-dlp -o '~/Downloads/ytdl/%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' -S res,ext:mp4:m4a --recode mp4" # 08-01-2022
alias sl="exa" # 27-02-2022
alias mariadb-stop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist' #04-06-2022
alias mariadb-start='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist' #04-06-2022
alias artisan="php artisan" # 04-06-2022
alias ytdlp-dir="open ~/Downloads/ytdl" # 19-06-2022
alias python="python3" # 25-08-2022
alias live="live-server" # 26-02-2023
alias pip="python -m pip" # 11-11-2023
alias fman="compgen -c | fzf | xargs man" # 03-03-2024
alias n="nvim" # 17-03-2024
alias phps="/Applications/PhpStorm.app/Contents/MacOS/phpstorm" # 02-12-2024
