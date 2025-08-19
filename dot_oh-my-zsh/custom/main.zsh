# import all autocompletes
for file in $ZSH_CUSTOM/autocompletes/*.zsh(.N); do
  echo "loading $file"
  source "$file"
done

# import all aliases
for file in $ZSH_CUSTOM/aliases/*.zsh(.N); do
  echo "loading $file"
  source "$file"
done

