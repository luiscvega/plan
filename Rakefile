task :seed do
  require_relative "app"
  require "faker"

  Ohm.flush

  user1 = User.create(firstname: "Luis", lastname: "Vega", fb_id: "1580575903",
                email: "luis@gmail.com", password: "pass1234")
  user2 = User.create(firstname: "Macky", lastname: "Tamayo", fb_id: "1454658543",
                email: "macky@gmail.com", password: "pass1234")
  user3 = User.create(firstname: "Jaq", lastname: "Uy", fb_id: "1610290460",
                email: "jaq@gmail.com", password: "pass1234")
  user4 = User.create(firstname: "Maureen", lastname: "Padilla", fb_id: "573365192",
                email: "maureen@gmail.com", password: "pass1234")
  user5 = User.create(firstname: "Keslie", lastname: "Dellosa", fb_id: "515468046",
                email: "keslie@gmail.com", password: "pass1234")
  user6 = User.create(firstname: "Karla", lastname: "Flores", fb_id: "602041929",
                email: "karla@gmail.com", password: "pass1234")

  trip = Trip.create(name: "LaBora Day", destination: "Boracay",
                     start_date: "2014-05-01", end_date: "2014-05-03")

  Invite.create(trip: trip, user: user1)
  Invite.create(trip: trip, user: user2)
  Invite.create(trip: trip, user: user3, thoughts: Faker::Lorem.paragraph(rand(1..5))).update(status: "going")
  Invite.create(trip: trip, user: user4, thoughts: Faker::Lorem.paragraph(rand(1..5))).update(status: "not going")
  Invite.create(trip: trip, user: user5, thoughts: Faker::Lorem.paragraph(rand(1..5))).update(status: "going")
  Invite.create(trip: trip, user: user6, thoughts: Faker::Lorem.paragraph(rand(1..5))).update(status: "going")

end
