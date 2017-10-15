require_relative("../db/sql_runner.rb")
require_relative("film.rb")
require_relative("ticket.rb")

  class Customer
    attr_reader :id
    attr_accessor :name, :funds

    def initialize(options)
      @id = options['id'].to_i
      @name = options['name']
      @funds = options['funds'].to_i
    end

    def save()
      sql = "
      INSERT into customers
      (name, funds) VALUES ($1, $2) RETURNING id"
      values = [@name, @funds]
      customer = SqlRunner.run(sql, values).first
      @id = customer['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM customers"
      values = []
      saved_customers = SqlRunner.run(sql, values)
      result = saved_customers.map{|customer| Customer.new(customer)}
      return result
    end

    def self.delete_all()
      sql = "DELETE FROM customers"
      values = []
      SqlRunner.run(sql, values)
    end

    def delete
      sql = "DELETE FROM customers
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def update
      sql = "UPDATE customers
      SET (name, funds) = ($1, $2) WHERE id = $3"
      values = [@name, @funds, @id]
      SqlRunner.run(sql, values)
    end

      def list_films
        sql = "SELECT films.* FROM films
        INNER JOIN tickets
        ON films.id = tickets.film_id
        WHERE customer_id = $1"
        values = [@id]
        results = SqlRunner.run(sql, values)
        films = results.map{|film| Film.new(film)}
        return films
      end


     def film_number
       return list_films.length
     end

      def pay_for_ticket
        film_array = list_films
        for film in film_array
          result = @funds - film.price
        @funds = result
         end
        update
      end


  end
