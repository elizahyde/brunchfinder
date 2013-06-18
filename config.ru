# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Brunchfinder::Application

web: bundle exec unicorn -p $PORT -E $RACK_ENV