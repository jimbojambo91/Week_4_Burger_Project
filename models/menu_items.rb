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
      '#{ @burger_id }',#{ @eatery_id }, #{price}
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM menu_items"
    results = SqlRunner.run( sql )
    return results.map { |hash| MenuItem.new( hash ) }
  end

end