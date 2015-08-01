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
gem install github_api highline
``` 

Be sure to get your own client_id and client_secret by registering the app under your github account. A tutorial for doing this can be found [here](https://developer.github.com/guides/basics-of-authentication/)

 After you get your id/secret put them in a file called `keys.txt` with ID on line 1 and Secret on line 2. 

Finally, run 
```
ruby repo.rb
```

## Current status
Currently you can create a repo and initialize it with a default `README.md`.  When the repo is created, be sure to update `README.md` with the correct information from the problem!


