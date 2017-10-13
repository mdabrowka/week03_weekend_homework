require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')

require('pry')

 Customer.delete_all
 Film.delete_all


customer1 = Customer.new({'name' => 'Flora',
  'funds' => '50'})

customer1.save

customer2 = Customer.new({'name' => 'Lola',
  'funds' => '30'})

customer2.save

film1 = Film.new({'title' => 'The Hours',
'price' => '10'})

film1.save

film2 = Film.new({'title' => 'The Graduate',
'price' => '15'})

film2.save


ticket1 = Ticket.new({'customer_id' => customer1.id,
  'film_id' => film1.id})
ticket1.save


binding.pry
nil
