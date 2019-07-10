require('pg')
require_relative('./artist')

class Artist

  attr_accessor :name
  attr_reader  :id

  def initalize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end


end
