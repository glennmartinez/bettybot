# Rack midleware configuration file

require File.join(File.dirname(__FILE__), 'app')

set :run, false
set :environment, ENV['QA_DASHBOARD_ENV'] || :development
set bind: "localhost"
set port: 7655


FileUtils.mkdir_p 'log' unless File.exists?('log')
log = File.new("log/sinatra.log", "a+")
$stdout.reopen(log)
$stderr.reopen(log)


run Sinatra::Application