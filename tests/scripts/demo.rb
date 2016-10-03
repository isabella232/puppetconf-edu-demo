#!/bin/ruby

require_relative './setup_helper.rb'

reset_tasks
clear_nodes
create_node('webserver.puppet.vm', 'agent')
update_docker_hosts
