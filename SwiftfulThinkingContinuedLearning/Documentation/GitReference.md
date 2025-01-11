# GitReference

This is the the current terminology for git being used in this project.  

## Overview - Git Terminology

This doc has 2 main sections, providing guidance for "Git Actions" and 
"Commit Messages".  As improvemnts are made to the processes, the details
should be updated to provide a clear guide to what the intended use or
functionality is supposed to be. 
 
 ### GIT ACTIONS ---------------------------------------------------------------
 
 Clone = Copying the repo locally.
 Commit = Save ("checkpoint") on our current branch.
 Stage = Prepare changes for a commit.
 Stash = Save Changes for later.
 Push = Send local commits to remote repo
 Pull = Fetch remote commits to local repo
 Branch = Create a new copy from a specified repo
 Merge = Move Branch changes into another Branch
 Rebase = Move one Branch on top of another Branch
 Cherry Picking = Duplicating (copying) one commit from one branch to another
 Pull Request = A Request to merge one branch into another branch.  This would 
    be on a team, where someone would review the code before merging it into 
    a branch.  
 PR Merge = (Pull Request - Merge) Merge all commits
 PR Squash and Merge = (Pull Request - Squash and Merge) 
    Squash all commits into ONE and then merge ONE commit
    
 ### Also Covered --------------------------------------------------------------
 Protecting Branches 
 CODEOWNERS
 GitIgnore
 ReadMe
 Releases, Tags, Versioning
 
 ### COMMIT MESSAGES -----------------------------------------------------------
 
 NEW FEATURE:
 [Feature] Description of the feature

 BUT NOT IN PRODUCTION:
 [Bug] Description of the bug

 RELEASE:
 [Release] Description of release

 BUG IN PRODUCTION:
 [Patch] Description of the patch
 
 MUNDANE TASK:
 [Clean] Description of changes
 
 DOCUMENTATION: 
 [Docs] Description of documentation.  
 
 CHORE: 
 [Chore] Description of chore. 
 
 STYLING: 
 [Style] Description of styling. 
 
 REFACTOR: 
 [Refactor] Desription of refactoring.

### GitFlow --------------------------------------------------------------------
This comes from [Atlassian.com](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)

The overall flow of Gitflow is: 
1. A "develop" branch is created from "main"
2. A "release" branch is created from "develop"
3. "Feature" branches are creted from "develop"
4. When a "feature" is complete it is merged into the "develop" branch
5. When the "release" branch is done it is merged into "develop" and "main"
6. If an issue in "main" is detected a "hotfix" branch is created from "main"
7. Once the "hotfix" is complete it is merged to both "develop" and "main"
