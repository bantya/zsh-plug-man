# Creates a zsh function.
# 2025-01-07
function create-function() {
  if [[ -z $1 ]]; then
    echo "Please provide a function name!"
    return 1
  fi

  if [[ -z $EDITOR ]] && EDITOR=nvim

  local NAME=$1
  local FILEPATH="$ZDOTDIR/functions/$NAME.sh" 

  touch $FILEPATH

  echo '# Function description' >> $FILEPATH
  echo "# $(date '+%Y-%m-%d')" >> $FILEPATH
  echo "function $NAME() {" >> $FILEPATH
  echo "  echo 'Hello from $NAME function'" >> $FILEPATH
  echo '}' >> $FILEPATH
  echo >> $FILEPATH

  echo "Created function '$NAME' @ '$FILEPATH'."

  $EDITOR $FILEPATH
}

