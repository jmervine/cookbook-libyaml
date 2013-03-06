#!/usr/bin/env ruby

# helper method
# TODO: move out of recipe
def fetch_config key
  (node['ruby'][key.to_s] || @defaults[key]) rescue @defaults[key]
end

if node['platform_family'] == "windows"
  return "#{node['platform']} is not supported by the #{cookbook_name}::#{recipe_name} recipe"
end

include_recipe "build-essential"

@defaults = {
  :version     => "0.1.4",
  :source_url  => "http://pyyaml.org/download/libyaml",
  :source_dir  => "/usr/local/src",
  :dest_dir    => "/usr/local"
}

ver = fetch_config(:version)
url = fetch_config(:source_url)
src = fetch_config(:source_dir)
dir = fetch_config(:dest_dir)

tar = "yaml-#{ver}.tar.gz"

## ruby
remote_file "#{src}/#{tar}" do
  source "#{url}/#{tar}"
  mode 0644
  action :create_if_missing
end

execute "tar --no-same-owner -xzf #{tar}" do
  cwd src
  creates "#{src}/yaml-#{ver}"
end

execute "./configure --prefix=#{dir}" do
  cwd "#{src}/yaml-#{ver}"
  creates "#{src}/yaml-#{ver}/Makefile"
end

execute "make" do
  cwd "#{src}/yaml-#{ver}"
  creates "#{src}/yaml-#{rver}/src/parser.o"
end

execute "make install" do
  cwd "#{src}/yaml-#{ver}"
  creates "#{dir}/include/yaml.h"
end

# vim: filetype=ruby
