lock '3.2.1'

set :application, 'blog'
set :repo_url, 'git@bitbucket.org:kazu69/rails4-playground.git'
set :branch, 'master'
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
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do
  desc 'Start application'
  task :start do
    on roles(:app) do
      within release_path do
        execute :bundle, 'exec rails s -d'
      end
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:all) do
      within release_path do
        pid = '/home/vagrant/staging/current/tmp/pids/server.pid'
        if File.exist?(pid)
          execute "kill -QUIT `cat #{pid}`"
        else
          execute "echo 'not working'"
        end
      end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app) do
      within release_path do
        pid = '/home/vagrant/staging/current/tmp/pids/server.pid'
        execute "kill UIT `cat #{pid}`"
        sleep 2
        execute 'cd /home/vagrant/staging/current;',:bundle, 'exec rails s -d'
      end
    end
  end
end
