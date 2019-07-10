require_relative('../models/artist')
require_relative('./sql_runner')
require('pry')





  Artist.delete_all

  jackson = Artist.new({
    'name' => 'Jackson'
    })
  jackson.save

  # jackson.delete



  binding.pry
  nil
