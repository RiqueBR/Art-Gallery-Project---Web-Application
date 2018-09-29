require_relative('../db/sql_runner')

class Artist

  attr_reader :first_name, :last_name, :id


  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
  end

  def save()
    sql = "INSERT INTO artists (
    first_name, last_name
  )
  VALUES (
    $1, $2
    ) RETURNING id"
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end
end
