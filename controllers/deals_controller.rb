require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/deal.rb' )
require_relative( '../models/day.rb' )

get '/deals' do
  @deals = Deal.all()
  erb ( :"deals/index" )
end

get '/deals/new' do
  @days = Day.all()
  @menu_items = MenuItem.all()
  erb(:"deals/new")
end

post '/deals' do
  @deal = Deal.new(params)
  @deal.save()
  redirect to '/deals'
end

get '/deals/:id' do
  @deal = Deal.find(params[:id])
  erb(:"deals/show")
end

post '/deals/:id/delete' do
  @deal = Deal.find(params[:id])
  @deal.delete()
  redirect to '/deals'
end

get '/deals/:id/edit' do
  @menu_items = MenuItem.all()
  @days = Day.all()
  @burgers = Burger.all()
  @eateries = Eatery.all()
  @deal = Deal.find(params[:id])
  erb(:"deals/edit")
end

post '/deals/:id/edit' do
  @deal = Deal.new(params)
  @deal.update()
  redirect to "/deals"
end