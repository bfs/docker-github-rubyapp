#!/bin/bash

echo "$GITHUB_SSH_KEY" > ~/.ssh/github_key && chmod 600 ~/.ssh/github_key

GIT_BRANCH=${GIT_BRANCH:-"master"}


cd /var/www/



if [ -z "$GIT_PATH" ]
  then
    git clone $GITHUB_REPO .
  else
    git clone -n $GITHUB_REPO .
    git config core.sparseCheckout true
    echo "$GIT_PATH" >> .git/info/sparse-checkout
    git checkout $GIT_BRANCH
    mv /var/www/$GIT_PATH/* /var/www/
fi


bundle install

chown -R www-data /var/www