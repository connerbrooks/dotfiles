# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

# begin ohmyzsh hist settings
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Do not record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
# endo ohmyzsh hist settings

setopt autocd
unsetopt beep
bindkey -v
export KEYTIMEOUT=1 # faster vi mode switch
# End of lines configured by zsh-newuser-install

# up/down key history based on input
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "$key[Up]" history-beginning-search-backward-end
bindkey "$key[Down]" history-beginning-search-forward-end

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/cbrooks/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# todo figure out if this is needed
# fpath=(/usr/local/share/zsh-completions $fpath)

# Aliases and directories stuff
# List directory contents
alias ls='ls -G'
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

# my prompt
# todo: my own git integration
setopt prompt_subst

DIR_COLOR='magenta'
CARET_COLOR='cyan'
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{yellow}"

# from oh-my-zsh/themes/agnoster.zsh-theme

prompt_dir() {
  echo -n %F{$DIR_COLOR}'%~ '%f
}

function parse_git_dirty() {
  local STATUS=''
  local -a FLAGS
  FLAGS=('--porcelain')
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
      FLAGS+='--ignore-submodules=dirty'
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi
  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

prompt_git() {
  (( $+commands[git] )) || return
  local PL_BRANCH_CHAR
  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
    PL_BRANCH_CHAR=$'\ue0a0'         # 
  }
  local ref dirty mode repo_path

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    repo_path=$(git rev-parse --git-dir 2>/dev/null)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"

    # todo sort out this dirty stuff
    dirty=$(parse_git_dirty)
    echo -n $dirty
    
    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '✚'
    zstyle ':vcs_info:*' unstagedstr '●'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats ' %u%c'
    vcs_info
    echo -n "${ref/refs\/heads\//$PL_BRANCH_CHAR }${vcs_info_msg_0_%% }${mode} "
  fi
}

prompt_end() {
    echo -n %B%F{$CARET_COLOR}'>' %f%b
}

build_prompt() {
    retval=$?
    prompt_dir
    prompt_git
    prompt_end
}

PROMPT='$(build_prompt)'
