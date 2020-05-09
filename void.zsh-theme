autoload -Uz colors && colors
autoload -Uz vcs_info
setopt prompt_subst

# set up exit_code
typeset -g void_exit_code
precmd_void_exit_code() { if (( $? == 0 )); then void_exit_code="blue"; else void_exit_code="red"; fi }

typeset -g void_git_prompt_
precmd_void_git_prompt() {
    if [[ -n $vcs_info_msg_0_ ]]; then
        if [[ $void_git_prompt != "git" ]]; then
            void_git_prompt="git";
            git-prompt-alias;
        fi
    else
        if [[ $void_git_prompt != "" ]]; then
            void_git_prompt="";
            git-prompt-unalias;
        fi
    fi
}

# handle vcs_info
precmd_vcs_info() { vcs_info  }
precmd_functions+=( precmd_vcs_info precmd_void_exit_code )
source ${${(%):-%x}:A:h}/git-prompt.sh
precmd_functions+=( precmd_void_git_prompt )

export PS1='%{$fg[blue]%}$void_git_prompt%{$fg[$void_exit_code]%} ›%{$reset_color%} '
export RPROMPT='%{$fg[blue]%}$(basename $PWD)$vcs_info_msg_0_%{$reset_color%}'

# show git branch name
zstyle ':vcs_info:*:*' formats ' · %b'
