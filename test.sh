#!/bin/bash

# rebase from origin/master and resolve any conflicts
env -i git pull --rebase origin master
# switch to the dev branch
git checkout devint
# rebase from origin/dev
# (which could contain merged branches from other team members)
git pull --rebase origin devint
# merge your branch
git merge test
# push changes to origin/dev (which triggers a deploy)
git push origin devint