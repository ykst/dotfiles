# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=40000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/yukishita/.zshrc'

autoload -Uz compinit; compinit

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
# End of lines added by compinstall
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/local/bin"

find-grep () { find . -type f -print | xargs grep -n --binary-files=without-match $@ }

find-tab () { find-grep $'\t' | awk 'BEGIN{FS=":"}!/\.git/{print $1}' | uniq }

alias ll='ls --color=auto'
alias ll='ls -lter'
alias jobs='jobs -l'

#PROMPT='%~# '
ip=`LANG=C /sbin/ifconfig | grep 'inet ' | awk '!/127\.0\.0\.1/{print $2}' | head -1`
autoload colors
colors

#function prompt-git-current-branch {
#    local name st color gitdir action
#
#    st=`git branch 2> /dev/null | grep "^\* " | sed -e "s/\* \(.\+\)/\1/g"`
#
#    if [[ -n $st ]] then
#        color=%F{yellow}
#        echo "%F{yellow}@$st"
#    fi
#    return
#}

PROMPT="%n%{${fg[white]}%}[%~]%# "
#setopt prompt_subst
#RPROMPT="`prompt-git-current-branch`"

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="[$ip]%1(v|%F{green}%1v%f|)"

setopt extended_history

LISTMAX=0
autoload -Uz compinit; compinit

setopt no_beep
setopt auto_param_keys
setopt auto_menu
setopt auto_list
setopt auto_pushd
setopt append_history
setopt list_packed
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_ignore_dups


setopt magic_equal_subst
setopt mark_dirs
setopt share_history
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
setopt auto_cd
setopt no_list_types
setopt auto_param_slash
fignore=(CVS .svn .git)

setopt checkjobs
setopt check_jobs

setopt pushd_ignore_dups
setopt correct


__git_files() {
    _wanted files expl 'local files' _files
}
#
# Show branch name in Zsh's right prompt
#

#autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
#
#setopt prompt_subst
#setopt re_match_pcre
#
#function rprompt-git-current-branch {
#    local name st color gitdir action
#    if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
#        return
#    fi
#    name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
#    if [[ -z $name ]]; then
#        return
#    fi
#
#    gitdir=`git rev-parse --git-dir 2> /dev/null`
#    action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"
#
#    st=`git status 2> /dev/null`
#    if [[ "$st" =~ "(?m)^nothing to" ]]; then
#        color=%F{green}
#    elif [[ "$st" =~ "(?m)^nothing added" ]]; then
#        color=%F{yellow}
#    elif [[ "$st" =~ "(?m)^# Untracked" ]]; then
#        color=%B%F{red}
#    else
#        color=%F{red}
#    fi
#
#
#    echo "$color$name$action%f%b "
#}
#
#RPROMPT='[`rprompt-git-current-branch`%~]'
