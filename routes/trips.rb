module Routes
  class Trips < Cuba
    define do
      on ":id" do |id|
        break unless trip = Trip[id]

        user_render "trips/index", trip: trip
      end

      on post, param("trip") do |dict|
        trip = Trip.create(dict)
        Invite.create(trip: trip, user: current_user)
        res.redirect "/trips/%s" % trip.id, "303"
      end

      on "new" do
        user_render "trips/new"
      end
    end
  end
end
