
require_relative('../db/sql_runner.rb')
require_relative('./albums.rb')

class Artist

  attr_reader :id
  attr_accessor :artist_name

  def initialize(artist)
    @id = artist['id'].to_i if artist['id']
    @artist_name = artist['artist_name']
  end

  def save()
    sql = "INSERT INTO artists (artist_name)
    VALUES ($1) RETURNING id"
    values = [@artist_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def Artist.delete_all()

  sql = "DELETE FROM artists"
  SqlRunner.run(sql)

  end


  def self.all()

    sql = "SELECT * FROM artists"

    artists = SqlRunner.run(sql)
    return artists.map{|artist| Artist.new(artist)}
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return albums.map{|album| Album.new(album)}
  end

end
