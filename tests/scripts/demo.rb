#!/bin/ruby

require_relative './setup_helper.rb'

clear_nodes
create_node('webserver', 'agent')
update_docker_hosts
