
The Git Workflow

upstream = Class Github Repo
origin = Your Github Repo

      --upstream--
          | |
git pull upstream master 
          | |
     --Computer--  <== subl .==> editor   
          | |               # all local changes


      git add -A
 git commit -m "message"   
          | |              #takes changes you've been making permanently. save to git. don't yet need the internet. it all saves to your computer


    --Git Tracker--
          | |
  git push origin master
          | |             # taking whatever local changes you've made and pushes it to the cloud (into our Github personal account)

       --origin--
          | |

        submit_hw
          | |             #takes whatever is in origin and submits it to upstream (GA's github folder)

      --upstream--


      #git works locally on your computer and with cloud computing
      #github is a company that is the most common git repository out there.


      1. git is not obvious
      2. git it not intuitive 
      3. git is very powerful. more so than the tools we have used so far
