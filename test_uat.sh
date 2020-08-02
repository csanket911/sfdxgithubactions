#!/bin/bash

# checkout your feature branch and rebase from master
git checkout test
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
# rebase from origin/master and resolve any conflicts
env -i git pull --rebase origin master
# switch to the dev branch
git checkout uat
# rebase from origin/uat
# (which could contain merged branches from other team members)
env -i git pull --rebase origin uat
# merge your branch
git merge test -m "Merging $branch"
# push changes to origin/devint (which triggers a deploy)
git push origin uat