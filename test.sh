#!/bin/bash

# checkout your feature branch and rebase from master
git checkout test
# rebase from origin/master and resolve any conflicts
env -i git pull --rebase origin master
# switch to the dev branch
git checkout devint
# rebase from origin/devint
# (which could contain merged branches from other team members)
env -i git pull --rebase origin devint
# merge your branch
git merge test
# push changes to origin/devint (which triggers a deploy)
git push origin devint