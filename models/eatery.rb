require_relative( '../db/sql_runner' )

class Eatery

  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO eateries (
      name
    ) VALUES (
      '#{ @name }'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
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