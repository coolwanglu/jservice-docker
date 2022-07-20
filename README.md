# About this Repo
It allowes you to host jservice.io (trivia API) in your own Docker container.

# Instructions (need lots of optimization)

1. git clone this repo
1. `cd jservice-docker`
1. `sudo docker-compose up -d db`
1. `sudo docker-compose run jservice /bin/bash`
1. Note: you are now inside a container shell
1. `cd /src`
1. `git clone https://github.com/sottenad/jService.git`
1. `cd jService`
1. `bundle install`
1. `exit`
1. Note: you are now back to your host, still in jservice-docker
1. `sudo cp override/database.yml src/jService/config/database.yml`
1. `sudo cp override/postgresql_adapter.rb bundle/gems/activerecord-4.0.2/lib/active_record/connection_adapters/postgresql_adapter.rb`
1. `sudo cp override/get_latest.rake src/jService/lib/tasks/get_latest.rake` 
1. `sudo docker-compose run jservice /bin/bash`
1. Note: you are now inside a container shell
1. `rake db:schema:load`
1. `rake get_clues[1,1]	# just grab the first season for testing`
1. `# rake get_clues[1,31] # grab 31 seasons`
1. `exit`
1. Note: you are now back to your host, still in jservice-docker
1. `sudo docker-compose up -d jservice`
1. Now access http://host:8888 and http://host:8888/api/random

# Random tips for troubleshooting

`rm src/jService/tmp/pids/server.pid`
