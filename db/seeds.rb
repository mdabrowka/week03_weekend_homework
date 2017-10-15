require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')

require('pry')

 Customer.delete_all
 Film.delete_all


#CUSTOMERS
customer1 = Customer.new({'name' => 'Flora',
  'funds' => '50'})
customer1.save

customer2 = Customer.new({'name' => 'Lola',
  'funds' => '30'})
customer2.save

customer3 = Customer.new({'name' => 'Frankie',
  'funds' => '80'})
customer3.save


#FILMS
film1 = Film.new({'title' => 'The Hours',
'price' => '10'})
film1.save

film2 = Film.new({'title' => 'The Graduate',
'price' => '15'})
film2.save

 film3 = Film.new({'title' => 'Lola rennt',
 'price' => '12'})
 film3.save

 film4 = Film.new({'title' => 'Amelie',
  'price' => '11'})
  film4.save

#TICKETS
ticket1 = Ticket.new({'customer_id' => customer1.id,
  'film_id' => film1.id})
ticket1.save

ticket2 = Ticket.new({'customer_id' => customer2.id,
  'film_id' => film2.id})
ticket2.save

 ticket3 = Ticket.new({'customer_id' => customer3.id,
   'film_id' => film1.id})
 ticket3.save

 ticket4 = Ticket.new({'customer_id' => customer1.id,
   'film_id' => film4.id})
 ticket4.save

binding.pry
nil
