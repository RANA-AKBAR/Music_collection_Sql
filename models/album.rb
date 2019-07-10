require('pg')
require_relative('./album')
require_relative('./artist')

class Album

  attr_accessor :name, :artist_id
  attr_reader  :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @artist_id = options['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO ALBUM(name, artist_id) VALUES($1,$2) RETURNING id"
    values =[@name, @artist_id]
    @id =SqlRunner.run(sql,values)[0]['id']
  end


  def self.list_all
    sql ="SELECT * FROM album"
    albums = SqlRunner.run(sql)
    albums.map { |album| Album.new(album) }
  end


  def list_by_artist(id)
    sql = "SELECT * FROM ALBUM WHERE $1"
    values=['id']
    albums_by_artist = SqlRunner.run(sql, values)
    albums_by_artist.map { |album| Album.new(album) }
  end


end
