require_relative("../db/sql_runner")

class Exhibition

  attr_reader :name, :category, :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @category = options["category"]
  end


end
