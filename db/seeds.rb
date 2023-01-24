# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
u1 = User.create! :name => 'Carlos', :last_name => "Braun", :email => 'cibraun@miuandes.cl', :mail => 'cibraun@miuandes.cl', :password => 'Carlitosb1', :password_confirmation => 'Carlitosb1', :telephone => "56999393618"
u2 = User.create! :name => 'Chino', :last_name => "Rios", :email => 'crios@todopadel.cl', :password => 'admin1', :password_confirmation => 'admin1', :telephone => "56999393618"
u3 = User.create! :name => 'Elon', :last_name => "Musk", :email => 'emusk@tesla.com', :password => 'admin1', :password_confirmation => 'admin1', :telephone => "56999393618"
u4 = User.create! :name => 'Alberto', :last_name => "Plaza", :email => 'aplaza@gmail.cl', :password => 'admin1', :password_confirmation => 'admin1', :telephone => "56999393618"
u5 = User.create! :name => 'Marcia', :last_name => "Neke", :email => 'losmalvekes@eventos.cl', :password => 'admin1', :password_confirmation => 'admin1', :telephone => "56999393618"
u6 = User.create! :name => 'Lewis', :last_name => "Hammilton", :email => 'saddly_w13@amg.com', :password => 'admin1', :password_confirmation => 'admin1', :telephone => "56999393618"

j1 = Jugador.create! :name => 'Carlos',:name2 => 'Carlos', :last_name1 => "Braun", :last_name2 => "Herrera", :mail => 'cibraun@miuandes.cl', :telephone => "56999393618" ,:rut => "20.073.279-0"

e1 = Entrenador.create! :name => 'Rodrigo', :rol => 'Head Coach', :last_name => "Grimalt", :mail => 'rgrimalt@uc.cl', :telephone => "56999393618"
e2 = Entrenador.create! :name => 'Felipe', :rol => 'Coach', :last_name => "Papagallo", :mail => 'fpapagallo@uc.cl', :telephone => "56999393618"
e3 = Entrenador.create! :name => 'Rodrigo', :rol => 'Coach', :last_name => "Pulgar", :mail => 'rpulgar@uc.cl', :telephone => "56999393618"