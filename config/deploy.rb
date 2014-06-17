lock '3.2.1'

set :application, 'rails'
set :repo_url, 'git@github.com:kazu69/getting-start-rails-code.git'
set :branch, ask("deploy branch name please:", `git rev-parse --abbrev-ref HEAD`.chomp)
set :user, 'vagrant'
set :pty, true # Must be set for the password prompt
set :stages, %w(production staging)
set :default_stage, 'staging'
set :scm, :git
set :ssh_options, { forward_agent: true }
set :format, :pretty
set :log_level, :debug
set :keep_releases, 5
set :rbenv_type, :user
set :rbenv_ruby, '2.1.0'
set :linked_dirs, %w{
  bin
  log
  tmp/pids
  tmp/cache
  tmp/sockets
  vendor/bundle
  public/system
}
set :deploy_to, "/home/vagrant/#{fetch(:stage)}"

after 'deploy:publishing', 'unicorn:restart'
