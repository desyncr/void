git-prompt-alias() {
    alias add="git add "
    alias push="git push -u origin "
    alias s="git status"
    alias status="git status"
    alias c="git commit "
    alias commit="git commit "
}

git-prompt-unalias() {
    unalias add push s status c commit
}
