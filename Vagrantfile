# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
  config.vm.network 'forwarded_port', guest: 3000, host: 8080
  config.vm.network 'private_network', ip: '192.168.33.10'
  config.ssh.forward_agent = true
  config.vm.synced_folder '.', '/home/vagrant/app', type: 'nfs'
  config.omnibus.chef_version = :latest
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['cookbooks', 'site-cookbooks']
    chef.add_recipe 'apt'
    chef.add_recipe 'git'
    chef.add_recipe 'mysql'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rbenv::user'
    chef.add_recipe 'rbenv::vagrant'
    chef.add_recipe 'database::mysql'
    chef.json = {
      mysql: {
            server_root_password: ''
      },
      database: {
        'database_name' => 'blog_development',
        'host' => 'localhost',
        'user' => 'root',
        'password' => '',
        'action' => 'create'
      },
      rbenv: {
        'user_installs' => [
          {
            'user' => 'vagrant',
            'rubies' => ['2.1.0'],
            'global' => '2.1.0',
            'gems' => {
              '2.1.0' => [
                { name: 'bundler' },
                { name: 'therubyracer' }
              ]
            }
          }
        ]
      }
    }
    chef.run_list = [
      'apt',
      'git',
      'mysql::server',
      'mysql::client',
      'database::mysql',
      'ruby_build',
      'rbenv::user',
      'nodejs',
      'app::detabase'
    ]
  end
end