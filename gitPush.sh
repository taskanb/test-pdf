
git checkout
git status
git add .

echo 'Enter the commit message:'
read commitMessage

git commit -m "$commitMessage"


git push origin $branch
