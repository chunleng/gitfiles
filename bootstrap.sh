#!/usr/bin/env bash

set -eu

GIT_NAME=$1
GIT_EMAIL=$2
APP_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"


git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

# Determine how to resolve divergent branch
git config --global pull.ff only

# Disable pager and display in standard out
git config --global core.pager less

# Using Vim as Difftool
git config --global diff.tool nvim
git config --global difftool.prompt false
git config --global difftool.trustExitCode true
git config --global difftool.nvim.cmd "nvim +'nnoremap q :qall<cr>' -M -d \$LOCAL \$REMOTE"

# Using Vim as Difftool
git config --global merge.tool nvim
git config --global mergetool.nvim.cmd "nvim +Gdiff! \$MERGED"


# Resolve unicode file name difference in Mac (Compared to Windows/Linux)
git config --global core.precomposeunicode true

# Exclude
ln -sfn ${APP_PATH}/gitignore_global ${HOME}/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Use SSH instead of HTTPS for github
git config --global url.git@github.com:.insteadOf https://github.com/

###########
# Aliases #
###########

git config --global alias.a add
git config --global alias.b branch
git config --global alias.c commit
git config --global alias.co checkout
git config --global alias.d diff
git config --global alias.dd 'diff --cached'
git config --global alias.dt 'difftool'
git config --global alias.p push
git config --global alias.pp '!sh -c "git push -u origin $(git branch --show-current)"'
git config --global alias.pu pull
git config --global alias.l 'log --graph --oneline --topo-order --pretty="format:%C(auto)%h %cd %<|(45,trunc)%cn%d %s" --date=short --decorate'
git config --global alias.s status

# Grepping through all past commits
git config --global alias.grepall '!gitgrepall(){ git grep $1 $(git rev-list --all) -- $2; }; gitgrepall'
