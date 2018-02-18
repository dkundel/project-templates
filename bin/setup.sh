#! /bin/bash

PROJECT_NAME=$1

if [ $# == 2 ]; then
  TEMPLATE_BRANCH=$2
else
  TEMPLATE_BRANCH=master
fi

echo 'values' $PROJECT_NAME $TEMPLATE_BRANCH

git clone git@github.com:dkundel/project-templates.git -b $TEMPLATE_BRANCH $PROJECT_NAME
cd $TEMPLATE_BRANCH
rm -rf .git
git init

sed -i "s/GITHUBPROJECT/$PROJECT_NAME/g" package.json .all-contributorsrc README.md

rm -rf bin/
npm install
