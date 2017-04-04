require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/menu_items.rb' )

post '/menu_items/:id' do
  @menu_item = MenuItem.find(params[:id])
  @menu_item.delete()
  redirect to '/eateries'
end

get '/menu_items/new' do
  @eateries = Eatery.all()
  @burgers = Burger.all()
  erb(:"menu_items/new")
end

post '/menu_items' do
  @menu_item = MenuItem.new(params)
  @menu_item.save()
  redirect to "/eateries/#{@menu_item.eatery_id}"
end