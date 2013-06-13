task :seed do
  require_relative "app"

  Ohm.flush

  user1 = User.create(firstname: "Luis", lastname: "Vega", fb_id: "1580575903",
                email: "luis@gmail.com", password: "pass1234")
  user2 = User.create(firstname: "Macky", lastname: "Tamayo", fb_id: "1454658543",
                email: "macky@gmail.com", password: "pass1234")
  user3 = User.create(firstname: "Jaq", lastname: "Uy", fb_id: "1610290460",
                email: "jaq@gmail.com", password: "pass1234")
  user4 = User.create(firstname: "Maureen", lastname: "Padilla", fb_id: "573365192",
                email: "maureen@gmail.com", password: "pass1234")

  trip = Trip.create(name: "LaBora Day", destination: "Boracay",
                     start_date: "2014-05-01", end_date: "2014-05-03")

  Invite.create(trip: trip, user: user1, thoughts: "Sige game ako! I can bring a car if you guys want. Parang Kawayan Cove lang pero with Dahoodz!")
  Invite.create(trip: trip, user: user2, thoughts: "Here we go!")
  Invite.create(trip: trip, user: user3, thoughts: "Let's go!")
  Invite.create(trip: trip, user: user4, thoughts: "Not sure if pwede ako. I still have to check if I'm free during those dates.")

end
