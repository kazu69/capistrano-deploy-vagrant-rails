name 'database'
description 'Mysql setup'

run_list(
  'recipe[mysql::server]',
  'recipe[mysql::client]',
  'recipe[database::mysql]'
)

override_attributes(
  :database => {
    :database_name => 'blog_development',
    :host => 'localhost',
    :user => 'root',
    :password => '',
    :action => 'create'
  },
  :mysql => {
    :server_root_password => ''
  }
)
