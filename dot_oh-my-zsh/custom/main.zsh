# import all autocompletes
for file in $(ls -1 ./autocompletes/*.zsh); do
    echo "loading $file"
    source $file
done

# import all aliases
for file in $(ls -1 ./aliases/*.zsh); do
    echo "loading $file"
    source $file
done
