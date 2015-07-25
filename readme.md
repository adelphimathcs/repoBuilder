#repo builder

This app is meant to be an automation of creating github repos from your local command line.



#How to use
After cloning the repo cd into the directory and run the script. It takes in 3 command line args for simplicity as of right now. Also be sure to get your own client_id and client_secret by registering the app under your github account(Mine are kept private for security reasons). After you get your id/secret put them in a file called 'keys.txt' with ID on line 1 and Secret on line 2. 

#Examples of running the script 
ruby repo.rb <repo name> <login> <pw> 
ruby repo.rb myRepo myuser mypassword

will create the repo 'myRepo' for the account given and initialize it with a defualt readme.


#TODO
1. Get OAuth to work properly
2. Get file updates to work - specifically update the default readme





