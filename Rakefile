task :seed do
  require_relative "app"
  require "faker"

  Ohm.flush

  user1 = User.create(first_name: "Luis", last_name: "Vega", fb_id: "1580575903",
                email: "luis@gmail.com", password: "pass1234")
  user2 = User.create(first_name: "Macky", last_name: "Tamayo", fb_id: "1454658543",
                email: "macky@gmail.com", password: "pass1234")
  user3 = User.create(first_name: "Jaq", last_name: "Uy", fb_id: "1610290460",
                email: "jaq@gmail.com", password: "pass1234")
  user4 = User.create(first_name: "Maureen", last_name: "Padilla", fb_id: "573365192",
                email: "maureen@gmail.com", password: "pass1234")
  user5 = User.create(first_name: "Karla", last_name: "Flores", fb_id: "602041929",
                email: "karla@gmail.com", password: "pass1234")
  user6 = User.create(first_name: "Gian", last_name: "Javellana", fb_id: "582469198",
                email: "gian@gmail.com", password: "pass1234")
  user7 = User.create(first_name: "Juris", last_name: "Parojinog", fb_id: "736040505",
                email: "juris@gmail.com", password: "pass1234")
  user8 = User.create(first_name: "Kristia", last_name: "Veloso", fb_id: "1121232745",
                email: "kristia@gmail.com", password: "pass1234")
  user9 = User.create(first_name: "Nina", last_name: "Niguidula", fb_id: "580592425",
                email: "nina_n@gmail.com", password: "pass1234")
  user10 = User.create(first_name: "MM", last_name: "Tan", fb_id: "773326638",
                email: "mm@gmail.com", password: "pass1234")
  user11 = User.create(first_name: "Dannie", last_name: "Manriza", fb_id: "610901723",
                email: "dannie@gmail.com", password: "pass1234")
  user12 = User.create(first_name: "Tessa", last_name: "Gromia", fb_id: "660190590",
                email: "tessa@gmail.com", password: "pass1234")
  user13 = User.create(first_name: "Jackie", last_name: "Vega",
                email: "jackie@gmail.com", password: "pass1234")

  trip = Trip.create(name: "LaBora Day", destination: "Boracay",
                     start_date: "2014-05-01", end_date: "2014-05-03")

  Invite.create(trip: trip, user: user1)
  Invite.create(trip: trip, user: user2)
  Invite.create(trip: trip, user: user3, thoughts: Faker::Lorem.paragraph(rand(1..5))).update(status: "going")
  Invite.create(trip: trip, user: user4, thoughts: Faker::Lorem.paragraph(rand(1..5))).update(status: "not going")
  Invite.create(trip: trip, user: user5, thoughts: Faker::Lorem.paragraph(rand(1..5))).update(status: "going")
  Invite.create(trip: trip, user: user6, thoughts: Faker::Lorem.paragraph(rand(1..5))).update(status: "going")
  Invite.create(trip: trip, user: user7, thoughts: Faker::Lorem.paragraph(rand(1..5))).update(status: "going")
  Invite.create(trip: trip, user: user8, thoughts: Faker::Lorem.paragraph(rand(1..5))).update(status: "not going")
  Invite.create(trip: trip, user: user9, thoughts: Faker::Lorem.paragraph(rand(1..5))).update(status: "going")
  Invite.create(trip: trip, user: user10, thoughts: Faker::Lorem.paragraph(rand(1..5))).update(status: "going")
  Invite.create(trip: trip, user: user11, thoughts: Faker::Lorem.paragraph(rand(1..5))).update(status: "not going")
  Invite.create(trip: trip, user: user12, thoughts: Faker::Lorem.paragraph(rand(1..5))).update(status: "going")

  PendingInvite.create(trip: trip, fb_id: "614161791", first_name: "Jeff", last_name: "Ferrer")
  PendingInvite.create(trip: trip, fb_id: "515468046", first_name: "Keslie", last_name: "Dellosa")
  PendingInvite.create(trip: trip, fb_id: "614602820", first_name: "Lisa", last_name: "Tantuco")

end
