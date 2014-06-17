name 'web'
description 'setup for web services'

run_list(
  'recipe[nodejs]',
  'recipe[app::nginx]'
)

override_attributes(
  :nginx => {
    :install_method => 'package',
    :dir => '/etc/nginx',
    :user => 'root',
    :group => 'root',
    :worker_processes => 1,
    :pid => '/var/run/nginx.pid',
    :worker_connections => 1024,
    :log_dir => '/var/log/nginx',
  }
)
