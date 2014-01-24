#
# Cookbook Name:: chef-kick
# Recipe:: default
#

include_recipe "apt"

apt_repository "commercehub-oss" do
    uri "http://dl.bintray.com/commercehub-oss/debian"
    key "https://bintray.com/user/downloadSubjectPublicKey?username=commercehub-oss"
    components ["/"]
    action :add
end

apt_package "chef-kick" do
    action :upgrade
end
