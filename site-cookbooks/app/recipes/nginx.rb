include_recipe 'nginx'

node.default['default_root'] = node['app']['app_path']

execute 'apt-get update' do
  command 'apt-get update -y'
end

service 'nginx' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end

template 'nginx.conf' do
    path "#{node['nginx']['dir']}/nginx.conf"
    source 'nginx.conf.erb'
    owner node['nginx']['user']
    group node['nginx']['group']
    mode 0644
    notifies :reload , 'service[nginx]'
end
