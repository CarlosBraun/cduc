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

s1 = Supervisor.create(email: "cibraun@miuandes.cl", name: "Carlos", last_name: "Braun", telephone: "+56999393618", encrypted_password: "admin1")

se1 = SupportExecutive.create(email: "emusk@tesla.com", name: "Elon", last_name: "Musk", telephone: "+5699837483", encrypted_password: "admin1", supervisor: s1)
se2 = SupportExecutive.create(email: "dmartinez@support.com", name: "Diego", last_name: "Martinez", telephone: "+5697849618", encrypted_password: "admin1", supervisor: s1)
se3 = SupportExecutive.create(email: "sisella@support.com", name: "Steffano", last_name: "Isella", telephone: "+56946584912", encrypted_password: "admin1", supervisor: s1)

i1 = Incident.create(creation_date: "2022-03-19 15:00", summary: "Product fail.", description: "Screen comes broke")
i2 = Incident.create(creation_date: "2022-03-19 15:00", summary: "New failure.", description: "Also the buttons don't work.")
i3 = Incident.create(creation_date: "2022-03-19 15:00", summary: "Bad attention", description: "Seller was rude.")
i4 = Incident.create(creation_date: "2022-03-19 15:00", summary: "Smells bad.", description: "Box comes with a bad smell.")

t1 = Ticket.create(created_at: "2022-03-19 15:00", priority: "Urgent", state: "Open", response: "We are working for you!", tags:"badquality", docs: "https://drive.google.com/file/d/1eOgA2UwlsHV5i8ybhjpSkrnzKHlol2v-/view?usp=sharing", rating: 3, user: u1, incident: i1, support_executive: se1)
t2 = Ticket.create(priority: "High", state: "Closed", response: "We are working for you!", tags:"angry", docs: "https://drive.google.com/file/d/1eOgA2UwlsHV5i8ybhjpSkrnzKHlol2v-/view?usp=sharing", rating: 4, user: u1, incident: i2, support_executive: se2)
t3 = Ticket.create(priority: "Low", state: "Reopened", response: "We are working for you!", tags:"product", docs: "https://drive.google.com/file/d/1eOgA2UwlsHV5i8ybhjpSkrnzKHlol2v-/view?usp=sharing", rating: 5, user: u1, incident: i3, support_executive: se2)

c1 = Comment.create(comment: "Coment line 1, user so angry.", support_executive: se1, ticket: t1)
c2 = Comment.create(comment: "Coment line 2, user so happy.", support_executive: se1, ticket: t1)
c3 = Comment.create(comment: "Coment line 3, user so anoying.",  support_executive: se1, ticket: t1)