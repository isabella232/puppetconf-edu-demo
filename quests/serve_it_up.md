# Serve it up

Managing a text file isn't much fun without a webserver to let you share it
with the world. You could write your own resources to manage each packages,
services, and configuration files needed to run a server, but there's an easier
way.

## The nginx module

We've pre-loaded a community-maintained Nginx module into your modules
directory. This module provides you with a main `nginx` class to install
and configure the server. It also provides a `vhost` resource type you
can use to serve content from the `/var/www/` directory.

    vim hello/manifests/init.pp

Here's how to rewrite your `hello` class to configure Nginx and serve your
file.

```puppet
class hello {
  include 'nginx'

  # Use _ as a catch-all vhost name
  nginx::resource::vhost { '_':
    www_root => '/var/www/quest',
  }

  file { '/var/www':
    ensure => directory,
    owner  => 'nginx',
    group  => 'nginx',
  }

  file { '/var/www/hello_puppet.txt':
    ensure  => file,
    content => "Hello from a class I wrote at Puppetconf!"
  }
}
```
