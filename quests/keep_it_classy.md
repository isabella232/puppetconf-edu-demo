# Keep it classy

Puppet classes contain related sets of resources and give you an easy interface
for applying them to a system in your infrastructure. Putting classes in modules,
give Puppet a consistent way to keep track of them. Puppet looks for modules in
any directory in its modulepath.  Let's go there now.

    cd /etc/puppetlabs/code/environments/production/modules

Create the module's structure. You need a directory with the same name as the
module and a manifests directory where you'll keep your manifests.

    mkdir -p hello/{manifests,examples}

A module's main manifest (the one with a class that shares the module's name)
always has the special name `init.pp`.

Create an `init.pp` manifest.

    vim hello/manifests/init.pp

This time, put your file resource inside a class called `hello`. (Remember,
type `i` to enter insert mode in Vim)

```puppet
class hello {
  file { '/tmp/hello_puppet.txt':
    ensure  => file,
    content => "Hello from a class I wrote at Puppetconf!\n"
  }
}
```

When you're finished, type `ESC`, then `:wq` to write your changes and exit.

You've created a module and class, but we haven't shown how to apply it yet.
Move on to the next task to learn about testing.
