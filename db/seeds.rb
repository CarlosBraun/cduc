# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
u1 = User.create! :name => 'Carlos', :last_name => "Braun", :email => 'cibraun@miuandes.cl', :password => 'Carlitosb1', :password_confirmation => 'Carlitosb1', :telephone => "56999393618"
u2 = User.create! :name => 'Chino', :last_name => "Rios", :email => 'crios@todopadel.cl', :password => 'admin1', :password_confirmation => 'admin1', :telephone => "56999393618"
u3 = User.create! :name => 'Elon', :last_name => "Musk", :email => 'emusk@tesla.com', :password => 'admin1', :password_confirmation => 'admin1', :telephone => "56999393618"
u1 = User.create! :name => 'Alberto', :last_name => "Plaza", :email => 'aplaza@gmail.cl', :password => 'admin1', :password_confirmation => 'admin1', :telephone => "56999393618"
u2 = User.create! :name => 'Marcia', :last_name => "Neke", :email => 'losmalvekes@eventos.cl', :password => 'admin1', :password_confirmation => 'admin1', :telephone => "56999393618"
u3 = User.create! :name => 'Lewis', :last_name => "Hammilton", :email => 'saddly_w13@amg.com', :password => 'admin1', :password_confirmation => 'admin1', :telephone => "56999393618"