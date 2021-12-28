alias pip=pip3
# alias phpmamp=/Applications/MAMP/bin/php/php7.4.12/bin/php
# fish_add_path /Applications/MAMP/bin/php/php7.4.12/bin
fish_add_path ~/Library/Python/3.8/bin
fish_add_path /usr/libexec/java_home -v 1.8

## abbr
# exa
if type -q exa
	abbr ll   "exa -l -g -h --icons"
	abbr lla  "exa -l -g -h --icons -a"
	abbr llt  "exa -l -g -h --icons -a --tree --level=2 --ignore-glob="node_modules""
	abbr lltg "exa -l -g -h --icons -a --tree --level=2 --git --git-ignore"
end

# git
if type -q git
	abbr g 	 "git"
	abbr gs  "git status"
	abbr ga  "git add"
	abbr gaa "git add --all"
	abbr gbd 'git branch --merged | egrep -v "(^\*|main|dev)" | xargs git branch -d'
	abbr gc  "git commit --allow-empty"
	abbr gco "git checkout"
	abbr gp  "git push -u origin --all"
	abbr gpa "git remote | xargs -L1 git push --all"
	abbr gpl "git pull"
	abbr gcl "git clone"
	abbr gf  "git fetch"
	abbr gr  "git remote"
	abbr gb  "git branch"
	abbr gd  "git diff"
	abbr gl  "git log"
	abbr gz  "git archive --format zip --output ~/Desktop/zipped.zip master"
end

# copy current path to system clipboard
alias cwd "pwd | eval $CLIPBOARD"

# Cowsay with random fortune 
# alias cf cow_fortune

# add typescript to a project
alias yat "yarn add typescript @types/node @types/react @types/react-dom @types/jest"
alias nit "npm install --save typescript @types/node @types/react @types/react-dom @types/jest"

#starship init fish | source
