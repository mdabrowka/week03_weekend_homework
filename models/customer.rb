require_relative("../db/sql_runner.rb")


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

  end
