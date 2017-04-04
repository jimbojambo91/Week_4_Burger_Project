require_relative( '../db/sql_runner' )

class MenuItem

  attr_reader( :burger_id, :eatery_id, :id, :price )

  def initialize( options )
    @id = nil || options['id'].to_i
    @burger_id = options['burger_id']
    @eatery_id = options['eatery_id']
    @price = options['price'].to_f
  end

  def save()
    sql = "INSERT INTO menu_items (
      burger_id, eatery_id, price
    ) VALUES (
      '#{ @burger_id }',#{ @eatery_id }, #{@price}
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def delete
    sql = "DELETE FROM menu_items WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def eatery()
    sql = "SELECT e.* FROM eateries e
      INNER JOIN menu_items m
      ON e.id = m.eatery_id
      WHERE m.id = #{@id}"
     eatery = Eatery.map_items(sql).first
     return eatery
  end

  def burger()
    sql = "SELECT b.* FROM burgers b
      INNER JOIN menu_items m
      ON b.id = m.burger_id
      WHERE m.id = #{@id}"
     burger = Burger.map_items(sql).first
     return burger
  end

  def self.all()
    sql = "SELECT * FROM menu_items"
    results = SqlRunner.run( sql )
    return results.map { |hash| MenuItem.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM menu_items WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return MenuItem.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM menu_items"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM menu_items where id = #{id}"
    SqlRunner.run( sql )
  end

  def self.map_items(sql)
    menu_items = SqlRunner.run(sql)
    result = menu_items.map { |menu_item| MenuItem.new(menu_item)}
    return result
  end

end