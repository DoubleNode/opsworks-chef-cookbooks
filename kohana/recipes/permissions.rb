# chown the latest release directory
ruby_block "chown_release_directory" do
  block do
    %x[chmod 775 #{deploy[:deploy_to]}/current/httpdocs/application/logs]
    %x[chmod 775 #{deploy[:deploy_to]}/current/httpdocs/application/cache]
  end
end
