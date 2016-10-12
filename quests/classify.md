# Classify

Once you've tested your Puppet code in a development environment, you can apply
it to any node in your Puppet infrastructure.

We've set up a node called `webserver.puppet.vm` with the Puppet agent already
installed and configured. Puppet uses a special manifest called `site.pp` to
assign classes to nodes. Let's open it in our editor.

    vim /etc/puppetlabs/code/environments/production/manifests/site.pp

Create a new node declaration for the `webserver.puppet.vm` node, and include
your `hello` class.

```puppet
node 'webserver.puppet.vm' {
  include hello
}
```

By default, the Puppet agent runs every 30 minutes to check in with the Puppet
master and apply any changes it needs to stay in line with the state you've
defined for it. To speed things up and see Puppet do it's work, connect to the
`webserver.puppet.vm`.

    ssh root@webserver.puppet.vm # The password is puppet

And trigger a Puppet agent run.

    puppet agent -t

When the run is complete, check to see that your file has been created:

    cat /tmp/hello_puppet.txt

Now disconnect from your `webserver.puppet.vm` node

    exit
