# Set ACL rules to give proper permission to cache and logs

node[:deploy].each do |application, deploy|

  script "update_acl" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    mount -o remount,acl /srv/www 
    setfacl -R -m u:www-data:rwX -m u:ubuntu:rwX *
    setfacl -dR -m u:www-data:rwx -m u:ubuntu:rwx *
    EOH
  end

end
