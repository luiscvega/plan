task :seed do
  require_relative "app"

  Ohm.flush

  user1 = User.create(firstname: "Luis", lastname: "Vega",
                email: "luis@gmail.com", password: "pass1234")
  user2 = User.create(firstname: "Macky", lastname: "Tamayo",
                email: "macky@gmail.com", password: "pass1234")
  user3 = User.create(firstname: "Jaq", lastname: "Uy",
                email: "jaq@gmail.com", password: "pass1234")
  user4 = User.create(firstname: "Maureen", lastname: "Padilla",
                email: "maureen@gmail.com", password: "pass1234")

  trip = Trip.create(name: "LaBora Day", destination: "Boracay",
                     start_date: "2014-05-01", end_date: "2014-05-03")

  Invite.create(trip: trip, user: user1)
  Invite.create(trip: trip, user: user2)
  Invite.create(trip: trip, user: user3)
  Invite.create(trip: trip, user: user4)



end

