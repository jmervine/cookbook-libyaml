#!/usr/bin/env ruby

case node['platform_family']
when "debian"
  include_recipe "apt"
  package "libtool"
  package "libtool-devel"
else
  return "#{node['platform_family']} is not supported, please use 'libtool::source'."
end
