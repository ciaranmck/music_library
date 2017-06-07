require('pg')
require_relative('../db/sql_runner')
require_relative('artist')

class Album

  def initialize(options)
    @id = options['id'].to_i()if options['id']
    @album_title = options['album_title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i()
  end

  def save
    sql = "INSERT INTO albums
    (album_title, genre, artist_id)
    VALUES ( 
    '#{@album_title}', '#{@genre}', #{@artist_id}
    ) 
    RETURNING id;"
    @id = SqlRunner.run(sql)[0]["id"].to_i()
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    results = SqlRunner.run(sql)
    return results.map { |album| Album.new(album)  }
  end

end