#!/bin/bash

echo "$GITHUB_SSH_KEY" > ~/.ssh/github_key && chmod 600 ~/.ssh/github_key

GIT_BRANCH=${GIT_BRANCH:-"master"}


cd /home/app/webapp



if [ -z "$GIT_PATH" ]
  then
    git clone $GITHUB_REPO --branch $GIT_BRANCH --single-branch .
  else
    git clone -n $GITHUB_REPO --branch $GIT_BRANCH --single-branch .
    git config core.sparseCheckout true
    echo "$GIT_PATH" >> .git/info/sparse-checkout
    git checkout $GIT_BRANCH
    mv /home/app/webapp/$GIT_PATH/* /home/app/webapp
fi


ruby -e 'ENV.map{|e| puts "env #{e.first};"}' > /etc/nginx/main.d/rb_env.conf

bundle install

chown -R app /home/app/webapp