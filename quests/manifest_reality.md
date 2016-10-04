# Manifest reality

If you want a consistent way to manage your system, you need to save and
organize your resource declarations.

## Infrastructure as code

Open a new file to write your resource declaration:

    vim /tmp/hello_puppet.pp

Type `i` to enter insert mode, and write out your resource declaration. Feel
free to replace the content with any message you like.

```puppet
file { '/tmp/hello_puppet.txt':
  ensure  => file,
  content => "Hello from Puppetconf!\n"
}
```

Now use the `puppet apply` command to tell puppet to apply your manifest.

    puppet apply /tmp/hello_puppet.pp

Now take a look at your file:

    cat /tmp/hello_puppet.txt

In the next quest, we'll show you how to organize your code with classes
and modules.
