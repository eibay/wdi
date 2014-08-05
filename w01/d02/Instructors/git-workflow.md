
The Git Workflow

upstream = Class Github Repo
origin = Your Github Repo

      --upstream--                        //server(repository) where files are found
          | |
git pull upstream master                  //pull is sub command of git, means to download said file, upstream is the server (repository)
          | |
     --Computer--  <== subl .==> editor   //edits/saves the file on local machine
          | |
      git add -A                          //saves changes to file to git folder on local machine // -A means all // should be done in repository
 git commit -m "message"                  //adds message
          | |
    --Git Tracker--                       
          | |
  git push origin master                  //sends changes to files to my git server(repository) called origin
          | |
       --origin--                         //my personal repository
          | |
        submit_hw                         //sends homework to upstream (GA's repository)
          | |
      --upstream--

