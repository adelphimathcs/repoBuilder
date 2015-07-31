#repo builder

This app is meant to be an automation of creating github repos from your local command line.
The library being used is called [Github_api](https://github.com/peter-murach/github) the documentation is extensive but not 100% accurate(as it seems).


#How to use(on a *nix system)

First make sure you have ruby installed(1.9.3+). If you are running a debian based OS you should be able to just run sudo apt-get install ruby. If you are on windows go to this link and set up the installer [ruby](http://rubyinstaller.org/)

After cloning the repo cd into the directory and run **gem install github_api**. After it is installed run the script **ruby repo.rb**. It takes in 3 command line args for simplicity as of right now. Also be sure to get your own client_id and client_secret by registering the app under your github account(Mine are kept private for security reasons). A tutorial for doing this can be found [here](https://developer.github.com/guides/basics-of-authentication/)

 After you get your id/secret put them in a file called 'keys.txt' with ID on line 1 and Secret on line 2. 

#Examples of running the script 
ruby repo.rb 'repo name' 'login' 'pw' 

**ruby repo.rb myRepo myuser mypassword**
will create the repo 'myRepo' for the account given and initialize it with a defualt readme.

#Current status
Currently you can create a repo and initialize it with a default readme. Which is still very useful for someone who wants to create a lot of repos very quickly. However, updating/create files does not function properly. 

#TODO
1. Get OAuth to work properly - I believe there is an issue with authentication(check issue)
2. Get file updates to work - specifically update the default readme
3. Set up script to work for orgs instead of user accounts





