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

days = [day1, day2, day3, day4, day5, day6, day7]

for day in days do
  day.save()
end

burger1 = Burger.new({
  'name' => "Hamburger", 
  'image' => '/images/Burgers/hamburger.jpg', 
  'description' => "A hamburger is a sandwich consisting of a cooked patty of ground meat usually placed inside a sliced bread roll. Hamburgers are often served with lettuce, bacon, tomato, onion, pickles, cheese, and condiments such as mustard, mayonnaise, ketchup, and relish. There are many types of hamburgers with significant variations"})
burger2 = Burger.new({'name' => "Cheeseburger", 'image' => '/images/Burgers/Cheeseburger.jpg', 'description' => "A cheeseburger is a hamburger accompanied with melted cheese. The term itself is a portmanteau of the words ""cheese"" and ""hamburger."" The cheese is usually sliced, then added a short time before the hamburger finishes cooking to allow it to melt."})

# McDonalds burgers

burger3 = Burger.new({'name' => "Big Mac", 'image' => '/images/Burgers/Big_Mac.png', 'description' => "The Big Mac consists of two 1.6 oz (45.4 g) 100 per cent beef patties, ""special sauce"" (a variant of Thousand Island dressing), iceberg lettuce, American cheese, pickles, and onions, served in a three-part sesame seed bun."})
burger4 = Burger.new({
  'name' => "Chicken Legend", 
  'image' => '/images/Burgers/chicken_legend.png', 
  'description' => "Succulent chicken breast fillet in a crispy coating with lettuce and Cool Mayo in a warm, toasted bakehouse roll."})
burger5 = Burger.new({
  'name' => "Big Tasty", 
  'image' => '/images/Burgers/Big_Tasty.png', 
  'description' => "Take a big bite into 100% beef, with cheese slices made from delicious Emmental, slices of tomato, lettuce, onion and Big Tasty sauce."})

# Burger King burgers

burger6 = Burger.new({'name' => "Whopper", 'image' => '/images/Burgers/Whopper.png', 'description' => "The Whopper is a hamburger, consisting of a flame grilled quarter-pound (113.4 g) beef patty, sesame seed bun, mayonnaise, lettuce, tomato, pickles, ketchup, and sliced onion. Optional ingredients such as American cheese, bacon, mustard, guacamole or jalapeño peppers may be added upon request."})

burger7 = Burger.new({'name' => "Bacon Double Cheese", 'image' => '/images/Burgers/Bacon_Double_Cheese.png', 'description' => "Two signature flame-grilled beef patties topped with smoked bacon and two layers of melted American cheese on a toasted sesame seed bun."})

burger8 = Burger.new({'name' => "Bacon Double Cheese XL", 'image' => '/images/Burgers/Bacon_Double_Cheese_XL.png', 'description' => "Two signature fire-grilled beef patties topped with savoury smoked bacon and melted American cheese, all in our toasted sesame seed bun."})

# Byron Burgers

burger9 = Burger.new({'name' => "Byron", 'image' => '/images/Burgers/Byron.svg', 'description' => "Dry cure bacon, mature cheddar, shredded iceberg, tomato, red onion and byron sauce."})

burger10 = Burger.new({'name' => "Chilli",'image' => '/images/Burgers/Byron.svg', 'description' => "Green Chilli, American Cheese, shredded iceberg and chipotle mayonnaise."})

burger11 = Burger.new({'name' => "B-Rex",'image' => '/images/Burgers/Byron.svg', 'description' => "Onion ring, Streaky Bacon, crispy onions, shredded iceberg, pickles and smoked chilli BBQ sauce."})

burger12 = Burger.new({'name' => "Kimcheese",'image' => '/images/Burgers/Byron.svg', 'description' => "Korean BBQ glaze, bacon, Freddar cheese, crispy onions, kimchi cucumbers, Gochuchang sauce and Ssamjang mayonnaise"})

# Bread Meats Bread Burgers

burger13 = Burger.new({'name' => "Sunshine on Beef",'image' => '/images/Burgers/sunshine_on_beef.jpg', 'description' => "With American cheese, BBQ beef brisket, crispy fried onions, spicy beefy mayo and pickles"})

burger14 = Burger.new({'name' => "Lothian Wolf",'image' => '/images/Burgers/lothian_wolf.jpg', 'description' => "Our Signature Burger! With American cheese, Crispy Bacon, Pulled Pork in BBQ sauce, crispy fried onions and ''Nduja with Sriracha Mayo"})

burger15 = Burger.new({'name' => "Black N Blue",'image' => '/images/Burgers/black_n_blue.jpg', 'description' => "With Blue cheese, crispy bacon, slow onions, sautéed mushrooms and Blue Cheese Mayo"})

burger16 = Burger.new({'name' => "Fear & Lothian Burger",'image' => '/images/Burgers/fear_lothian.jpg', 'description' => "Two thin & smashed Burger patties with chillies & onions, American cheese, jalapeños, fiery mustard and Harissa mayo"})

burger17 = Burger.new({'name' => "Luther Burger",'image' => '/images/Burgers/luther_burger.jpg', 'description' => "A Must Try! Double smashed burger with American cheese, candied bacon, spicy beefy mayo and crispy fried onions inside a grilled glazed ring Donut."})

burger18 = Burger.new({'name' => "Lambhurgini",'image' => '/images/Burgers/bread-meats-bread-logo.png', 'description' => "Smashed beef burger topped with slow roasted & pulled BBQ lamb, pomegranate molasses, tangy peppadews, cucumber & feta salad and Harissa mayo"})

# GBK Burgers

burger19 = Burger.new({'name' => "Bourbon Street",'image' => '/images/Burgers/bourbon_street.jpg', 'description' => "Mustard grilled beef, jalapenos, mature Cheddar, bourbon glazed mushrooms, sriracha mayo, salad."})

burger20 = Burger.new({'name' => "Major Tom",'image' => '/images/Burgers/Major_Tom.jpg', 'description' => "30 day dry-aged steak patty, blue cheese slaw, crispy bacon, Red Leicester cheese, beef ketchup, dill pickle."})

burger21 = Burger.new({'name' => "The Stack",'image' => '/images/Burgers/The_Stack.jpg', 'description' => "Grilled chorizo, Red Leicester cheese, house onion ring, smoked chilli mayo, rocket, pickled onions, house relish."})

burger22 = Burger.new({'name' => "The Mighty",'image' => '/images/Burgers/The_Mighty.jpg', 'description' => "Two 6oz patties, mature Cheddar, crispy bacon, garlic mayo, relish, dill pickle"})

burger23 = Burger.new({'name' => "Avocado Bacon",'image' => '/images/Burgers/avocado_bacon.jpg', 'description' => "Avocado, crispy bacon, house mayo, relish"})

burger24 = Burger.new({'name' => "The Taxi Driver",'image' => '/images/Burgers/taxi_driver.jpg', 'description' => "American cheese, house onion ring, Cajun relish, smoked chilli mayo, dill pickle, salad."})

burger25 = Burger.new({'name' => "Bruce Leek",'image' => '/images/Burgers/Bruce_Leek.jpg', 'description' => "Mature Cheddar, crispy bacon, truffled leeks, Cajun relish, sriracha mayo, jalapenos"})

burger26 = Burger.new({'name' => "The Kiwiburger",'image' => '/images/Burgers/Kiwiburger.jpg', 'description' => "A GBK trademark since 2001. Beetroot, fried free-range egg, pineapple, mature Cheddar, house mayo, relish, salad."})

burger27 = Burger.new({'name' => "Habanero",'image' => '/images/Burgers/Habanero.jpg', 'description' => "Mozzarella, habanero jam, house mayo, salad"})

burger28 = Burger.new({'name' => "Blue Cheese",'image' => '/images/Burgers/Blue_Cheese.jpg', 'description' => "Onion jam, Cajun relish, house mayo, salad."})


burger  = Burger.new({'name' => "Royale with cheese", 'image' => '/images/Burgers/royale.png', 'description' => "I know, baby, you''d dig it the most.. But you know what the funniest thing about Europe is? What? It''s the little differences. A lotta the same shit we got here, they got there, but there they''re a little different. Example? Alright, when you .... into a movie theatre in Amsterdam, you can buy beer. And I don''t mean in a paper cup either. They give you a glass of beer. And in Paris, you can buy beer at MacDonald''s. And you know what they call a Quarter Pounder with Cheese in Paris? They don''t call it a Quarter Pounder with Cheese? No, they got the metric system there, they wouldn''t know what the fuck a Quarter Pounder is. What''d they call it? They call it Royale with Cheese. Royale with Cheese. What''d they call a Big Mac? Big Mac''s a Big Mac, but they call it Le Big Mac."})


burgers = [burger1, burger2, burger3, burger4, burger5, burger6, burger7, burger8, burger9, burger10, burger11, burger12, burger13, burger14, burger15, burger16, burger17, burger18, burger19, burger20, burger21, burger22, burger23, burger24, burger25, burger26, burger27, burger28]

for burger in burgers do
  burger.save()
end

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
eatery3 = Eatery.new({
  'name' => "Byron Burger", 
  'image' => '/images/Eateries/Byron.jpg', 
  'description' => 'We started Byron back in 2007 with a simple mission: to do one thing, and do it properly. We serve simple, delicious hamburgers, made fresh from properly-sourced British beef and the best ingredients possible, paired with a cold craft beer or an extra-thick shake.', 
  'address' => "113-117 Lothian Road, Edinburgh, EH3 9AN"}) 
eatery4 = Eatery.new({
  'name' => "Bread Meats Bread", 
  'image' => '/images/Eateries/Bread_Meats_Bread.jpg', 
  'description' => 'Current winner of Scotland’s Best Burger of 2016. We offer quality, fresh food, that’s made in-house, using only the best local ingredients. Our food portions are very generous so pop round for a meal and you will not leave hungry. We are a family owned business where everyone is welcome and we will treat you as our house guest. No bookings, no frills, no gimmicks, just a lot of honest & generous portions of quality food, freshly made in-house.', 
  'address' => "92 Lothian Rd, Edinburgh EH3 9BE"}) 
eatery5 = Eatery.new({
  'name' => "Gourmet Burger Kitchen", 
  'image' => '/images/Eateries/GBK.jpg', 
  'description' => 'Back in 2001, three Kiwi guys including world-renowned chef Peter Gordon set up the first Gourmet Burger Kitchen in Battersea, South London, changing the UK burger scene forever. Now with over 80 restaurants across the UK, we still pride ourselves on serving up a variety of handcrafted burgers, combining 100% prime beef with the freshest ingredients and burger sauces made from scratch, every day, in each GBK kitchen.', 
  'address' => "137 George St, Edinburgh EH2 4JY"}) 

eateries = [eatery1, eatery2, eatery3, eatery4, eatery5]

for eatery in eateries do
  eatery.save()
end

# McDonalds Menu
menu_item1 = MenuItem.new({
  'burger_id' => burger1.id,
  'eatery_id' => eatery1.id,
  'price' => 0.89
  })

menu_item2 = MenuItem.new({
  'burger_id' => burger2.id,
  'eatery_id' => eatery1.id,
  'price' => 0.99
  })

menu_item3 = MenuItem.new({
  'burger_id' => burger3.id,
  'eatery_id' => eatery1.id,
  'price' => 2.99
  })

menu_item4 = MenuItem.new({
  'burger_id' => burger4.id,
  'eatery_id' => eatery1.id,
  'price' => 3.59
  })

menu_item5 = MenuItem.new({
  'burger_id' => burger5.id,
  'eatery_id' => eatery1.id,
  'price' => 4.09
  })

# Burger King Menu

menu_item6 = MenuItem.new({
  'burger_id' => burger1.id,
  'eatery_id' => eatery2.id,
  'price' => 0.99
  })

menu_item7 = MenuItem.new({
  'burger_id' => burger2.id,
  'eatery_id' => eatery2.id,
  'price' => 0.99
  })

menu_item8 = MenuItem.new({
  'burger_id' => burger6.id,
  'eatery_id' => eatery2.id,
  'price' => 4.19
  })

menu_item9 = MenuItem.new({
  'burger_id' => burger7.id,
  'eatery_id' => eatery2.id,
  'price' => 4.19
  })

menu_item10 = MenuItem.new({
  'burger_id' => burger8.id,
  'eatery_id' => eatery2.id,
  'price' => 5.19
  })

# Byron Menu

menu_item11 = MenuItem.new({
  'burger_id' => burger9.id,
  'eatery_id' => eatery3.id,
  'price' => 9.50
  })

menu_item12 = MenuItem.new({
  'burger_id' => burger1.id,
  'eatery_id' => eatery3.id,
  'price' => 7.00
  })

menu_item13 = MenuItem.new({
  'burger_id' => burger2.id,
  'eatery_id' => eatery3.id,
  'price' => 8.00
  })

menu_item14 = MenuItem.new({
  'burger_id' => burger10.id,
  'eatery_id' => eatery3.id,
  'price' => 9.00
  })

menu_item15 = MenuItem.new({
  'burger_id' => burger11.id,
  'eatery_id' => eatery3.id,
  'price' => 10.50
  })

menu_item16 = MenuItem.new({
  'burger_id' => burger12.id,
  'eatery_id' => eatery3.id,
  'price' => 11.00
  })

# BreatMeatsBread Menu

menu_item17 = MenuItem.new({
  'burger_id' => burger1.id,
  'eatery_id' => eatery4.id,
  'price' => 6.50
  })

menu_item18 = MenuItem.new({
  'burger_id' => burger2.id,
  'eatery_id' => eatery4.id,
  'price' => 7.00
  })

menu_item19 = MenuItem.new({
  'burger_id' => burger13.id,
  'eatery_id' => eatery4.id,
  'price' => 9.00
  })

menu_item20 = MenuItem.new({
  'burger_id' => burger14.id,
  'eatery_id' => eatery4.id,
  'price' => 10.00
  })

menu_item21 = MenuItem.new({
  'burger_id' => burger15.id,
  'eatery_id' => eatery4.id,
  'price' => 8.50
  })

menu_item22 = MenuItem.new({
  'burger_id' => burger16.id,
  'eatery_id' => eatery4.id,
  'price' => 7.00
  })

# GBK Menu

menu_item23 = MenuItem.new({
  'burger_id' => burger1.id,
  'eatery_id' => eatery5.id,
  'price' => 6.95
  })

menu_item24 = MenuItem.new({
  'burger_id' => burger2.id,
  'eatery_id' => eatery5.id,
  'price' => 8.15
  })

menu_item25 = MenuItem.new({
  'burger_id' => burger19.id,
  'eatery_id' => eatery5.id,
  'price' => 8.95
  })

menu_item26 = MenuItem.new({
  'burger_id' => burger20.id,
  'eatery_id' => eatery5.id,
  'price' => 10.95
  })

menu_item27 = MenuItem.new({
  'burger_id' => burger21.id,
  'eatery_id' => eatery5.id,
  'price' => 10.95
  })

menu_item28 = MenuItem.new({
  'burger_id' => burger22.id,
  'eatery_id' => eatery5.id,
  'price' => 12.60
  })

menu_item29 = MenuItem.new({
  'burger_id' => burger23.id,
  'eatery_id' => eatery5.id,
  'price' => 9.85
  })

menu_item30 = MenuItem.new({
  'burger_id' => burger24.id,
  'eatery_id' => eatery5.id,
  'price' => 9.95
  })

menu_item31 = MenuItem.new({
  'burger_id' => burger25.id,
  'eatery_id' => eatery5.id,
  'price' => 9.95
  })

menu_item32 = MenuItem.new({
  'burger_id' => burger26.id,
  'eatery_id' => eatery5.id,
  'price' => 9.85
  })

menu_item33 = MenuItem.new({
  'burger_id' => burger27.id,
  'eatery_id' => eatery5.id,
  'price' => 8.95
  })

menu_item34 = MenuItem.new({
  'burger_id' => burger28.id,
  'eatery_id' => eatery5.id,
  'price' => 8.15
  })

menu_items = [menu_item1, menu_item2, menu_item3, menu_item4, menu_item5, menu_item6, menu_item7, menu_item8,
menu_item9, menu_item10, menu_item11, menu_item12, menu_item13, menu_item14, menu_item15, menu_item16, menu_item17, menu_item18,
menu_item19, menu_item20, menu_item21, menu_item22, menu_item23, menu_item24, menu_item25, menu_item26, menu_item27, menu_item28,
menu_item29, menu_item30, menu_item31, menu_item32, menu_item33, menu_item34]

for menu_item in menu_items do
  menu_item.save()
end

deal1 = Deal.new({'name' => "50% off", 'menu_item_id' => menu_item14.id , 'day_id' => day3.id, 'type' => "*", 'amount' => 0.5})
deal2 = Deal.new({'name' => "BOGOF", 'menu_item_id' => menu_item21.id , 'day_id' => day1.id, 'type' => "Special"})
deal3 = Deal.new({'name' => "50p off", 'menu_item_id' => menu_item11.id , 'day_id' => day4.id, 'type' => "-", 'amount' => 0.50})
deal4 = Deal.new({'name' => "£1 off", 'menu_item_id' => menu_item17.id , 'day_id' => day3.id, 'type' => "-", 'amount' => 1.0})
deal5 = Deal.new({'name' => "25% off", 'menu_item_id' => menu_item15.id , 'day_id' => day7.id, 'type' => "*", 'amount' => 0.70})
deal6 = Deal.new({'name' => "£5 off", 'menu_item_id' => menu_item34.id , 'day_id' => day6.id, 'type' => "-", 'amount' => 5.00})
deal7 = Deal.new({'name' => "90% off!", 'menu_item_id' => menu_item26.id , 'day_id' => day2.id, 'type' => "*", 'amount' => 0.10})
deal8 = Deal.new({'name' => "50% off", 'menu_item_id' => menu_item22.id , 'day_id' => day2.id, 'type' => "*", 'amount' => 0.50})
deal9 = Deal.new({'name' => "£1.50 off", 'menu_item_id' => menu_item30.id , 'day_id' => day5.id, 'type' => "-", 'amount' => 1.50})
deal10 = Deal.new({'name' => "10% off", 'menu_item_id' => menu_item25.id , 'day_id' => day5.id, 'type' => "*", 'amount' => 0.90})

deals = [deal1, deal2, deal3, deal4, deal5, deal6, deal7, deal8, deal9, deal10]

for deal in deals do
  deal.save()
end