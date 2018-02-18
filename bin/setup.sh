#! /bin/bash

PROJECT_NAME=$1

if [ $# == 2 ]; then
  TEMPLATE_BRANCH=$2
else
  TEMPLATE_BRANCH=master
fi

echo 'Cloning project...'
git clone git@github.com:dkundel/project-templates.git -b $TEMPLATE_BRANCH $PROJECT_NAME > /dev/null
echo 'Clean up project...'
cd $PROJECT_NAME > /dev/null
rm -rf .git > /dev/null
rm -rf bin/ > /dev/null
git init > /dev/null

echo 'Setup project ...'
sed -i "" "s/GITHUBPROJECT/$PROJECT_NAME/g" package.json .all-contributorsrc README.md > /dev/null

echo 'Installing dependencies...'
npm install > /dev/null
