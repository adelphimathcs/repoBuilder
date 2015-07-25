require 'github_api'

if ARGV.size != 3
  puts "wrong amount of args"
  Kernel.exit(true)
else
  repo = ARGV[0]
  login = ARGV[1]
  pw   =ARGV[2]
end

file = File.open("keys.txt","r")

client_id = file.readline.chomp
client_secret = file.readline.chomp

# github = Github.new basic_auth: login+':'+pw
# github.oauth.app.create client_id: client_id,
#                       client_secret: client_secret,
#                       scopes: ['repo']

github = Github.new client_id: client_id,
                    client_secret: client_secret
res = github.authorize_url scope: 'repo'

puts "please navigate your browser to: " + res.to_s
puts "Enter your url code "

auth_code = $stdin.gets.chomp
token = github.get_token(auth_code)

github = Github.new do |c|
  c.user          = login
  c.basic_auth    = login+":"+pw
  c.repo          = repo
  c.oauth_token   = token.to_s
  c.client_id     = client_id
  c.client_secret = client_secret
end

#creates repo, throws error if already exists
github.repos.create name: repo, auto_init: true

contents = Github::Client::Repos::Contents.new 
file = contents.find path: 'README.md', user: login, repo: repo


contents.update login, repo, 'README.md',
  path: 'README.md',
  message: "update readme",
  content: "#readme content",
  sha: file.sha
