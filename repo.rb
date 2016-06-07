require 'github_api'
require 'highline/import'

puts 'Enter name of repository you wish to create (The problem number in the form ####): '
repo = gets.chomp

if (repo =~ /[\d]{4}/).nil?
  abort("Invalid repository name. Repository name should be of the form ####")
end

puts 'Enter your GitHub username: '
login = gets.chomp
pw = ask('Enter your GitHub password: ') { |q| q.echo="*" }

file = File.open('keys.txt', 'r')

client_id = file.readline.chomp
client_secret = file.readline.chomp

github = Github.new client_id: client_id,
                    client_secret: client_secret
res = github.authorize_url scope: 'repo'

puts 'Please navigate your browser to:'
puts res.to_s
puts 'Enter your url code '

auth_code = gets.chomp
token = github.get_token(auth_code)

github = Github.new do |c|
  c.user          = 'adelphimathcs'
  c.org           = 'adelphimathcs'
  c.basic_auth    = login + ':' + pw
  c.repo          = repo
  c.oauth_token   = token.to_s
  c.client_id     = client_id
  c.client_secret = client_secret
end

default_readme = File.open('default_readme.md', 'rb') { |f| f.read }

#puts github.orgs.teams.list org: 'adelphimathcs'
#response from team list
#<Hashie::Mash description=nil id=1644006 members_url="https://api.github.com/teams/1644006/members{/member}" name="Faculty" permission="admin" privacy="closed" repositories_url="https://api.github.com/teams/1644006/repos" slug="faculty" url="https://api.github.com/teams/1644006">
#<Hashie::Mash description="Current students at Adelphi " id=1646171 members_url="https://api.github.com/teams/1646171/members{/member}" name="Students" permission="admin" privacy="closed" repositories_url="https://api.github.com/teams/1646171/repos" slug="students" url="https://api.github.com/teams/1646171">
#<Hashie::Mash description="Adelphi Alum" id=1646188 members_url="https://api.github.com/teams/1646188/members{/member}" name="Alumni" permission="admin" privacy="closed" repositories_url="https://api.github.com/teams/1646188/repos" slug="alumni" url="https://api.github.com/teams/1646188">


# creates repo, throws error if already exists
github.repos.create name: repo, org: github.org,
                    description: 'Please put problem name here',
                    team_id: 1646188 #1646171 <- student team ID 


github.repos.contents.create github.user, repo,  'README.md',
                             org: github.org,
                             path: 'README.md',
                             message: 'initializing default readme',
                             content: default_readme
