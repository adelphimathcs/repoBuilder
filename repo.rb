require 'github_api'

repo = ''
if ARGV.size != 3 
  puts "wrong amount of args"
  Kernel.exit(true)
else
  repo = ARGV[0]
  login = ARGV[1]
  pw   =ARGV[2]
end

github = Github.new basic_auth: login+':'+pw
github.oauth.app.create client_id: 'e7aca063777dbb66f81d',
                      client_secret: 'f8801a74356bc5931052eb9f25b5595043f3ca1b',
                      scopes: ['repo']


#github.repos.create name: repo, auto_init: true

#contents = Github::Client::Repos::Contents.new 
# contents = github::Client::Repos::Contents.new
# file = contents.find path: 'README.md', user: login, repo: repo
# puts file.body
# puts ''

# contents.update login, repo, 'README.md',
#   path: 'README.md',
#   message: "update readme",
#   content: "#readme content",
#   sha: file.sha
