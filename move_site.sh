#!/bin/bash
hugo
git stash
git checkout gh-pages
# pull remote changes to avoid conflicts
git pull
# hide public 
mv public .public
mv CNAME .CNAME
# remove ignores hidden files
rm -r *
# unpack hidden public
mv .public/* .
# add all files to git
git add *
# auto-commit them
git commit -am 'new pages auto-build.'
rm -r .public
mv .CNAME CNAME
git push origin gh-pages
git checkout master
git stash pop
echo "Website pushed live."

