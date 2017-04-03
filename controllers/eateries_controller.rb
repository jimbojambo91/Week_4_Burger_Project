require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/eatery.rb' )

get '/eateries' do
  @eateries = Eatery.all()
  erb ( :"eateries/index" )
end

get '/eateries/new' do
  erb(:"eateries/new")
end

post '/eateries' do
  @eatery = Eatery.new(params)
  @eatery.save()
  redirect to '/eateries'
end

get '/eateries/:id' do
  @eatery = Eatery.find(params[:id])
  @menu_items = @eatery.menu_items
  erb(:"eateries/show")
end

post '/eateries/:id' do
  @eatery = Eatery.find(params[:id])
  @eatery.delete()
  redirect to '/eateries'
end