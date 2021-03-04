#!/usr/bin/env bash

set -eu

GIT_NAME=$1
GIT_EMAIL=$2


git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

# Determine how to resolve divergent branch
git config --global pull.ff only

# Disable pager and display in standard out
git config --global core.pager 'cat'

# Resolve unicode file name difference in Mac (Compared to Windows/Linux)
git config --global core.precomposeunicode true

###########
# Aliases #
###########

git config --global alias.a add
git config --global alias.b branch
git config --global alias.c commit
git config --global alias.co checkout
git config --global alias.d diff
git config --global alias.dd 'diff --cached'
git config --global alias.p push
git config --global alias.pp '!sh -c "git push -u origin $(git branch --show-current)"'
git config --global alias.pu pull
git config --global alias.l 'log --graph --oneline --topo-order --pretty="format:%C(auto)%h %cd %<|(45,trunc)%cn%d %s" --date=short --decorate'
git config --global alias.s status

# Grepping through all past commits
git config --global alias.grepall '!gitgrepall(){ git grep $1 $(git rev-list --all) -- $2; }; gitgrepall'
