# repoBuilder

repoBuilder automates the creation of GitHub repositories from your local command line using the [Github_api](https://github.com/peter-murach/github).


## Basic Usage

First make sure you have ruby (1.9.3+) installed. Check this with

```
ruby -v
```
If you don't have ruby installed, then run
```
sudo apt-get install ruby
```
If you are on Windows go [here](http://rubyinstaller.org/) and run the Ruby installer 

After cloning the repository with
```
git clone https://github.com/adelphimathcs/repoBuilder.git
```
`cd` into the directory and run 
```
gem install github_api
``` 
then run

bundle install 
``` 

repoBuilder takes in 3 command line arguments for simplicity. Be sure to get your own client_id and client_secret by registering the app under your github account (Mine are kept private for security reasons). A tutorial for doing this can be found [here](https://developer.github.com/guides/basics-of-authentication/)

 After you get your id/secret put them in a file called `keys.txt` with ID on line 1 and Secret on line 2. 

## Examples of running the script 

```
ruby repo.rb 'repo name' 'login' 'pw' 
```
```
ruby repo.rb myRepo myuser mypassword
```

This will create the repo 'myRepo' for the account given and initialize it with a defualt readme.

## Current status
Currently you can create a repo and initialize it with a default readme. This is still very useful for someone who wants to create a lot of repos very quickly. However, updating/create files does not function properly. 

## TODO
1. Get OAuth to work properly - I believe there is an issue with authentication(check issue)
2. Get file updates to work - specifically update the default readme
3. Set up script to work for orgs instead of user accounts





