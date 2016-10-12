# Test your code

Defining a class tells Puppet what that class means, but doesn't tell it to do
anything with it. To test your class, you need to write an example manifest
that will tell Puppet to take the resources defined in your class and apply
them.

Create a test manifest for `init.pp` in your `hello/examples` directory.

    vim hello/examples/init.pp

Use the 'include' syntax to tell Puppet you want to apply your `hello` class.

```puppet
include hello
```

Remember, this kind of example manifest is something you will write to test
a module as you're working on it. After we apply this test, we'll show you
how you would apply this class to a node in your infrastructure.

Use `puppet apply` to run your test.

    puppet apply hello/examples/init.pp
