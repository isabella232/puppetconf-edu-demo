# Classify

Once you've tested your Puppet code in a development environment, you can apply
it to any node in your Puppet infrastructure.

## Write a node declaration

To make things easy, we've set up a node called `webserver.puppet.vm` with the
Puppet agent already installed and the certificate to allow it to connect with
the Puppet master signed. Puppet uses a special manifest called `site.pp`
to assign classes to nodes.

    vim /etc/puppetlabs/code/environments/production/manifests/site.pp

Create a new node declaration for the `webserver.puppet.vm` node, and include your
`hello` class.

    node 'webserver.puppet.vm' {
      include hello
    }

By default, Puppet runs every 30 minutes. To speed things up and see Puppet do
it's work, connect to the `webserver.puppet.vm`.

    ssh root@webserver.puppet.vm

And trigger a Puppet run.

    puppet agent -t

When the run is complete, disconnect from the server.

    exit
