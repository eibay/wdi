#Digital Ocean Deployment

1. Sign up for an account.
2. Once logged in to your account, go to Billing and add the promo code ```ALLSSD10```
3. Go to SSH keys
  - in terminal on your mac do `cat ~/.ssh/id_rsa.pub | pbcopy`
  - now create an ssh key for digital ocean and just do a paste in the main text box for the ssh key
4. Hit the big green Create button
  * Under images select the application tab
  * Choose Ruby on Rails
  * Select your ssh key that you made before
5. Copy the ip address of your droplet near the middle-top of the page (e.g 104.131.105.249) and visit this address in your browser.
  * You should see a bare bones rails page
6. On your mac's terminal do "ssh root@104.131.105.249" substituting for your ip address
7. Install postgres
  * ```sudo apt-get update```
  * ```sudo apt-get install postgresql postgresql-contrib```
8. Lets create a postgres user
  * ```sudo -i -u postgres```
  * ```createuser --interactive```
  * type ```root```
  * hit ```yes``` after the next prompt
8. ```createdb root```
9. ```psql``` 
  * paste in your all SQL statement to set up your database and tables and then
  * ```\q```
10. type ```exit``` to get back to the user ```root```
10. ```apt-get install git```
11. ```cd /home```
12. ```git clone [your git repo]```
  * cd into your repo
  * bundle
13. modify ```connection.rb```, replacing localhost with ```""```, and username with ```root```
14. ```ruby seed.rb```
15. ```service unicorn stop``` and ```service nginx stop```
16. ```rackup config.ru``` and go to ```[ip-of-server]:4567``` in the browser!
