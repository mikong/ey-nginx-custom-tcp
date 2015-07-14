#
# Cookbook Name:: nginx_custom
# Recipe:: default
#

# Set your application name here
app_name = "myapp"

if ['app', 'app_master', 'solo'].include?(node[:instance_role]) && node[:applications].keys.include?(app_name)

  ey_cloud_report "nginx_custom" do
    message "custom config for Nginx"
  end

  execute "reload-nginx" do
    action :nothing
    command "/etc/init.d/nginx reload"
  end

  remote_file "/data/nginx/servers/#{app_name}/custom.tcp_conf" do
    owner "deploy"
    group "deploy"
    mode 0644
    source "custom.tcp_conf"
    backup false
    action :create
    notifies :run, resources(:execute => "reload-nginx")
  end
end
