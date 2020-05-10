git-prompt-alias() {
    alias add="git add" \
        push="git push -u origin" \
        s="git status" \
        status="git status" \
        co="git checkout" \
        branch="git checkout -b" \
        commit="git commit" \
        com="git commit" \
        d="git diff" \
        show="git show" \
        up="git pull" \
        pull="git pull" \
        reflog="git reflog" \
        stash="git stash"
        remote="git remote"
}

git-prompt-unalias() {
    unalias add push s status co \
        branch commit com d show up pull \
        reflog stash remote
}
