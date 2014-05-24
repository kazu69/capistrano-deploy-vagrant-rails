include_recipe 'database::mysql'

mysql_connection_info = {
  :host => node['database']['host'],
  :username => node['database']['user'],
  :password => node['database']['password']
}

mysql_database node['database']['database_name'] do
  connection mysql_connection_info
  action :create
end
