#!/usr/bin/env ruby

# basics from: http://github.com/defunkt/resque/tree/master/examples/demo/

require 'logger'
require 'resque/server'
require 'yaml'

use Rack::ShowExceptions

# you can configure the db as a third parameter
password = YAML::load(File.open("redis.yml"))["production"]["password"]
Resque.redis = "redis://:#{password}@localhost:6379/8"
Resque.redis.namespace = "resque" # should be the default

run Rack::URLMap.new \
  "/" => Resque::Server.new
