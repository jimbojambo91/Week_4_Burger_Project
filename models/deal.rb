require_relative( '../db/sql_runner' )
require_relative('menu_items')
require('pry-byebug')

class Deal

  attr_reader :id, :name, :menu_item_id, :day_id, :type, :amount, :price, :percentage_saving

  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
    @menu_item_id = options['menu_item_id']
    @day_id = options['day_id']
    @type = options['type']
    @amount = options['amount'].to_f
    @price = nil || options['price'].to_f
    @percentage_saving = nil || options['percentage_saving'].to_f
  end

  def save()
    @price = calculate_deal_price
    @percentage_saving = calculate_deal_saving_percentage

    sql = "INSERT INTO deals (
      name, menu_item_id, day_id, type, amount, price, percentage_saving
    ) VALUES (
      '#{ @name }', #{ @menu_item_id }, #{@day_id}, '#{@type}', #{@amount}, #{@price}, #{@percentage_saving}
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE deals SET
      name = '#{ @name }',
      menu_item_id = #{ @menu_item_id },
      day_id = #{ @day_id.to_i },
      type = '#{@type}',
      amount = #{amount}
      WHERE id = #{ @id }"
    SqlRunner.run( sql )
  end

  def eatery()
    sql = "SELECT e.* FROM eateries e
      INNER JOIN menu_items m
      ON e.id = m.eatery_id
      WHERE m.id = #{@menu_item_id}"
     eateries = Eatery.map_items(sql).first
     return eateries
  end

  def burger()
    sql = "SELECT b.* FROM burgers b
      INNER JOIN menu_items m
      ON b.id = m.burger_id
      WHERE m.id = #{@menu_item_id}"
     burgers = Burger.map_items(sql).first
     return burgers
  end

  def menu_item()
    sql = "SELECT m.* FROM menu_items m
      WHERE m.id = #{@menu_item_id}"
     menu_item = MenuItem.map_items(sql).first
     return menu_item
  end

  def day
    sql = "SELECT d.* FROM days d
      INNER JOIN deals de
      ON d.id = de.day_id
      WHERE d.id = #{@day_id}"
      day = Day.map_items(sql).first
      return day
  end

  def calculate_deal_price
    original_price = self.menu_item.price

    case self.type
    when "*"
      deal_price = (original_price * self.amount.to_f).round(2)
      return deal_price
    when "-"
      deal_price = (original_price - self.amount.to_f).round(2)
      return deal_price
    when "Special"
      if self.name == "BOGOF"
        deal_price = original_price / 2
        return deal_price
      else
        puts self.name
      end
    end
  end

  def calculate_deal_saving
    original_price = self.menu_item.price
    deal_price = self.calculate_deal_price
    deal_saving = (original_price - deal_price).round(2)
    return deal_saving
  end

  def calculate_deal_saving_percentage
    original_price = self.menu_item.price
    deal_price = self.calculate_deal_price
    deal_saving_percentage =  ((deal_price / original_price)*100).to_i
    deal_saving_percentage = 100 - deal_saving_percentage
    return deal_saving_percentage
  end

  def self.biggest_saving(day)
    sql = "SELECT * FROM DEALS WHERE day_id = #{day}
           ORDER BY 
           percentage_saving DESC,
           price DESC
           limit 1"
    result = SqlRunner.run( sql )
    return Deal.new( result.first )
  end

  def self.cheapest_burger(day)
    sql = "SELECT * FROM DEALS WHERE day_id = #{day}
           ORDER BY 
           price ASC
           limit 1"
    result = SqlRunner.run( sql )
    return Deal.new( result.first )
  end

  def delete
    sql = "DELETE FROM deals WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    deals = SqlRunner.run(sql)
    result = deals.map { |deal| Deal.new(deal)}
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM deals WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Deal.new( results.first )
  end

  def self.find_by_day( day )
    sql = "SELECT * FROM deals WHERE day_id = #{day}"
    deals = Deal.map_items(sql)
    return deals
  end

  def self.all()
    sql = "SELECT * FROM deals"
    results = SqlRunner.run( sql )
    return results.map { |hash| Deal.new( hash ) }
  end

  def self.delete_all
    sql = "DELETE FROM deals"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM deals where id = #{id}"
    SqlRunner.run( sql )
  end

end