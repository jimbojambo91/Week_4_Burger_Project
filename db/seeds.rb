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

burger1 = Burger.new({
  'name' => "Hamburger", 
  'image' => '/images/Burgers/hamburger.jpg', 
  'description' => "A hamburger is a sandwich consisting of a cooked patty of ground meat usually placed inside a sliced bread roll. Hamburgers are often served with lettuce, bacon, tomato, onion, pickles, cheese, and condiments such as mustard, mayonnaise, ketchup, and relish. There are many types of hamburgers with significant variations"})
burger2 = Burger.new({'name' => "Cheeseburger", 'image' => '/images/Burgers/Cheeseburger.jpg', 'description' => "A cheeseburger is a hamburger accompanied with melted cheese. The term itself is a portmanteau of the words ""cheese"" and ""hamburger."" The cheese is usually sliced, then added a short time before the hamburger finishes cooking to allow it to melt."})
burger3 = Burger.new({'name' => "Whopper", 'image' => '/images/Burgers/whopper.jpg', 'description' => "The Whopper is a hamburger, consisting of a flame grilled quarter-pound (113.4 g) beef patty, sesame seed bun, mayonnaise, lettuce, tomato, pickles, ketchup, and sliced onion. Optional ingredients such as American cheese, bacon, mustard, guacamole or jalapeño peppers may be added upon request."})
burger4 = Burger.new({'name' => "Big Mac", 'image' => '/images/Burgers/BigMac.jpg', 'description' => "The Big Mac consists of two 1.6 oz (45.4 g) 100 per cent beef patties, ""special sauce"" (a variant of Thousand Island dressing), iceberg lettuce, American cheese, pickles, and onions, served in a three-part sesame seed bun."})
burger5 = Burger.new({'name' => "Royale with cheese", 'image' => '/images/Burgers/royale.png', 'description' => "I know, baby, you''d dig it the most.. But you know what the funniest thing about Europe is? What? It''s the little differences. A lotta the same shit we got here, they got there, but there they''re a little different. Example? Alright, when you .... into a movie theatre in Amsterdam, you can buy beer. And I don''t mean in a paper cup either. They give you a glass of beer. And in Paris, you can buy beer at MacDonald''s. And you know what they call a Quarter Pounder with Cheese in Paris? They don''t call it a Quarter Pounder with Cheese? No, they got the metric system there, they wouldn''t know what the fuck a Quarter Pounder is. What''d they call it? They call it Royale with Cheese. Royale with Cheese. What''d they call a Big Mac? Big Mac''s a Big Mac, but they call it Le Big Mac."})
burger1.save()
burger2.save()
burger3.save()
burger4.save()
burger5.save()

eatery1 = Eatery.new({
  'name' => "McDonalds", 
  'image' => '/images/Eateries/mcdonalds.jpg', 
  'description' => "McDonald''s (or simply as McD) is an American hamburger and fast food restaurant chain. It was founded in 1940 as a barbecue restaurant operated by Richard and Maurice McDonald. In 1948, they reorganized their business as a hamburger stand, using production line principles." , 
  'address' => "137/138 Princes St, Edinburgh EH2 4BL"}) 
eatery2 = Eatery.new({
  'name' => "Burger King", 
  'image' => '/images/Eateries/burger_king.jpg', 
  'description' => 'Burger King (BK) is an American global chain of hamburger fast food restaurants. Headquartered in the unincorporated area of Miami-Dade County, Florida, the company was founded in 1953 as InstaBurger King, a Jacksonville, Florida-based restaurant chain.', 
  'address' => "Edinburgh Waverley, 18 North Bridge, Edinburgh EH1 1BB"}) 
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
deal2 = Deal.new({'name' => "BOGOF", 'menu_item_id' => menu_item3.id , 'day_id' => day1.id, 'type' => "Special"})
deal3 = Deal.new({'name' => "50p off", 'menu_item_id' => menu_item1.id , 'day_id' => day4.id, 'type' => "-", 'amount' => 0.50})
deal1.save()
deal2.save()
deal3.save()

binding.pry
nil