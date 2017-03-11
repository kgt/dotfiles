## Autoloads

autoload -U add-zsh-hook

## Changing directory

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

## History

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks

## Completion

autoload -U compinit; compinit

if [[ -x dircolors ]]; then
  eval "`dircolors -b`"
fi

if [[ -n $LS_COLORS ]]; then
  zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"  
fi

setopt correct

## Prompt

autoload -U colors; colors
autoload -U vcs_info

setopt prompt_subst

zstyle ":vcs_info:*" formats "%%F{2}(%s:%b)%%f "
zstyle ":vcs_info:*" actionformats "%%F{2}(%s:%b|%a)%%f "

add-zsh-hook precmd vcs_info

if [[ -z "${SSH_CONNECTION}" ]]; then
  PROMPT="%B%F{4}%n@%m%#%b%f "
  PROMPT2="%B%F{4}>%b%f "
  RPROMPT="\${vcs_info_msg_0_}%B%F{4}[%~]%b%f"
  RPROMPT2="%B%F{4}(%_)%b%f"
else
  PROMPT="%B%F{2}%n@%m%#%b%f "
  PROMPT2="%B%F{2}>%b%f "
  RPROMPT="\${vcs_info_msg_0_}%B%F{2}[%~]%b%f"
  RPROMPT2="%B%F{2}(%_)%b%f"
fi

## Title

case "${TERM}" in
xterm*)
  function _precmd_set_title() {
    echo -ne "\e]0;${USER}@${HOST%%.*}:${PWD/${HOME}/~}\a"
  }
  function _preexec_set_title() {
    echo -ne "\e]0;${USER}@${HOST%%.*}:${1}\a"
  }

  add-zsh-hook precmd _precmd_set_title
  add-zsh-hook preexec _preexec_set_title
  ;;
esac

## Aliases

case "${OSTYPE}" in
linux*)
  alias ls="ls -F --color=auto"
  ;;
darwin*)
  alias ls="ls -FG"
  ;;
esac
alias la="ls -a"
alias ll="ls -al"
alias less="less -R"
alias grep="grep -E --color=auto"

alias emacs="emacs -nw"

alias -g C="| cat -n"
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g G="| grep"
alias -g W="| wc"
alias -g X="| xargs"
