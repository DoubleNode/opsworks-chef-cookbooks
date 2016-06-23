# Get the base directory that OpsWorks will deploy to
deploy_to =node[:deploy][:api][:deploy_to]

# chown the latest release directory
ruby_block "chown_release_directory" do
  block do
    lastRelease = `ls -t #{deploy_to}/releases/ | head -n 1`
    %x[chmod 775 #{deploy_to}/releases/#{lastRelease}/httpdocs/application/logs]
    %x[chmod 775 #{deploy_to}/releases/#{lastRelease}/httpdocs/application/cache]
  end
end
