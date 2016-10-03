# Reuse

You've created a class to manage your file resource, but without a server on
your node, it won't do much good. While you could write your own resources to
manage the packages, services, and configuration files needed to run a server,
there's an easier way.

## The nginx module

We've pre-loaded a community-maintained Nginx module into your modules
directory. This module provides you with a main `nginx` class to install
and configure the server. It also provides a `vhost` resource type you
can use to serve content from the `/var/www/quest` directory.

    vim hello/manifests/init.pp

Edit your `hello` class to include the `nginx` class and define a vhost.

```puppet
class hello {
  include 'nginx'

  nginx::resource::vhost { 'www.puppetlabs.com':
    www_root => '/var/www/quest',
  }

  file { ['/var/www', '/var/www/quest']:
    ensure => directory,
  }

  file { '/var/www/quest/hello_puppet.html':
    ensure  => file,
    content => "Hello from a class I wrote at Puppetconf!"
  }
}
```
