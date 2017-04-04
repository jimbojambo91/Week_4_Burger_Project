require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/menu_items.rb' )

post '/menu_items/:id' do
  @menu_item = MenuItem.find(params[:id])
  @menu_item.delete()
  redirect to '/eateries'
end