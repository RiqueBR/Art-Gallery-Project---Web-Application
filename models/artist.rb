require_relative('../db/sql_runner')

class Artist

  attr_accessor :first_name, :last_name, :artist_info
  attr_reader :id


  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @artist_info = options["artist_info"]
  end

  def save()
    sql = "INSERT INTO artists (
    first_name, last_name, artist_info
  )
  VALUES (
    $1, $2, $3
    ) RETURNING id"
    values = [@first_name, @last_name, @artist_info]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE artists SET
    (first_name, last_name, artist_info) = ($1, $2, $3)
    WHERE id = $4"
    values = [@first_name, @last_name, @artist_info, @id]
    SqlRunner.run(sql, values)
  end

  def exhibitions
    sql = "SELECT * FROM exhibitions WHERE exhibitions.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first
    return Exhibition.new(result)
  end



  def self.find_all()
    sql = "SELECT * FROM artists"
    results = SqlRunner.run(sql)
    return results.map { |artist_hash| Artist.new(artist_hash) }
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.find_id(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Artist.new(result)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end
end
