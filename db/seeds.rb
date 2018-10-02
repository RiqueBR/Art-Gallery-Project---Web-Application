require_relative("../models/artist")
require_relative("../models/exhibition")
require("pry-byebug")

Exhibition.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "first_name" => "Fiona",
  "last_name" => "Arnott",
  "artist_info" => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  "artist_img" => "/images/dog9.jpg"
  })

  artist1.save()

  artist2 = Artist.new({
    "first_name" => "Henrique",
    "last_name" => "Batista",
    "artist_info" => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    "artist_img" => "/images/dog10.jpg"
    })

    artist2.save()



    exhibition1 = Exhibition.new({
      "name" => "Drawings of My Glasgow",
      "category" => "Artistic Drawing",
      "artist_id" => artist1.id,
      "exhibition_info" => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "exhibit_img" => "/images/dog1.jpg"
      })

      exhibition1.save()

      exhibition2 = Exhibition.new({
        "name" => "Idas e Vindas Fotográficas",
        "category" => "Photography",
        "artist_id" => artist2.id,
        "exhibition_info" => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "exhibit_img" => "/images/dog5.jpg"
        })

        exhibition2.save()


        binding.pry
        nil
