#
# Cookbook Name:: timezone
# Recipe:: default
#
# Copyright 2013, sanojimaru
#
# All rights reserved - Do Not Redistribute

# Place enable the module if required and restart apache
case node[:platform]
when "debian","ubuntu"
  execute "update-tzdata" do
    command "dpkg-reconfigure -f noninteractive tzdata"
    action :nothing
  end

  file node[:timezone][:tz_file] do
    owner "root"
    group "root"
    mode "00644"
    content node[:timezone][:zoneinfo]
    notifies :run, "execute[update-tzdata]"
  end

  package "tzdata" do
    action :install
  end
end

case node[:platform]
when "amazon"
  template "/etc/sysconfig/clock" do
    notifies :run, "execute[timezone_update]", :immediately
  end

  execute "timezone_update" do
    command "cp /usr/share/zoneinfo/#{node[:timezone][:zoneinfo]} /etc/localtime"
    action :nothing
  end
end
