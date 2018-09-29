require_relative("../models/artist")
require_relative("../models/exhibition")
require("pry-byebug")

# Exhibition.delete_all()
# Artist.delete_all()

artist1 = Artist.new({
  "first_name" => "Fiona",
  "last_name" => "Arnott"
  })

  artist1.save()

  artist2 = Artist.new({
    "first_name" => "Henrique",
    "last_name" => "Batista"
    })

    artist2.save()

    exhibition1 = Exhibition.new({
      "name" => "Drawings of My Glasgow",
      "category" => "Artistic Drawing",
      "artist_id" => artist1.id
      })

      exhibition1.save()

      exhibition2 = Exhibition.new({
        "name" => "Idas e Vindas Fotográficas",
        "category" => "Photography",
        "artist_id" => artist2.id
        })

        exhibition2.save()

        binding.pry
        nil
