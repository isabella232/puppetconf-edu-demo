# Manifest reality

If you want a consistent way to manage your system, you need to save and
organize your resource declarations.

Open a new file to write your resource declaration:

    vim /tmp/hello_puppet.pp

Type `i` to enter insert mode, and write out your resource declaration.

```puppet
file { '/tmp/hello_puppet.txt':
  ensure  => file,
  content => "Hello from Puppetconf!\n"
}
```

When you're finished, type `ESC`, then `:wq` to write your changes and exit.

Now use the `puppet apply` command to tell puppet to apply your manifest.

    puppet apply /tmp/hello_puppet.pp

Now take a look at your file:

    cat /tmp/hello_puppet.txt

In the next quest, we'll show you how to organize your code with classes
and modules.
