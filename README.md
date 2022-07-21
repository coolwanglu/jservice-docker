# About this Repo
It allowes you to host jservice.io (trivia API) in your own Docker container.

# Instructions (need lots of optimization)

1. git clone this repo
1. `cd jservice-docker`
1. `sudo docker-compose up -d db`
1. `sudo docker-compose build jservice`
1. `sudo docker-compose run --rm jservice rake db:schema:load`
1. `sudo docker-compose run --rm jservice rake get_clues[1,31]`
    - Or just grab one season `sudo docker-compose run jservice rake get_clues[1,1]`
1. `sudo docker-compose up -d jservice`
1. Now access http://host:8888 and http://host:8888/api/random

# Random tips for troubleshooting
`rm src/jService/tmp/pids/server.pid`
