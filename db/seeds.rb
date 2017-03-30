require_relative( '../models/burger.rb' )
require_relative( '../models/eatery.rb' )
require_relative( '../models/menu_items.rb' )
require('pry-byebug')

MenuItem.delete_all
Eatery.delete_all
Burger.delete_all

burger1 = Burger.new({'name' => "Hamburger"})
burger1.save()

eatery1 = Eatery.new({'name' => "McDonalds"}) 
eatery1.save()

menu_item1 = MenuItem.new({
  'burger_id' => burger1.id,
  'eatery_id' => eatery1.id,
  'price' => 1.00
  })
menu_item1.save()