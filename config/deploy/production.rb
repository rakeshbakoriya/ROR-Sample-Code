server '139.59.95.6', user: 'deploy', roles: %w{app db web}
set :deploy_to, '/home/deploy/apps/iruuza'

set :branch, 'master'
set :stage, :production
set :rvm_type, :system


set :rvm_ruby_version, '3.0.0@iruuza'
set :default_shell, :bash

set :bundle_path, -> { nil }
set :bundle_jobs, 4

set :puma_threads, [0, 4]
set :puma_workers, 1

set :unicorn_pid, '/home/deploy/apps/iruuza/current/tmp/pids/unicorn.pid'
set :unicorn_rack_env, 'production'

set :ssh_options, {
 forward_agent: true
}
