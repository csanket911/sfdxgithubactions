#!/bin/bash
if [ -z "$1" ]
  then
    echo "No argument supplied"
    exit 1
fi
# checkout your feature branch and rebase from master
git checkout "$1"
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
# rebase from origin/master and resolve any conflicts
env -i git pull --rebase origin master
# switch to the dev branch
git checkout devint
# rebase from origin/devint
# (which could contain merged branches from other team members)
env -i git pull --rebase origin devint
# merge your branch
git merge "$1" -m "Merging $branch"
# push changes to origin/devint (which triggers a deploy)
git push origin devint