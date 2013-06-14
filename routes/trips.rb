module Routes
  class Trips < Cuba
    define do
      on ":id" do |id|
        break unless trip = Trip[id]

        with trip_id: id do

          on "invites" do
            run Routes::Invites
          end

          on root do
            message = CGI.escape("Welcome to Tripkada! Plan your trips here with us and get ready to go on the adventure of your life!")

            user_render "trips/index", trip: trip, message: message
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
