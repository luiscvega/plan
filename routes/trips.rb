module Routes
  class Trips < Cuba
    define do
      on ":id" do |id|
        break unless trip = Trip[id]

        with trip_id: id do
          on post, "status", param("invite") do |dict|
            current_invite.update(dict)

            res.redirect "/trips/%s" % current_invite.trip.id, "303"
          end

          on root do
            user_render "trips/index", trip: trip
          end
        end
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
