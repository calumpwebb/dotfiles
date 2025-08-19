# import all autocompletes
for file in $ZSH_CUSTOM/autocompletes/*.zsh(.N); do
  source "$file"
done

# import all aliases
for file in $ZSH_CUSTOM/aliases/*.zsh(.N); do
  source "$file"
done

# wrap brew so that it auto updates the $HOME/Brewfile
# when we install new packages

export HOMEBREW_BUNDLE_FILE_GLOBAL="$HOME/.Brewfile"

brew() {
  if [[ "$1" == "install" ]]; then
    # run the real brew first
    command brew "$@"
    # then update your Brewfile with the new package
command brew bundle dump --file="$HOMEBREW_BUNDLE_FILE_GLOBAL" --force --describe --all
    echo "Updated Brewfile=$BREWFILE"
  else
    command brew "$@"
  fi
}

