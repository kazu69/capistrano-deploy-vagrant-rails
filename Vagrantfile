# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'
LISTEN_PORT = 8080
APP_PATH = '/home/vagrant/staging/current'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
  config.vm.network 'forwarded_port', guest: LISTEN_PORT, host: 8080
  config.vm.network 'private_network', ip: '192.168.33.10'
  config.ssh.forward_agent = true
  config.vm.synced_folder '.', '/home/vagrant/app', type: 'nfs'
  config.omnibus.chef_version = :latest
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = %w(cookbooks site-cookbooks)
    chef.roles_path = %w(roles)
    # http://stackoverflow.com/questions/22991561/chef-solo-ssl-warning-when-provisioning
    chef.custom_config_path = 'Vagrantfile.chef'

    chef.add_role 'base'
    chef.add_role 'ruby'
    chef.add_role 'database'
    chef.add_role 'web'
    chef.add_role 'application'

    chef.json = {
      'app' => {
        'listen_port' => LISTEN_PORT,
        'app_path' => APP_PATH,
      }
    }
  end
end