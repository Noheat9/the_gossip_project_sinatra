require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  get '/gossips/new/' do
    erb :new_gossip
  end
  post '/gossips/new/' do
		Gossip.new(params["gossip_author"], params["gossip_content"]).save
		redirect '/'
	end
 
  get '/hello/:name' do
    "Hello #{params['name']}!"
  end

  #run! if app_file == $0
end