role :app, %w{vagrant@192.168.33.10}
role :web, %w{vagrant@192.168.33.10}
role :db, %w{vagrant@192.168.33.10}, primary: true

set :stage, :staging
set :rails_env, 'development'
set :deploy_to, '/home/vagrant/staging'

set :migration_role, 'db'
set :assets_roles, [:web, :app]

server '192.168.33.10', user: 'vagrant', roles: %w{app}, ssh_options: {
  port: 22,
  keys: %w(~/.vagrant.d/insecure_private_key),
  forward_agent: true,
  auth_methods: %w(publickey)
}

# after 'deploy', 'deploy:restart'
# after 'deploy:updated', 'deploy:migrate'
# after 'deploy:restart', 'deploy:cleanup'
