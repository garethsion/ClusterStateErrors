Safely merging your changes into master
=======================================
The main thing is don't ever try to push directly to master! Cut a new branch from master, make your changes and then merge back in when you're finished.

Starting from the master branch...

  `git pull`
  
(gets latest master code from the repository)

  `git checkout -b <your new branch name goes here>`

(This creates a new branch with the chosen name, and switches you to that branch)

Do some local work and commit.

  `git push -u origin <your branch name>`
  
(this (a) creates a new branch on github, (b) links it to the branch you are working on locally,
(c) pushes all your commits to the branch on github.)

Now you can keep working on your local branch. You can keep committing and pushing, but for future pushes just use:

  `git push`
  
( the -u flag links your local branch to the upstream (online) branch. You only use it the first you push after making a new branch.)

When you've completed a chunk of work and want to merge it into the master, the safest way is to do it is on github, as you can see everything that's being added/deleted.

1. Go to the main github page for the project, start a new 'Pull request'.
2. Select base:master, compare:*your branch name*.
3. Check your changes then 'Create pull request'.
4. Comment if you like, then 'Create pull request' again.
5. If there are no conflicts you can 'Merge pull request'.
6. 'Confirm' and the branch is now merged into master, so everyone else can use your code.

Now you could keep working on the same branch, commit, push, and create new pull requests. But bear in mind if you do that you won't have the latest code that other people have added to master. You could merge the latest code into your current branch, but I think a cleaner way to do it is to switch back to the master, pull down the latest code and cut a new branch:

  `git checkout master`
  
  `git pull`
  
  `git checkout -b <fun new branch name>`
  
  `git push -u origin <fun new branch name>`
  

Then carry on working.

(If you do want to just stay in your current branch, but merge in the latest code from the (online) master repository, then I think this should work:

  `git merge origin/master`
)

