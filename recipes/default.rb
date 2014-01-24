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

apt_package "chef-kick" do
    action :upgrade
end

file "/usr/bin/chef-kick" do
    owner "root"
    group "root"
    mode "4755"
end
