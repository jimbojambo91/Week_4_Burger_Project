require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/deal.rb' )
require_relative( '../models/day.rb' )

get '/deals' do
  @deals = Deal.all()
  erb ( :"deals/index" )
end