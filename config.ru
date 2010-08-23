#!/usr/bin/env ruby

# basics from: http://github.com/defunkt/resque/tree/master/examples/demo/

require 'logger'
require 'resque/server'

use Rack::ShowExceptions

# you can configure the db as a third parameter
Resque.redis = "localhost:6379:8"
Resque.redis.namespace = "resque" # should be the default

run Rack::URLMap.new \
  "/" => Resque::Server.new
