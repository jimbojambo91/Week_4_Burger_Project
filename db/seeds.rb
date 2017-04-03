require_relative( '../models/burger.rb' )
require_relative( '../models/eatery.rb' )
require_relative( '../models/menu_items.rb' )
require_relative( '../models/day.rb' )
require_relative( '../models/deal.rb' )
require('pry-byebug')

Deal.delete_all
MenuItem.delete_all
Eatery.delete_all
Burger.delete_all
Day.delete_all

day1 = Day.new('name' => "Monday")
day2 = Day.new('name' => "Tuesday")
day3 = Day.new('name' => "Wednesday")
day4 = Day.new('name' => "Thursday")
day5 = Day.new('name' => "Friday")
day6 = Day.new('name' => "Saturday")
day7 = Day.new('name' => "Sunday")

day1.save
day2.save
day3.save
day4.save
day5.save
day6.save
day7.save

burger1 = Burger.new({'name' => "Hamburger", 'image' => '/images/Burgers/hamburger.jpg'})
burger2 = Burger.new({'name' => "Cheeseburger", 'image' => '/images/Burgers/Cheeseburger.jpg'})
burger3 = Burger.new({'name' => "Whopper", 'image' => '/images/Burgers/whopper.jpg'})
burger4 = Burger.new({'name' => "Big Mac", 'image' => '/images/Burgers/BigMac.jpg'})
burger5 = Burger.new({'name' => "Royale with cheese", 'image' => '/images/Burgers/royale.png'})
burger1.save()
burger2.save()
burger3.save()
burger4.save()
burger5.save()

eatery1 = Eatery.new({'name' => "McDonalds", 'image' => '/images/Eateries/mcdonalds.jpg'}) 
eatery2 = Eatery.new({'name' => "Burger King", 'image' => '/images/Eateries/burger_king.jpg'}) 
eatery1.save()
eatery2.save()

menu_item1 = MenuItem.new({
  'burger_id' => burger1.id,
  'eatery_id' => eatery1.id,
  'price' => 1.00
  })

menu_item2 = MenuItem.new({
  'burger_id' => burger4.id,
  'eatery_id' => eatery1.id,
  'price' => 5.00
  })

menu_item3 = MenuItem.new({
  'burger_id' => burger3.id,
  'eatery_id' => eatery2.id,
  'price' => 1.00
  })
menu_item1.save()
menu_item2.save()
menu_item3.save()

deal1 = Deal.new({'name' => "50% off", 'menu_item_id' => menu_item2.id , 'day_id' => day3.id, 'type' => "*", 'amount' => 0.5})
deal2 = Deal.new({'name' => "BOGOF", 'menu_item_id' => menu_item3.id , 'day_id' => day1.id, 'type' => 'Special'})
deal3 = Deal.new({'name' => "50p off", 'menu_item_id' => menu_item1.id , 'day_id' => day4.id, 'type' => '-', 'amount' => 0.50})
deal1.save()
deal2.save()
deal3.save()

binding.pry
nil