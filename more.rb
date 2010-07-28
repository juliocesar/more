require 'sinatra'
require 'haml'
require 'yaml'

$poems = YAML.load_file 'poems.yml'

get '/' do
  @poems = $poems[0..4]
  haml :expand
end

get '/more' do
  chunk   = params[:chunk].to_i
  offset  = chunk * 5
  @poems  = $poems[5..(4 + offset)]
  haml :more, :layout => false
end