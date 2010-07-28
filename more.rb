require 'sinatra'
require 'faker'

Poem    = Struct.new :title, :body
get '/' do
  @poems  = Array.new(60) { Poem.new(Faker::Lorem.sentence, Faker::Lorem.paragraph(2 + rand(5))) }
  haml :expand
end

get '/paginated' do
  @poems  = Array.new(60) { Poem.new(Faker::Lorem.sentence, Faker::Lorem.paragraph(2 + rand(5))) }
  haml :paginated
end

