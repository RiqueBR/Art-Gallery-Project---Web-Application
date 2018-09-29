require_relative("../db/sql_runner")

class Exhibition

  attr_accessor :name, :category
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @category = options["category"]
    @artist_id = options["artist_id"].to_i
  end


  def save()
    sql = "INSERT INTO exhibitions(
    name, category, artist_id
  )
  VALUES (
    $1, $2, $3)
    RETURNING id"
    values = [@name, @category, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE exhibitions SET
    (name, category, artist_id) = ($1, $2, $3)
    WHERE id = $4"
    values = [@name, @category, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values).first
    return Artist.new(results)
  end



  def self.find_all()
    sql = "SELECT * FROM exhibitions"
    results = SqlRunner.run(sql)
    return results.map { |exhibition_hash| Exhibition.new(exhibition_hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM exhibitions"
    SqlRunner.run(sql)
  end

  def self.find_id()
    sql = "SELECT * FROM exhibitions WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Exhibition.new(results.first())
  end

  def self.delete(id)
    sql = "DELETE FROM exhibitions WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end
end
