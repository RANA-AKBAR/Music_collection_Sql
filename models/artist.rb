require('pg')
require_relative('./artist')
require_relative('../db/sql_runner')

class Artist

  attr_accessor :name
  attr_reader  :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "
    INSERT INTO artist(
      name
    )
    VALUES
    (
      $1
      ) RETURNING id"
      values=[@name]
      @id = SqlRunner.run(sql,values)[0]['id'].to_i
    end


    def delete()
      sql = "DELETE
      FROM artist
      WHERE id =$1"
      values=[@id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all
      sql = "DELETE FROM artist"
      SqlRunner.run(sql)
    end

    def self.list_all
      sql = "SELECT * FROM artist"
      artists = SqlRunner.run(sql)
      return artists.map { |artist| Artist.new(artist) }
    end


  end
