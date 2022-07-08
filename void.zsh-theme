autoload -Uz colors && colors
setopt prompt_subst

typeset -g _LAST_COMMAND_EXIT_CODE

precmd_reset_prompts() {
    PS1='%{$fg[blue]%} ›%{$reset_color%} '
    RPROMPT='%{$fg[blue]%}%{$reset_color%}'
}

precmd_async_exit_code() {
    _LAST_COMMAND_EXIT_CODE=$?

    exec {FD}< <(
        if (( $_LAST_COMMAND_EXIT_CODE == 0 )); then echo "blue"; else echo "red"; fi
    )

    zle -F $FD async_exit_code
}

async_branch() {
    void_branch=$(<&$1)
    [ -n "$void_branch" ] &&
        void_branch=" - $void_branch";

    void_hostname=""
    [[ "$SSH_CLIENT" != "" ]] && void_hostname=" | $(hostname)"

    RPROMPT='%{$fg[blue]%}$(basename $PWD)$void_branch%{$reset_color%}$void_hostname'

    zle reset-prompt

    zle -F $1
    exec {1}<&-
}

precmd_async_branch() {
    exec {FD}< <(
        echo $(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    )

    zle -F $FD async_branch
}

async_exit_code() {
    void_exit_code=$(<&$1)
    PS1='%{$fg[blue]%}%{$fg[$void_exit_code]%} ›%{$reset_color%} '

    zle reset-prompt

    zle -F $1
    exec {1}<&-
}


# Set precmd hooks to reset the prompt and then asynchronuously get
# branch and exit code information.
add-zsh-hook precmd precmd_reset_prompts
# I'm using different hooks for exit_code and branch as they use
# different file descriptors.
add-zsh-hook precmd precmd_async_exit_code
add-zsh-hook precmd precmd_async_branch
