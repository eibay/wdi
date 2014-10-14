#Digital Ocean Deployment

1. Sign up for an account.
2. Once logged in to your account, go to Billing and add the promo code ```ALLSSD10```
3. Go to SSH keys
  - in terminal on your mac do `cat ~/.ssh/id_rsa.pub | pbcopy`
  - now create an ssh key for digital ocean and just do a paste in the main text box for the ssh key
4. Hit the big green Create button
  * Choose Ubuntu
  * Choose Rails
  * Select your ssh key that you made before
5. Copy the ip address of your droplet near the middle-top of the page (e.g 104.131.105.249) and visit this address in your browser.
  * You should see a bare bones rails page
5. Hit the big blue "Console Access" button at the top right
  * type "root", this is the username
  * your password was emailed to you
  * once logged in you will be asked to reset your password
  * we will be using your macs terminal for the rest of this guide but you could always use this web interface in the future if you are on another computer
6. On your mac's terminal do "ssh root@104.131.105.249" substituting for your ip address
7. Install postgres
  * ```sudo apt-get update```
  * ```sudo apt-get install postgresql postgresql-contrib```
8. ```createdb root```
9. ```psql``` followed by your all SQL statement to set up your database and tables
10. ```sudo apt-get install git```
11. ```cd /home```
12. ```git clone [your git repo]```
  * cd into your repo
  * bundle
13. modify ```connection.rb```, replacing localhost with ```""```, and username with ```root```
14. ```ruby seed.rb```
15. ```service unicorn stop``` and ```service nginx stop```
16. ```rackup config.ru``` and go to ```[ip-of-server]:4567``` in the browser!
