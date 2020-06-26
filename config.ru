require './config/env'
require 'require_all'


use Rack::MethodOverride
use DestinationsController  
use UsersController  
run ApplicationController