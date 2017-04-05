require_relative( '../db/sql_runner' )

class Burger

  attr_reader(:id, :name, :image, :description)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @image = options['image']
    @description = options['description']
  end

  def save()
    sql = "INSERT INTO burgers (
      name, image, description
    ) VALUES (
      '#{ @name }', '#{ @image }', '#{ @description }'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def eateries()
    sql = "SELECT e.* FROM eateries e
      INNER JOIN menu_items m
      ON e.id = m.eatery_id WHERE burger_id = #{id}"
     eateries = Eatery.map_items(sql)
     return eateries
  end

  def menu_items
    sql = "SELECT m.* FROM menu_items m WHERE burger_id = #{id}"
    menu_items = MenuItem.map_items(sql)
    return menu_items
  end

  def delete
    sql = "DELETE FROM burgers WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    burgers = SqlRunner.run(sql)
    result = burgers.map { |burger| Burger.new(burger)}
    return result
  end

  def self.all()
    sql = "SELECT * FROM burgers ORDER BY id, name"
    results = SqlRunner.run( sql )
    return results.map { |burger| Burger.new( burger) }
  end

  def self.find( id )
    sql = "SELECT * FROM burgers WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Burger.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM burgers"
    SqlRunner.run( sql )
  end

end