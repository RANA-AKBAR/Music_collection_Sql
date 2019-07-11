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





  def list_artist()
    sql = "SELECT * FROM artist
    WHERE id = $1"
    values=[@artist_id]
    artist_of_album = SqlRunner.run(sql, values)
    result =Artist.new(artist_of_album)}
  end




  def delete()
    sql = "DELETE
    FROM album
    WHERE id =$1"
    values=[@id]
    SqlRunner.run(sql, values)
  end


  def update()
    sql "UPDATE album SET (name, artist_id) VALUES = $1"
    values =[$1,2]
    SqlRunner(sql, values)
  end


  def self.list_all_by_artist(id)
    sql = "SELECT * FROM album
    WHERE artist_id = $1"
    values =[id]
    albums = SqlRunner.run(sql, values)
    albums.map { |album| Album.new(album)  }
  end


  def self.delete_all
    sql = "DELETE FROM album"
    SqlRunner.run(sql)
  end

end

def self.list_all
  sql ="SELECT * FROM album"
  albums = SqlRunner.run(sql)
  albums.map { |album| Album.new(album) }
end
