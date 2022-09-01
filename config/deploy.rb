lock '~> 3.16.0'
set :application, 'iruuza'

set :repo_url, 'git@github.com:rakeshbakoriya/iRuuza.git'
# set :scm_passphrase

append :linked_files, 'config/database.yml', 'config/master.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', '.bundle', 'node_modules'


set :keep_releases, 5

set :log_level, :debug

# namespace :deploy do
#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       invoke 'unicorn:restart'
#     end
#   end

#   after :publishing, :restart

# end
