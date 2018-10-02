require_relative("../db/sql_runner")

class Exhibition

  attr_accessor :name, :category, :artist_id, :exhibition_info
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @category = options["category"]
    @artist_id = options["artist_id"].to_i
    @exhibition_info = options["exhibition_info"]
  end


  def save()
    sql = "INSERT INTO exhibitions(
    name, category, artist_id, exhibition_info
  )
  VALUES (
    $1, $2, $3, $4)
    RETURNING id"
    values = [@name, @category, @artist_id, @exhibition_info]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE exhibitions SET
    (name, category, artist_id, exhibition_info) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@name, @category, @artist_id, @exhibition_info, @id]
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

  def self.find_id(id)
    sql = "SELECT * FROM exhibitions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Exhibition.new(result)
  end

def self.find_by_category(category)
sql = "SELECT * FROM exhibitions WHERE category = $1"
values = [category]
result = SqlRunner.run(sql, values).first
return Exhibition.new(result)
end


  def delete()
    sql = "DELETE FROM exhibitions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end
end
