require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')

artist1 = Artist.new({
  "name" => "ACDC"
  })

artist2 = Artist.new({
  "name" => "Nirvana"
  })

artist1.save()
artist2.save()

album1 = Album.new({
  "album_title" => "Highway To Hell",
  "genre" => "Rock",
  "artist_id" => artist1.id
  })

album2 = Album.new({
  "album_title" => "Nevermind",
  "genre" => "Grunge",
  "artist_id" => artist2.id
  })

album1.save()
album2.save()





binding.pry
nil