function _peco_change_directory
    if [ (count $argv) ]
        peco --layout=bottom-up --query "$argv " | perl -pe 's/([ ()])/\\\\$1/g' | read foo
    else
        peco --layout=bottom-up | perl -pe 's/([ ()])/\\\\$1/g' | read foo
    end
    if [ $foo ]
        builtin cd $foo
    else
        commandline ''
    end
end

function peco_change_directory
    set -x DOCS $HOME/Documents
    begin
        echo $HOME/.config
        ghq list -p
        ls -ad */ | perl -pe "s#^#$PWD/#" | grep -v \.git # Gets the repositories in the current directory
        ls -ad $HOME/apps/* | grep -v \.git
        ls -ad $DOCS/IB | grep -v \.git
        find $DOCS/Github -maxdepth 2 -type d \( -execdir test -e {}/.ignore \; -prune \) -o \( -execdir test -e {}/"lerna.json" \; -prune -print \) -o \( -execdir test -d {}/.git \; -prune -print \)
    end | sed -e 's/\/$//' | awk '!a[$0]++' | _peco_change_directory $argv
end
