module Routes
  class Invites < Cuba
    define do
      trip = Trip[vars[:trip_id]]

      on put, param("invite") do |dict|
        current_invite.update(dict)

        res.redirect "/trips/%s" % current_invite.trip.id, "303"
      end

      on get, param("to") do |dict|
        ids = dict.values
        invites = []

        ids.each do |id|
          # SCENARIO 1: Invited user DOES NOT have a Tripkada account
          json = JSON.parse(Net::HTTP.get(URI("http://graph.facebook.com/#{id}")))

          # SCENARIO 1.A: Invited user IS NOT a PendingUser
          unless pending_user = PendingUser.find(fb_id: id).first
            pending_user = PendingUser.create(
              first_name: json["first_name"],
              last_name: json["last_name"],
              fb_id: json["id"]
            )
          end

          unless pending_invite = PendingInvite.find(pending_user_id: pending_user.id, trip_id: trip.id).first
            pending_invite = PendingInvite.create(
              pending_user: pending_user,
              trip: trip
            )
          end
        end

        res.redirect "/trips/%s" % trip.id
      end

    end
  end
end
