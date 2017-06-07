require('pg')
require_relative('../db/sql_runner')
require_relative('album')

class Artist
  attr_reader :id
  attr_accessor :name

def initialize(options)
  @id = options['id'].to_i() #if options["id"]
  @name = options['name']
end

def save
  sql = "INSERT INTO artists(name) 
  VALUES ('#{@name}') RETURNING id;"
  @id = SqlRunner.run(sql)[0]["id"].to_i()
end

def Artist.all()
  sql = "SELECT * FROM artists;"
  results = SqlRunner.run(sql)
  return results.map { |artist| Artist.new(artist) }
end

def find_albums() 
  sql = "SELECT * FROM albums WHERE artist_id = #{id};"
  results = SqlRunner.run(sql)
  albums = results.map { |album| Album.new(album)}
  return albums
end

def edit_artist()
  sql = "UPDATE artists SET name = 'Muse' WHERE id = #{id};"
  results = SqlRunner.run(sql)
  new_artist = results.each { |artist| Artist.new(artist)}
  return new_artist
end

















end