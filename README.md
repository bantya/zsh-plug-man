# zsh-plug-man

This is a simple zsh plugin manager inspired from [chris@machine](https://www.youtube.com/@chrisatmachine)'s [YouTube video](https://www.youtube.com/watch?v=bTLYiNvRIVI).

## Prerequisites:

Run following commands to create a `.zprofile` file in root directory:

```zsh
touch ~/.zprofile

echo "# important directories" >> ~/.zprofile
echo "export CONFIG_HOME=$HOME/.config" >> ~/.zprofile
echo "export CACHE_HOME=$HOME/.cache" >> ~/.zprofile
echo "export DATA_HOME=$HOME/.local/share" >> ~/.zprofile
echo  >> ~/.zprofile
echo  >> ~/.zprofile
echo "# zsh config directory" >> ~/.zprofile
echo "export ZDOTDIR=$CONFIG_HOME/zsh" >> ~/.zprofile

```

Then create `functions/`, `plugins/` and `themes/` directories:

```zsh
mkdir ~/.config/zsh/functions ~/.config/zsh/plugins ~/.config/zsh/themes
```

Optionally to start with clean `aliases.zsh`, `exports.zsh`, `plugins.zsh`:

```zsh
echo > ~/.config/zsh/aliases.zsh
echo > ~/.config/zsh/exports.zsh
echo "zsh_load_theme 'default'" > ~/.config/zsh/plugins.zsh
```
