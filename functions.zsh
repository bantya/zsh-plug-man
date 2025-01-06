# EDITOR=code

# fpath+=($ZDOTDIR/functions)
#
# for func in $ZDOTDIR/functions/*(.N:t); do
#   autoload -Uz $func
# done
#
# for func in $ZDOTDIR/functions/*; do
#   zcompile $func
# done

for func in $ZDOTDIR/functions/*; do
  zsh_add_file "functions/$(basename $func)"
done

# zsh_add_file "functions/all-functions.sh"

# # dump the functions in a single file
# # 04.01.2025
# function dump-functions() {
#   for file in $(ls $ZDOTDIR/functions/*.sh); do
#     local FUNCTIONS_FILE="$ZDOTDIR/functions/all-functions.sh"
#     echo "# --" >> $FUNCTIONS_FILE && echo >> $FUNCTIONS_FILE && cat $file >> $FUNCTIONS_FILE && echo >> $FUNCTIONS_FILE
#   done
# }
