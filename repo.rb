require 'github_api'

if ARGV.size != 3
  abort("Incorrect number of arguments (#{ARGV.size} for 3)")
else
  repo = ARGV[0]
  login = ARGV[1]
  pw = ARGV[2]
end

file = File.open('keys.txt', 'r')

client_id = file.readline.chomp
client_secret = file.readline.chomp

# github = Github.new basic_auth: login+':'+pw
# github.oauth.app.create client_id: client_id,
#                       client_secret: client_secret,
#                       scopes: ['repo']

github = Github.new client_id: client_id,
                    client_secret: client_secret
res = github.authorize_url scope: 'repo'

puts 'Please navigate your browser to: ' + res.to_s
puts 'Enter your url code '

auth_code = $stdin.gets.chomp
token = github.get_token(auth_code)

github = Github.new do |c|
  c.user          = login
  c.basic_auth    = login + ':' + pw
  c.repo          = repo
  c.oauth_token   = token.to_s
  c.client_id     = client_id
  c.client_secret = client_secret
end

default_readme = File.open('default_readme.md' , 'rb') { |f| f.read }

# creates repo, throws error if already exists
github.repos.create name: repo
github.repos.contents.create login, repo,  'README.md',
                             path: 'README.md',
                             message: 'initializing default readme',
                             content: default_readme
