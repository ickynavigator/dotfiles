#!/usr/bin/env fish

# store from Brewfile
if test -e "Brewfile"
    echo "Installing brews and casks ...";
    mv Brewfile Brewfile.swp;
end

brew bundle dump --describe
