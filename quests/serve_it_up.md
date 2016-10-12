# Serve it up

Managing a text file isn't much fun without a webserver to let you share it
with the world. You could write your own resources to manage each package,
service, and configuration file needed to run a server, but there's an easier
way.

We've pre-loaded a community-maintained Nginx module into your modules
directory. This module provides you with a main `nginx` class to install
and configure the server. It also provides a `vhost` resource type you
can use to serve content from the `/var/www/` directory.

    vim hello/manifests/init.pp

Rewrite your `hello` class to configure Nginx and serve your file. (Remember, use
`i` to enter insert mode in Vim, and type `ESC` then `:wq` when you're done.

```puppet
class hello {
  include 'nginx'

  # Use _ as a catch-all vhost name
  nginx::resource::vhost { '_':
    www_root => '/var/www',
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

Now connect to your webserver and trigger a Puppet agent run

    ssh root@webserver.puppet.vm # The password is puppet
    puppet agent -t

Check out your hosted file!

    curl localhost/hello_puppet.txt
