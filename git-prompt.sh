git-prompt-alias() {
    alias add="git add "
    alias push="git push -u origin "
    alias s="git status"
    alias status="git status"
    alias co="git co "
    alias branch="git checkout -b "
    alias commit="git commit "
    alias d="git diff "
    alias show="git show "
    alias up="git pull"
}

git-prompt-unalias() {
    unalias add push s status co branch commit d show up
}
