# libyaml cookbook

This cookbook can be included using Berkshelf or another library management tool by adding the following:

    # Berkshelf example
    site "https://api.opscode.com/organizations/rubyops"

    # ... or ...
    cookbook "COOKBOOK_NAME", git: "git://github.com/rubyops/cookbook-COOKBOOK_NAME.git", branch: "master"

# Requirements

* [build-essentials](http://community.opscode.com/cookbooks/build-essential)
* [yum](http://community.opscode.com/cookbooks/yum)
* [apt](http://community.opscode.com/cookbooks/apt)


## This has been tested on the following:

* CentOS 6.2
* CentOS 6.3
* Ubuntu 10.04.4 LTS (lucid64)

# Usage

    // file: nodes/host.json
    {
        // Required for build-essential.
        //
        // See build-essential docs for custom configs,
        // empty configs as below are acceptable for
        // defaults.
        "build_essential": {},

        // Include recipe.
        // Debian based systems from apt.
        "run_list": [ "recipe[libyaml]" ]

        // Redhat based systems from source.
        // - This has been tested on Ubuntu as well and
        //   should work on all debian based systems.
        //
        // "run_list": [ "recipe[libyaml::source]" ]
    }

# Attributes

    // file: nodes/host.json
    {
       "libyaml": {
           // defaults shown here
           "version":    "0.1.4",
           "source_url": "http://pyyaml.org/download/libyaml",
           "source_dir": "/usr/local/src",
           "dest_dir":   "/usr/local"
       }
    }

# Author

Author:: Joshua P. Mervine (<joshua@mervine.net>)
