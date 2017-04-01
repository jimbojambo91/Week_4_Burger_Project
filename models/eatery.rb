require_relative( '../db/sql_runner' )

class Eatery

  attr_reader(:id, :name, :image)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @image = options['image']
  end

  def save()
    sql = "INSERT INTO eateries (
      name, image
    ) VALUES (
      '#{ @name }', '#{image}'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def burgers()
    sql = "SELECT b.* FROM burgers b
      INNER JOIN menu_items m
      ON b.id = m.burger_id WHERE eatery_id = #{id}"
     burgers = Eatery.map_items(sql)
     return burgers
  end

  def self.map_items(sql)
    eateries = SqlRunner.run(sql)
    result = eateries.map { |eatery| Eatery.new(eatery)}
    return result
  end

  def self.all()
    sql = "SELECT * FROM eateries"
    results = SqlRunner.run( sql )
    return results.map { |eatery| Eatery.new( eatery) }
  end

  def self.find( id )
    sql = "SELECT * FROM eateries WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Eatery.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM eateries"
    SqlRunner.run( sql )
  end

end