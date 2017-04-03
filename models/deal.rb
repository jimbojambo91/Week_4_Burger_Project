require_relative( '../db/sql_runner' )

class Deal

  attr_reader :id, :name, :menu_item_id, :day_id, :type, :amount

  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
    @menu_item_id = options['menu_item_id']
    @day_id = options['day_id']
    @type = options['type']
    @amount = options['amount'].to_f
  end

  def save()
    sql = "INSERT INTO deals (
      name, menu_item_id, day_id, type, amount
    ) VALUES (
      '#{ @name }', #{ @menu_item_id }, #{@day_id}, '#{@type}', #{@amount} 
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
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
      INNER JOIN deals d
      ON m.id = d.menu_item_id
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
    when '*'
      deal_price = original_price * self.amount
    when '-'
      deal_price = original_price - self.amount
    when 'Special'
      if self.name == "BOGOF"
        deal_price = original_price / 2
      else
        return self.name
      end
    end
    return deal_price
  end

  def self.map_items(sql)
    deals = SqlRunner.run(sql)
    result = deals.map { |deal| Deal.new(deal)}
    return result
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