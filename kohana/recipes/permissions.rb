# chown the latest release directory
node[:deploy].each do |application, deploy|

  ruby_block "chown_release_directory" do
    block do
      %x[chmod 775 #{deploy[:deploy_to]}/current/httpdocs/application/logs]
      %x[chmod 775 #{deploy[:deploy_to]}/current/httpdocs/application/cache]
    end
  end
end

