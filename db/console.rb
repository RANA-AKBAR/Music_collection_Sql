require_relative('../models/artist')
require_relative('../models/album')
require_relative('./sql_runner')
require('pry')





  Artist.delete_all

  jackson = Artist.new({
    'name' => 'Jackson'
    })
  jackson.save

  paul = Artist.new({
    'name' => 'paul'
    })
  jackson.save
  paul.save

 colors = Album.new({'name' => 'ducks',
  'artist_id' => paul.id})
 colors = Album.new({'name' => 'ducks2',
  'artist_id' => jackson.id})

  colors.save

Artist.list_all
# Artist.list_all.each { |artist| puts artist.name }
Album.list_all

Album.list_by_artist(jackson.id)
  binding.pry
  nil
