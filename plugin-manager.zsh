# function to source a file if it exists
function zsh_add_file() {
  local FILE_NAME=$1

  [[ -f "$ZDOTDIR/$FILE_NAME" ]] && source "$ZDOTDIR/$FILE_NAME"
}

# function to add a plugin (github repo) if it does not exists
function zsh_add_plugin() {
  local REPOSITORY=$1
  local PLUGIN_NAME=$(echo $REPOSITORY | cut -d '/' -f 2)

  if [[ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]]; then
    zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
    zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
  else
    _clone_repo $REPOSITORY "plugins/"
  fi
}

# function to add completions
function zsh_add_completion() {
  local REPOSITORY=$1
  local PLUGIN_NAME=$(echo $REPOSITORY | cut -d '/' -f 2)

  if [[ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]]; then
    completion_file_path=$(ls $ZDOTDIR/plugins/$PLUGIN_NAME/_*)
    fpath+="$(dirname $completion_file_path)"
    zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
  else
    _clone_repo $REPOSITORY "plugins/"
    
    fpath+=$(ls $ZDOTDIR/plugins/$PLUGIN_NAME/_*)
    rm $ZDOTDIR/.zccompdump
  fi

  local completion_file="$(basename $completion_file_path)"

  if [[ $2 == true ]] && compinit "${completion_file:1}"
}

# function to install zsh themes
function zsh_add_theme() {
  local INPUT=$1

  if [[ -z "$INPUT" ]]; then
    echo "Usage: zsh_add_theme <github repo name / the file url>"
    return 1
  fi

  # add theme by github username/repo
  if [[ $INPUT == */* && ! $INPUT == http* ]]; then
    local REPOSITORY=$INPUT
    local THEME_NAME=$(echo $REPOSITORY | cut -d '/' -f 2)

    if [[ ! -d "$ZDOTDIR/themes/$THEME_NAME" ]]; then
      _clone_repo $REPOSITORY "themes/"
    fi

  # add a oh-my-zsh theme
  elif [[ ! $INPUT == */* && ! $INPUT == http* ]]; then
    local THEME_NAME=$INPUT  
    local INPUT="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/themes/$THEME_NAME.zsh-theme"

    if [[ ! -f "$ZDOTDIR/themes/$THEME_NAME.zsh-theme" ]]; then
      _download_file $INPUT
    fi

  # add a standalone theme by a url
  elif [[ $INPUT == http* ]]; then
    local THEME_NAME=$(basename $INPUT | sed 's/.zsh-theme//')

    if [[ ! -f "$ZDOTDIR/themes/$THEME_NAME.zsh-theme" ]]; then
      _download_file $INPUT
    fi
  fi
}

# load a theme
function zsh_load_theme() {
  local THEME_NAME=$1
  
  if [[ -z $THEME_NAME ]]; then
    echo "Usage: zsh_load_theme <theme name>"
    return 1
  fi

  local THEME_FILE="$THEME_NAME.zsh-theme"

  if [[ -f "$ZDOTDIR/themes/$THEME_FILE" ]]; then
    zsh_add_file "themes/$THEME_FILE"
  else
    local THEMES=($ZDOTDIR/themes/*/$THEME_FILE)

    if (( ${#THEMES[@]} > 0 )); then
      local DIR=$(basename $(dirname ${THEMES[@]}))
      zsh_add_file "themes/$DIR/$THEME_FILE"
    else
      zsh_add_file "themes/default.zsh-theme"
    fi
  fi

  # if [[ -f "$ZDOTDIR/themes/$THEME_FILE" ]]; then
  #   zsh_add_file "themes/$THEME_FILE"
  # elif [[ -f "$ZDOTDIR/themes/$THEME_NAME/$THEME_NAME.zsh-theme" ]]; then
  #   echo "THTHTHT"
  # else
  #   zsh_add_file "themes/default.zsh-theme"
  # fi
}

# helper function to clone a github repo
function _clone_repo() {
  local REPOSITORY=$1
  local DIRECTORY=$2
  local NAME=$(echo $REPOSITORY | cut -d '/' -f 2)
 
  echo "Cloning '$NAME' ${DIRECTORY%s/}.."

  if git clone "https://github.com/$REPOSITORY.git" "$ZDOTDIR/$DIRECTORY/$NAME" > /dev/null 2>&1; then
    echo -e "\e[1A\e[K✅ ${(C)DIRECTORY%s/} '$NAME' cloned successfully!"
  else
    echo -e "\e[1A\e[K❌ Failed to clone '$NAME' ${DIRECTORY%s/}!"
  fi
}

function _download_file() {
  local URL=$1
  local THEME_NAME=$(basename $URL | sed 's/.zsh-theme//')
  local THEME_PATH="$ZDOTDIR/themes/$THEME_NAME.zsh-theme"

  echo "Downloading '$THEME_NAME' theme.."

  # HTTP_STATUS=$(curl -Lo "$NAME" -w "%{http_code}" -sf "$URL") 
  # if [[ $HTTP_STATUS -eq 200 ]]; then

  if curl -Lo "$THEME_PATH" -sf "$URL" > /dev/null 2>&1; then
    echo -e "\e[1A\e[K✅ Theme '$THEME_NAME' downloaded successfully!"
  else
    echo -e "\e[1A\e[K❌ Failed to download '$THEME_NAME' theme!"
  fi 
}
