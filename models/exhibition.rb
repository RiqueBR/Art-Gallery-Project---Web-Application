require_relative("../db/sql_runner")

class Exhibition

  attr_reader :name, :category, :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @category = options["category"]
  end


  def save()
    sql = "INSERT INTO exhibitions(
    name, category
  )
  VALUES (
    $1, $2
  )
  RETURNING id"
  values = [@name, @category]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end
end
