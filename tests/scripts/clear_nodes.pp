dockeragent::node { ['hello', 'webserver', 'webserver-dev']:
  ensure => absent,
}
