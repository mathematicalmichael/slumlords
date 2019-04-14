#!/bin/bash
hugo
git stash
git checkout gh-pages
# hide public 
mv public .public
# so remove ignores it
rm -r *
# unpack hidden public
mv .public/* .
# add all files to git
git add *
# auto-commit them
git commit -am 'new pages auto-build.'
rm -r .public
git push origin gh-pages
git checkout master
git stash pop

