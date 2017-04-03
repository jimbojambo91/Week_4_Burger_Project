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

get '/burgers/:id' do
  @burger = Burger.find(params[:id])
  @menu_items = @burger.menu_items
  erb(:"burgers/show")
end

post '/burgers/:id' do
  @burger = Burger.find(params[:id])
  @burger.delete()
  redirect to '/burgers'
end

