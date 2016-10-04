# What's in a resource?
describe "Task 1:", host: :localhost do
  it 'Inspect the /tmp/hello_puppet.txt file' do
    file('/root/.bash_history')
      .content
      .should match /puppet\s+resource\s+file\s+\/tmp\/hello_puppet\.txt/
  end
end

# Mind over matter
describe "Task 2:", host: :localhost do
  it 'Use the resource tool to create the /tmp/hello_puppet.txt file' do
    file('/tmp/hello_puppet.txt')
      .should be_file
  end
end

# Manifest reality
describe "Task 3:", host: :localhost do
  it 'Create and apply the hello_puppet.pp manifest' do
    file('/tmp/hello_puppet.txt')
      .content
      .should match /Hello from.*Puppetconf!/
  end
end

# Keep it classy
describe "Task 4:", host: :localhost do
  it 'Create a module and class to wrap your file resource' do
    file('/etc/puppetlabs/code/environments/production/modules/hello/manifests/init.pp')
      .content
      .should match /class\s+hello\s+{/
    file('/etc/puppetlabs/code/environments/production/modules/hello/manifests/init.pp')
      .content
      .should match /file\s+\{\s*\'\/.*\/hello_puppet\.txt':\s+ensure\s*=>\s*file,\s+content\s*=>\s*"Hello from a class I wrote at Puppetconf!\\n",?\s+\}/
  end
end

# Test your code
describe "Task 5:", host: :localhost do
  it 'Use a test manifest to apply your class' do
    file('/tmp/hello_puppet.txt')
      .content
      .should match /Hello from a class I wrote at Puppetconf!/
  end
end

# Classify
describe "Task 6:", host: :webserver do
  it 'Apply the hello class to your webserver node' do
    file('/tmp/hello_puppet.txt')
      .content
      .should match /Hello from.*Puppetconf!/
  end
end

# Serve it up
describe "Task 7:", host: :localhost do
  it 'Add an nginx server to your hello class' do
    command('curl webserver.puppet.vm/hello_puppet.txt')
      .stdout
      .should match /Hello/
  end
end
