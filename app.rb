require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('controllers/eateries_controller')
require_relative('controllers/burgers_controller')
require_relative('controllers/deals_controller')
require_relative('controllers/menu_items_controller')


get '/' do
  @days = Day.all()
  erb( :index )
end

post '/selection' do
  @day = Day.find(params['day_id'])
  @user_selection = params['request'].to_s 
  erb(:result)
end