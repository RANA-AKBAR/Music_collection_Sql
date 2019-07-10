require('pg')
require_relative('./album')

class Album

  attr_accessor :name
  attr_reader  :id

  def initalize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
    @artis_id = options['artist_id'].to_i
  end

  def save


  end


end
