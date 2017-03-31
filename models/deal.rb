require_relative( '../db/sql_runner' )

class Deal

  attr_reader 

  def initialize
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