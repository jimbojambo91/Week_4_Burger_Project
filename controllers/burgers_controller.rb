require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/burger.rb' )

get '/burgers' do
  @burgers = Burger.all()
  erb ( :"burgers/index" )
end

post '/burgers' do
  @burger = Burger.new(params)
  @burger.save()
  redirect to '/burgers'
end

get '/burgers/new' do
  erb(:"burgers/new")
end

