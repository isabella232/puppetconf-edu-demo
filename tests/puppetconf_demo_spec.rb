# What's in a resource?
describe "Task 1:" do
  it 'Inspect the /var/www/html/hello_puppet.html file' do
    file('/root/.bash_history')
      .content
      .should match /puppet\s+resource\s+file\s+\/var\/www\/html\/hello_puppet\.html/
  end
end

# Mind over matter
describe "Task 2:" do
  it 'Use the resource tool to create /var/www/html/hello_puppet.html' do
    file('/var/www/html/hello_puppet.html')
      .should be_file
  end
end

# Manifest reality
describe "Task 3:" do
  it 'Create and apply the hello_puppet.pp manifest' do
    file('/var/www/html/hello_puppet.html')
      .content
      .should match /Hello from Puppetconf!/
  end
end

# Keep it classy
describe "Task 4:" do
  it 'Create a module and class to wrap your file resource' do
    file('/etc/puppetlabs/code/environments/production/modules/hello/manifests/init.pp')
      .content
      .should match /class\s+hello\s+{\s+resource\s+\{\s+\'\/var\/www\/html\/quest\/hello_puppet\.html':\s+ensure\s*=>\s*file,\s+content\s*=>\s*"Hello from Puppetconf!",?\s+}\s+}/
  end
end
