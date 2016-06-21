# UGLY HACK -- Cleanup after NewRelic 
# Brute force method to cleanup after  

file "/etc/php5/apache2/conf.d/newrelic.ini" do
  owner 'root'
  group 'root'
  mode '0755'
  action :delete
end

file "/etc/php5/cli/conf.d/newrelic.ini" do
  owner 'root'
  group 'root'
  mode '0755'
  action :delete
end

include_recipe "apache2::service"

service "apache2" do
  action :restart
end
