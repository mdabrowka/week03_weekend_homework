require_relative("../db/sql_runner.rb")

  class Film
    attr_reader :id
    attr_accessor :title, :price

    def initialize(options)
      @id = options['id'].to_i
      @title = options['title']
      @price = options['price'].to_i
    end


    def save()
      sql = "
      INSERT into films
      (title, price) VALUES ($1, $2) RETURNING id"
      values = [@title, @price]
      film = SqlRunner.run(sql, values).first
      @id = film['id'].to_i
    end


    def self.all()
      sql = "SELECT * FROM films"
      values = []
      saved_films = SqlRunner.run(sql, values)
      result = saved_films.map{|film| Film.new(film)}
      return result
    end


  end
