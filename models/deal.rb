require_relative( '../db/sql_runner' )

class Deal

  attr_reader :id, :name, :menu_item_id, :day_id

  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
    @menu_item_id = options['menu_item_id']
    @day_id = options['day_id']
  end

  def save()
    sql = "INSERT INTO deals (
      name, menu_item_id, day_id
    ) VALUES (
      '#{ @name }',#{ @menu_item_id }, #{@day_id}
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def eatery()
    sql = "SELECT e.* FROM eateries e
      INNER JOIN menu_items m
      ON e.id = m.eatery_id
      WHERE m.id = #{@menu_item_id}"
     eateries = Eatery.map_items(sql)
     return eateries
  end

  def burger()
    sql = "SELECT b.* FROM burgers b
      INNER JOIN menu_items m
      ON b.id = m.burger_id
      WHERE m.id = #{@menu_item_id}"
     eateries = Eatery.map_items(sql)
     return eateries
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