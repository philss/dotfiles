# Put those functions on your ~/.zshrc or something similar.
# You can also source this file under your .zshrc

# Cleans all merged branches (relative to the branch you are). Recommended to run from master.
function git_clean_branches()
{
  # Fetch all merged branches that are not the master branch, and not the current branch
  echo 'Deleting all merged branches...'
  for branch in `git branch --merged | awk -F ' * ' '{print $2}' | grep -v -e 'master' | grep -v -e '*'`
  do
    echo "Removing .. $branch"
    git branch -d $branch
  done
  echo 'Done!'
}

# List files that contains a given term
function git_grep_files()
{
  git grep $1 | awk -F ':' '{print $1}' | sort | uniq
}

# Replace terms inside files under the same repository.
# Usage git_replace "old_term" "new_term"
function git_replace()
{
  original=$1;
  new_version=$2;

  echo "$original -> $new_version"
  echo

  for file in `git_grep_files $original`; do
    echo "Replacing in $file"

    sed -i '' "s/$1/$2/g" $file;
  done;

  echo;
  echo "Done";
}
