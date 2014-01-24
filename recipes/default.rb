#
# Cookbook Name:: chef-kick
# Recipe:: default
#

include_recipe "apt"
include_recipe "chef-client"

apt_repository "commercehub-oss" do
    uri "http://dl.bintray.com/commercehub-oss/debian"
    key "https://bintray.com/user/downloadSubjectPublicKey?username=commercehub-oss"
    components ["/"]
    action :add
end

# Doesn't currently work because bintray doesn't provide signed metadata?
#apt_package "chef-kick" do
#    action :upgrade
#end

execute "apt-get install --quiet --yes --allow-unauthenticated chef-kick"

file "/usr/bin/chef-kick" do
    owner "root"
    group "root"
    mode "4755"
end
