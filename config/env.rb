
ENV['SINATRA_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
    set :database, {adapter: 'sqlite3', database: 'db/database.sqlite3'}
end

require_all 'app'