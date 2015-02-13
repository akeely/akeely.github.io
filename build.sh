#!/bin/bash

# only proceed script when started not by pull request (PR)
if [ $TRAVIS_PULL_REQUEST == "true" ]; then
  echo "this is PR, exiting"
  exit 0
fi

# enable error reporting to the console
set -e

# User specific settings
USERNAME="akeely"
REPO_NAME="$USERNAME.github.io"
MASTER_BRANCH="../$REPO_NAME.master"

# build site with jekyll, by default to `_site' folder
jekyll build

# cleanup
rm -rf "MASTER_BRANCH"

#clone `master' branch of the repository using encrypted GH_TOKEN for authentification
git clone https://${GH_TOKEN}@github.com/$USERNAME/$REPO_NAME.git "$MASTER_BRANCH"

# copy generated HTML site to `master' branch
cp -R _site/* "$MASTER_BRANCH"

# commit and push generated content to `master' branch
# since repository was cloned in write mode with token auth - we can push there
cd "$MASTER_BRANCH"
git config user.email "andrew.keely@gmail.com"
git config user.name "Andrew Keely"
git add -A .
git commit -a -m "Travis #$TRAVIS_BUILD_NUMBER"
git push --quiet origin master > /dev/null 2>&1
