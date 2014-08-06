
The Git Workflow

upstream = Class Github Repo
origin = Your Github Repo

      --upstream--
          | |
git pull upstream master 
          | |
     --Computer--  <== subl .==> editor
          | |
      git add -A
 git commit -m "message"
          | |
    --Git Tracker--
          | |
  git push origin master
          | |
       --origin--
          | |
        submit_hw
          | |
      --upstream--

