# What's in a resource?
describe "Task 1:" do
  it 'Inspect the /var/www/quest/hello_puppet.html file' do
    file('/root/.bash_history')
      .content
      .should match /puppet\s+resource\s+file\s+\/var\/www\/quest\/hello_puppet\.html/
  end
end

# Mind over matter
describe "Task 2:" do
  it 'Use the resource tool to create /var/www/quest/hello_puppet.html' do
    file('/var/www/quest/hello_puppet.html')
      .should be_file
  end
end

# Manifest reality
describe "Task 3:" do
  it 'Create and apply the hello_puppet.pp manifest' do
    file('/var/www/quest/hello_puppet.html')
      .content
      .should match /Hello from.*Puppetconf!/
  end
end

# Keep it classy
describe "Task 4:" do
  it 'Create a module and class to wrap your file resource' do
    file('/etc/puppetlabs/code/environments/production/modules/hello/manifests/init.pp')
      .content
      .should match /class\s+hello\s+{/
    file('/etc/puppetlabs/code/environments/production/modules/hello/manifests/init.pp')
      .content
      .should match /file\s+\{\s+\'\/var\/www\/quest\/hello_puppet\.html':\s+ensure\s*=>\s*file,\s+content\s*=>\s*"Hello from a class I wrote at Puppetconf!",?\s+\}/
    file('/etc/puppetlabs/code/environments/production/modules/hello/manifests/init.pp')
      .content
      .should match /file\s+\{\s+\['\/var\/www',\s*\/var\/www\/quest'\]:\s+ensure\s*=>\s*directory,?\s+}\s+}/
  end
end

# Test your code
describe "Task 5:" do
  it 'Use a test manifest to apply your class' do
    file('/var/www/quest/hello_puppet.html')
      .content
      .should match /Hello from a class I wrote at Puppetconf!/
  end
end

# Classify
describe "Task 6:" do
  it 'Use the Nginx module to set up a server' do
    file('/etc/puppetlabs/code/environments/production/modules/hello/manifests/init.pp')
      .content
      .should match /include 'nginx'/
    file('/etc/puppetlabs/code/environments/production/modules/hello/manifests/init.pp')
      .content
      .should match /nginx::resource::vhost\s+'_':\s+www_root\s*=>\s*d'\/var\/www\/quest',?\w+}/
  end
end
