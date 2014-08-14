# lumberyard/lumberyard.rb
require 'sinatra'
require 'sinatra/reloader' if development?

require_relative 'log'
require_relative 'search'

get '/' do
end

get '/search' do
end

get '/style.css' do
  scss :style
end

get '/renderjson.js' do
  send_file 'views/renderjson.js'
end
