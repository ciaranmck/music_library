require('pg')
require_relative('../db/sql_runner')
require_relative('album')

class Artist
  attr_reader :id
  attr_accessor :name

def initialize(options)
  @id = options['id'].to_i()
  @name = options['name']
end

def save
  sql = "INSERT INTO artists(name) 
  VALUES ('#{@name}') RETURNING id"
  @id = SqlRunner.run(sql)[0]["id"].to_i()
end

end